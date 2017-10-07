class V1::BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand, :price, :store
end