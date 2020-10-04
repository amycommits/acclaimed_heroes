class BadgeSerializer < ActiveModel::Serializer
  attributes :id, :remote_id, :image_url, :skills
  def skills
    object.skill['skills']
  end
end
