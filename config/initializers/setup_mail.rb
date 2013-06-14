ActionMailer::Base.smtp_settings = {
	:address				=> "smtp.gmail.com",
	:port					=> 587,
	:domain					=> "gmail.com",
	:user_name				=> "IMI.Prakti.Info",
	:password				=> "imimaps7",
	:authentication			=> "plain",
	:enable_starttls_auto	=> true
}