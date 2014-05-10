# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

# KekeOfficialWebsite::Application.config.secret_token = 'e8bc6315550a823e603d8e2a7e48e8f7151f76be7aed5b46d0f366d2d918fd608a3274a475bddf531eaf2d390bd165534e52922b9ba45490270ad2bedc81537d'

KekeOfficialWebsite::Application.config.secret_token = secure_token

