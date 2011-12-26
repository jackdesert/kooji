class User < ActiveRecord::Base
  acts_as_authentic do |config|
    # Add custom configuration options here
    config.crypto_provider = Authlogic::CryptoProviders::Sha1
  end

  validates_format_of :first_name, :with => /^[a-zA-Z ]+$/, :message => "(Names can only contain letters)"
  validates_format_of :last_name, :with => /^[a-zA-Z ]+$/, :message => "(Names can only contain letters)"
  validates_format_of :phone_cell, :with => /^(1?(-?\d{3})-?)?(\d{3})(-?\d{4})$/, :message => "Use this phone number format: XXX-XXX-XXXX"
  validates_format_of :phone_evening, :with => /^(1?(-?\d{3})-?)?(\d{3})(-?\d{4})$/, :message => "Use this phone number format: XXX-XXX-XXXX"
  validates_presence_of :experience, :exercise, :medical, :emergency_contact, :diet
end
