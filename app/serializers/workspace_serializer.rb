class WorkspaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :model, :description, :address, :price, :image, :discount, :category, :user_id
end
