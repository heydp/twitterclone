module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :userss, [Types::UserType], null: false do
      description "Query to find all users"
    end
    field :user_details, Types::UserType, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end
    


    def userss
      return User.all
    end
    def user_details(email:, password:)
      thatuser = User.find_by(email: email)
      if(thatuser && thatuser.authenticate(password))
        return thatuser
      else
        return null
      end
    end
  end
end
