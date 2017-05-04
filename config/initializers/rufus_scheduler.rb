require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.cron '00 12 * * *' do
    Task.where("created_at <= ?", Time.now - 7.days).update_all(expired: true)
end

# This is not set up for production
# To set up see https://richonrails.com/articles/background-tasks-with-rufus-scheduler
# If that doesn't help, here is some information:
# The scheduler's timers do not persist through server shutdown.
