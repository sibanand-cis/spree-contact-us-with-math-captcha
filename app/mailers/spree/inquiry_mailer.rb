class Spree::InquiryMailer < ActionMailer::Base

  def notification(inquiry, resend=false)
  	recipients = Spree::MailMethod.current.preferred_mail_bcc.split()
  	recipients = Spree::MailMethod.current.preferred_intercept_email unless Spree::MailMethod.current.preferred_intercept_email.blank?
    @inquiry = inquiry
    mail(:from => inquiry.email, :to => recipients, :subject => "#{Spree::Config[:site_name]} : #{I18n.t(:contact_form)}")
  end

end
