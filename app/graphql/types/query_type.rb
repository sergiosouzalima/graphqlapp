Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  # chamamos o field de "user" e ele terá um
  # namespace chamado "Types" que chamamos
  # de "UserType"
  field :user, Types::UserType do
    # passamos aqui o "id" do User como argumento de consulta
    # esse valor de "id" vem do front-end para o back-end
    argument :id, types.ID # o "id" tem um tipo especial chamado ID
    description "Identificação do Usuario"

    # aqui é o método chamado "resolve" que resgata
    # os dados de User do banco de dados
    resolve -> (obj, args, ctx) {
      User.where(id: args[:id]).first
    }
  end

  field :allUsers, types[Types::UserType] do
    description "Retorna todos Usuarios"

    resolve -> (obj, args, ctx) {
      User.all
    }
  end
end
