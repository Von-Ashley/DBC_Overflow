require 'faker'

User.delete_all

users = 100.times.map do
  User.create!(
                :email      => Faker::Internet.email,
                :password   => 'password' )
end


