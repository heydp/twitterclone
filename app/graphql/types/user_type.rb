# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String
    field :email, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :password_digest, String
    field :remember_digest, String
    field :admin, Boolean
    field :activation_digest, String
    field :activated, Boolean
    field :activated_at, GraphQL::Types::ISO8601DateTime
    field :reset_digest, String
    field :reset_sent_at, GraphQL::Types::ISO8601DateTime
    field :group, Boolean
    field :micropost, [Types::MicropostType], null: true

    # field :relationship, [Types::RelationshipType], null: true

# ------------------------P------------------------------------
    # field :relationshipid, [Integer], null: true
    # field :followerlist, [Types::UserType], null: true
    # field :followercount, Integer
    # field :followerlisttry, UserType, null: true

# ------------------------P------------------------------------
    def micropost
      object.microposts.all
    end
    # def relationship
    #   object.followers.all
    # end
# -----------------------------------------------
    # def relationshipid
    #   @followersid1 = object.followers.ids
    # end


    # def followerlist
    #    @followersid = object.followers.ids
    #    @followers = []
    #    @followersid.each do |i|
    #      user = User.find(i)
    #      @followers.push(user)
    #    end
    #   return @followers


    #   #object.followers.all
    # end
    # def followerlisttry
    #   @idtry = @followersid1.second
    #   User.find(@idtry)
    # end

    # def followercount
    #   @followersid1.count
    # end

    # all tryyyyyyyyiiiiinnnnggg 
  end
end
