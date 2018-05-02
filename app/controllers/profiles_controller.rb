class ProfilesController < JSONAPI::ResourceController
  include AuthConcerns

  before_action :authorize_request
end
