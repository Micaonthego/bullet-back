class BulletSerializer < ActiveModel::Serializer
  attributes :id, :gratitude, :priority, :accomplishment, :reflection, :favorite, :photo, :date

  belongs_to :user
end
