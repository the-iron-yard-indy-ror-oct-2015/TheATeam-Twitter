class User < Authlogic::Session::Base

  acts_as_authentic do |c|
    c.login_field :username
  end

  has_many :posts

end
