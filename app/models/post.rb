class Post < ActiveRecord::Base

  belongs_to :user

  validates :post_message, presence: true, length: {maximum: 170}
  validates :user_id, presence: true

end
