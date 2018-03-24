class Mutations::UpdateUser < GraphQL::Function
  argument :id, types.ID
  argument :name, types.String
  argument :email, types.String
  argument :phone_number, types.Int
  argument :is_admin, types.Boolean
  argument :country_id, types.Int

  type Types::UserType #country_id espeficacao do tipo de retorno

  def call(obj, args, context)
    return nil unless user = User.where(id: args[:id]).first # busca o User a ser alterado
    user.update args.to_h # altera o User
    user # Retornaa o User
  end
end
