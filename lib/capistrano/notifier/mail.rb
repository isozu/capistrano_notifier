#require 'capistrano/notifier'

require 'action_mailer'

class Capistrano::Notifier::Mailer < ActionMailer::Base
  if ActionMailer::Base.respond_to?(:mail)
    def notice(to, from, delivery_method, stage, branch, revision, prev, log, deployer)

      text =<<-MSG
        Deployment completed.
        Author:\t #{deployer}
        Branch:\t #{branch}
        Stage:\t #{stage}
        Rev:\t #{revision}

        #{log}

      MSG
      mail({
        subject: "#{deployer} has deployed the #{stage}",
        body: text,
        delivery_method: delivery_method,
        from: from,
        to: to
      })
    end
  end
end
