class User < ActiveRecord::Base
  acts_as_authentic do |config|
    # Add custom configuration options here
    config.crypto_provider = Authlogic::CryptoProviders::Sha1
  end

  validates_format_of :first_name, :with => /[a-zA-Z ]/
end
