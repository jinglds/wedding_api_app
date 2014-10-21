# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

WeddingApiApp::Application.config.secret_key_base = secure_token

#WeddingApiApp::Application.config.secret_key_base = '6e7a4f12349c3332130ffdb505c0f18fc5f86e3e340fb83b92ab4f3f868a2794ecb1cdf5210f87dd818fa4c51a0f8ee21ea27943eecd440619e443a0672e508a'
