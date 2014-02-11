module Capistrano
  class FileNotFound < StandardError
  end
end

require 'action_mailer'

namespace :deploy do
  desc 'Notification via email'
  task :notify do
    run_locally do
      set :revision, capture(:git, :'rev-parse', fetch(:branch))
      options = fetch(:notifier_mail_options)
      Capistrano::Notifier::Mailer.notice(
                options[:to], options[:from], options[:delivery_method], 
		fetch(:stage), fetch(:branch),
                fetch(:revision)).deliver
    end
  end
end
