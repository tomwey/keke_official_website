require 'apns'

namespace :apns do
  task :send => :environment do
    # APNS.host = 'gateway.push.apple.com'
    APNS.pem = "#{Rails.root}/config/dev-cert.pem"
    APNS.pass = '123456'

    APNS.cache_connections = true

    device_token = '9f1418513222308a905088bd1ac15636f74b343e59830ab21cfbbb5b14fe91e4'

    APNS.send_notification(device_token, 'Hello iPhone! 4567')
  end
  
end