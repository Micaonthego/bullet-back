class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :photo, :aspiration
end
