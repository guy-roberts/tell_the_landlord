class OrganisationsController < JSONAPI::ResourceController
  before_action :authorize_request

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
