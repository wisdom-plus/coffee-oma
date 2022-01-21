# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, 'log/crontab.log'
set :environment, :development
set :job_template,"ash -l -c ':job'"

every 15.minutes do
  command "ls"
end
