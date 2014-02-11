#require 'capistrano/notifier'

require 'action_mailer'

class Capistrano::Notifier::Mailer < ActionMailer::Base
  if ActionMailer::Base.respond_to?(:mail)
    def notice(to, from, delivery_method, stage, branch, revision)
      text =<<-MSG
        Deployment completed.
        Branch:\t #{branch}
        Stage:\t #{stage}
        Rev:\t #{revision}
      MSG
      mail({
        subject: "Deployed [#{branch}] to #{stage}",
        body: text,
        delivery_method: delivery_method,
        from: from,
        to: to
      })
    end
  end
end
