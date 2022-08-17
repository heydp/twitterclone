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

    # field :userss, [Types::UserType], null: false do
    #   description "Query to find all users"
    # end
    field :user_details, Types::UserType, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    field :user_followers, [Types::UserType], null: false do
      argument :email, String, required: true
    end


    # def userss
    #   return User.all
    # end
    # def user_details(email:, password:)
    #   @thatuser = User.find_by(email: email)
    #   if(@thatuser && @thatuser.authenticate(password))
    #       {
    #         user: @thatuser,
    #         errors: []
    #       }
    #   else
    #       {
    #         user: null
    #         errors:@thatuser.errors.full_messages
    #       }
    #   end
    # end

    def user_details(email:, password:)
      @userdetails = User.find_by(email: email)
      if(@userdetails && @userdetails.authenticate(password))
           @userdetails
      else
          null
      end
    end

    def user_followers(email:)
      @userfollowers = User.find_by(email: email)
      return @userfollowers.followers.all
    end
    
  end
end
