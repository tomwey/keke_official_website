# coding: utf-8
class Twit < ActiveRecord::Base
  attr_accessible :app_id, :content, :sound, :badge, :is_debug
  
  validates_presence_of :app_id, :content
  
  belongs_to :app
  
  def app_name
    app.name
  end
  
  before_save :send_twit
  def send_twit
    pusher = Grocer.pusher(
      certificate: self.certificate,      # required
      passphrase:  "123456",              # optional
      gateway:     self.gateway,          # optional; See note below.
      port:        2195,                  # optional
      retries:     3                      # optional
    )
    
    tokens = DeviceToken.where(:app_id => self.app_id)
    tokens.each do |token|
      notification = Grocer::Notification.new(
        device_token:      token.token,
        alert:             self.content,
        badge:             self.badge,
        sound:             self.sound_name,      # optional
        expiry:            Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
        identifier:        1234,                 # optional
        content_available: true                  # optional; any truthy value will set 'content-available' to 1
      )
      pusher.push(notification)
    end
    
  end
  
  def sound_name
    sound || "siren.aiff"
  end
  
  def gateway
    if self.is_debug
      "gateway.sandbox.push.apple.com"
    else
      "gateway.push.apple.com"
    end
  end
  
  def certificate
    if self.is_debug
      "#{Rails.root}/config/dev-cert.pem"
    else
      "#{Rails.root}/config/prod-cert.pem"
    end
  end
  
end
