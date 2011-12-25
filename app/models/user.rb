class User < ActiveRecord::Base
  acts_as_authentic do |config|
    # Add custom configuration options here
    config.crypto_provider = Authlogic::CryptoProviders::Sha1
  end
end
