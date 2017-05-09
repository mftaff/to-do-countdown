4.times do
    seed_name = Faker::Name.first_name.downcase + rand(100..999).to_s

    user = User.new(
        username: seed_name,
        email: Faker::Internet.safe_email(seed_name),
        password: 'teatea',
        password_confirmation: 'teatea'
    )
    user.skip_confirmation!
    user.save!
end

admin_user = User.new(
        username: "admin_user",
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
    task.update_attribute(:expires_at, Time.now + rand(1.day .. 7.days))
end

ten_min_task = Task.create!(
    name: "Should be ten minutes remaining",
    user: User.last
    )
ten_min_task.update_attribute(:expires_at, Time.now+10.minutes)

expired_test_task = Task.create!(
    name: "I am already expired!!",
    user: User.last
    )
expired_test_task.update_attribute(:expires_at, Time.now)

puts "Seed Complete"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"
