class AdminMailer < ActionMailer::Base
  # This class appears to be unused. Thus: excluding from coverage
  # :nocov:

  default to: Proc.new {Admin.pluck(:email)},
  		  from: "notification@imi-maps.com"

  def receive(email)
  	page = Page.find_by_address(email.to.first)
  	page.emails.create(
  	  subject: email.subject,
  	  body: email.body
  	)

  	if email.has_attachments?
  	  email.attachments.each do |attachment|
  	  	page.attachments.create({file: attachment, description: email.subject})
  	  end
  	end
  end

  # :nocov:
end
