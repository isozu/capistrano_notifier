module Capistrano
  class FileNotFound < StandardError
  end
end

require 'action_mailer'

namespace :deploy do
  desc 'Notification via email'
  task :notify do
    deployer = `git config --get user.name`.strip

    current_revision = fetch :current_revision
    previous_revision = fetch :previous_revision
    log = ""

    on roles(:web) do
      within release_path do
        log = capture("cd #{repo_path} && git --no-pager log --pretty=\"format:%h - %s (%ar) <%an>\" #{previous_revision}..#{current_revision}")
      end
    end

    run_locally do
      options = fetch(:notifier_mail_options)

      Capistrano::Notifier::Mailer.notice(
        options[:to], options[:from], options[:delivery_method],
        fetch(:stage), fetch(:branch), current_revision, previous_revision, log, deployer
      ).deliver
    end
  end
end
