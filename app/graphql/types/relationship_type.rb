# frozen_string_literal: true

module Types
  class RelationshipType < Types::BaseObject
    field :id, ID, null: false
    field :follower_id, Integer
    field :followed_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
