# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :api do
  desc 'Creates Api User. User url is required'
  task :create_user, [:url] => [:environment] do |_t, args|
    user = ApiUser.create!(url: args[:url])
    puts "New user created with api key: #{user.api_key}"
  end
end
