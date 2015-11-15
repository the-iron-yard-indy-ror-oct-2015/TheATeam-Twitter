class Post < ActiveRecord::Base

  belongs_to :user

  def self.sort_by_users
    Post.all.sort_by{|x| x.users.count}.reverse
  end

  validates :post_message, presence: true, length: {maximum: 170}
  validates :user_id, presence: true

end
