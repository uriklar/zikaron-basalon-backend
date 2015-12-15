module ZbMailer

	def self.client
		SendGrid::Client.new do |c|
  		c.api_key = ENV['sendgrid_api_key']
		end
	end

	def self.test
		mail_defaults = {
		  from: 'admin@email.com',
		  html: ' ',
		  text: ' ',
		  subject: 'Email is great',
		}

		recipient = SendGrid::Recipient.new('uriklar@gmail.com')
		recipient.add_substitution('-first_name-','Uri')
		recipients = [recipient]
	  template = SendGrid::Template.new('3246d7b3-36c6-4ef0-aee4-d0cb87da4e60')
		mailer = SendGrid::TemplateMailer.new(self.client, template, recipients)
		mailer.mail(mail_defaults)
	end

end