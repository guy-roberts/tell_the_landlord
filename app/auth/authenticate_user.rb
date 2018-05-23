class AuthenticateUser
  def initialize(email, password, subdomain)
    @email = email
    @password = password
    @subdomain = subdomain
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :email, :password, :subdomain

  # verify user credentials
  def user
    user = User.find_by(email: email)
    return user if user &&
                   user.authenticate(password) &&
                   user.subdomain === subdomain
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
