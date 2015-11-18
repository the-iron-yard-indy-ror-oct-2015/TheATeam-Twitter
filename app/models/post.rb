class Post < ActiveRecord::Base

  belongs_to :user

  def self.sort_by_users
    Post.all.sort_by{|x| x.users.count}.reverse
  end

  def self.timeline(user)
    following_ids = user.all_following.map(&:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end

  validates :message, presence: true, length: {maximum: 170}
  validates :user_id, presence: true

end
