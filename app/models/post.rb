class Post < ActiveRecord::Base


  belongs_to :user
  has_many :post_messages


validates :post_message, presence: true, length: {maximum: 170}
validates :user_id, presence: true


end
