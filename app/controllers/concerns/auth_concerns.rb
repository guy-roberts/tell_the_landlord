module AuthConcerns
  extend ActiveSupport::Concern

  include Response
  include ExceptionHandler

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
