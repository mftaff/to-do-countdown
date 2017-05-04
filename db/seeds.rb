4.times do
    user = User.new(
        email: Faker::Internet.safe_email,
        password: 'teatea',
        password_confirmation: 'teatea'
    )
    user.skip_confirmation!
    user.save!
end

admin_user = User.new(
        email: 'admin@user.test',
        password: 'teatea',
        password_confirmation: 'teatea'
    )
admin_user.skip_confirmation!
admin_user.save!

users = User.all

50.times do 
    task = Task.create!(
        name: Faker::Company.bs,
        user: users.sample
    )
    task.update_attribute(:created_at, rand(0.minutes .. 5.days).ago)
end

test_task = Task.create!(
    name: "test for time remaining",
    user: User.last
    )
test_task.update_attribute(:created_at, (7.days-5.minutes).ago)

puts "Seed Complete"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"
