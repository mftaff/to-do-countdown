namespace :todo do
  desc "Deletes any to-do list item older than seven days."
  task delete_items: :environment do
    Task.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
  
  desc "Updates expired tag to true on all tasks older than 7 days"
  task expire_items: :environment do
    Task.where("created_at <= ?", Time.now - 7.days).update_all(expired: true)
  end

end
