# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  user = User.new

  user.email = Faker::Internet.email
  user.username = Faker::Internet.user_name
  user.password = Faker::Internet.password
  user.password_confirmation = user.password
  user.save!

  100.times do
    post = Post.new
    post.message = Faker::Lorem.sentences(2).join(" ")
    post.created_at = Faker::Time.between(DateTime.now - 1, DateTime.now)
    post.user = user
    post.save!

  end
end
