class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :profile_picture, :skill_set
  has_many :badges
  
  def skill_set
    skills = []
    object.badges.each do |badge|
      badge.skill['skills'].each do |skill|
        skills.push(skill)
      end
    end
    skills = Set.new(skills)
  end
end
