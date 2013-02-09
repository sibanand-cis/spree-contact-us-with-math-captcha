class Spree::Inquiry < ActiveRecord::Base
  has_captcha
  attr_accessible :name, :email, :inquiry_type, :order_no, :message, :captcha_solution, :captcha_secret
  validates :name ,:presence => true
  validates :email ,:presence => true
  validates :message ,:presence => true
   
 after_save :deliver_notification_email


  def deliver_notification_email
    Spree::InquiryMailer.notification(self).deliver
    # For delayed_job
    # InquiryMailer.send_later(:deliver_notification, self)
  end


end
