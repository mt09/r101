class Group < ActiveRecord::Base
  validates :title, presence: true

  has_many :posts

  belongs_to :owner, class_name: "User", foreign_key: :user_id

  def editable_by?(user)
    user && user == owner
  end

  has_many :group_users
  has_many :members, throught: :group_users, source: :group
end
