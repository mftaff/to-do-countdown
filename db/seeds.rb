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
    Task.create!(
        name: Faker::Company.bs,
        user: users.sample
    )
end

puts "Seed Complete"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"
