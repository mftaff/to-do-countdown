4.times do
    seed_name = Faker::Name.first_name.downcase + rand(100..999).to_s
    seed_email = Faker::Internet.safe_email(seed_name)

    user = User.new(
        username: seed_name,
        email: seed_email,
        email_name: "",
        password: 'teatea',
        password_confirmation: 'teatea'
    )
    user.skip_confirmation!
    user.save!
end

2.times do
    seed_email = Faker::Internet.safe_email
    
    user = User.new(
        username: Faker::Name.first_name.downcase + rand(100..999).to_s,
        email: seed_email,
        email_name: "",
        password: 'teatea',
        password_confirmation: 'teatea'
    )
    user.skip_confirmation!
    user.save!
end

admin_user = User.new(
        username: "admin_user",
        email: 'admin@user.test',
        email_name: 'admin',
        password: 'teatea',
        password_confirmation: 'teatea'
    )
admin_user.skip_confirmation!
admin_user.save!

users = User.all

list_titles = ["To-Do", "Groceries", "Daily Tasks", "On the way home", "TO DO", "For Work", "Vacation Checklist"]

17.times do
    list = List.create(
        title: list_titles.sample,
        user: users.sample
    )
    
    rand(4..10).times do
        Task.create!(
            name: Faker::Company.bs,
            user: list.user,
            list: list,
            expires_at: Time.now + rand(1.day .. 7.days)
        )
    end
end

Task.create!(
    name: "Should be ten minutes remaining",
    user: User.last,
    list: User.last.lists.first,
    expires_at: Time.now + 10.minutes
)

Task.create!(
    name: "I am already expired!!",
    user: User.last,
    list: User.last.lists.first,
    expires_at: Time.now
)

# Create a friendship between last and first user
User.last.friend_request(User.first)
User.first.accept_request(User.last)

puts "Seed Complete"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Task.count} tasks created"
