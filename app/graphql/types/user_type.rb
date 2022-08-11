# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
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

    def micropost
      object.microposts.all
    end
  end
end
