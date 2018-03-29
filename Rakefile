# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :api do
  desc 'Create api user'
  task :create_user, %i[url] => [:environment] do |_t, args|
    user = ApiUser.create!(url: args[:url])
    puts "New user created with api key: #{user.api_key}"
  end

  desc 'Create development api user'
  task create_dev_user: :environment do
    user = ApiUser.create!(url: 'http://0.0.0.0:3001')
    user.update(api_key: 'fe98dddcab33ec21d31b038dd3')
    puts "Development user created with api key: #{user.api_key}"
  end
end
