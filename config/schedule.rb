env :MAILTO, 'sydneyitguy@gmail.com'
set :output, '/srv/web/steemhunt/shared/log/cron.log'

ROOT_DIR = '/srv/web/steemhunt/current'
RAKE_PATH = '/home/updatebot/.rbenv/shims/bundle exec rake'

every :day, at: '12:01am' do
  command "cd #{ROOT_DIR};" +
    "RAILS_ENV=#{environment} #{RAKE_PATH} sync_posts && " +
    "RAILS_ENV=#{environment} #{RAKE_PATH} voting_bot && " +
    "RAILS_ENV=#{environment} #{RAKE_PATH} sync_posts"
end

every :day, at: '5:00am' do
  command "cd #{ROOT_DIR};RAILS_ENV=#{environment} #{RAKE_PATH} daily_post"
end

every :day, at: '05:02am' do
  command "cd #{ROOT_DIR};RAILS_ENV=#{environment} #{RAKE_PATH} dump"
end
