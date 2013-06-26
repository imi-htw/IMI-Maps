class AdminMailer < ActionMailer::Base

  default to: Proc.new {Admin.pluck(:email)},
  		  from: "notification@imi-maps.com"

end
