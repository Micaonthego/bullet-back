class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :photo, :aspiration

  has_many :bullets
end
