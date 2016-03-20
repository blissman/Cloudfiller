# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/Users/blissman/Desktop/cron_log.log"
#
# setting environment to development to test that crontab is working correctly . . .
# SET TO PRODUCTION OR REMOVE BEFORE DEPLOY!
set :environment, "development"
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 1.day, at: '02:30' do
  runner "Request.expire_requests"
end
