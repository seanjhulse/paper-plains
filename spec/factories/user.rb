# This will guess the User class
FactoryBot.define do
  
  user_name = Faker::StarTrek.character.downcase.split(' ')
  user_role = User.roles.to_a.sample[0]

  factory :user do
    netid user_name[0].to_s
    email user_name[0].to_s + '.' + user_name[1].to_s + '@yahoo.star'
    role  user_role
  end

end