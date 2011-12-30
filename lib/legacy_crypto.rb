class MyAwesomeCryptoProvider

  require 'digest/sha1'

  def self.encrypt(*tokens)
    # encrypt your password here
    # The first argument in tokens in the password. The second is the authlogic salt
    incoming_password = tokens.shift

    SALT_LENGTH = 10
    hash_40 = crypted_password[0,SALT_LENGTH]

    embedded_salt = crypted_password[SALT_LENGTH, 10000]
    # Assuming the first token is the plain text password
    hashee = embedded_salt + tokens.shift
    hash = Digest::SHA1.hexdigest hashee
  end

  def self.matches?(crypted_password, *tokens)
    # let's only use this to log people in, but upgrade them to a standard authlogic method once they log in
    # return true if the tokens match the crypted_password
    crypted_password == encrypt()
    hash_40 == hash
  end
end
