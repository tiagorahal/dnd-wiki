module Types
    class MonsterType < Types::BaseObject
      field :name, String, null: false
      field :index, String, null: false
      field :desc, String, null: true
      field :image, String, null: true
    end
  end
  