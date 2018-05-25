class AuthenticationController < ApplicationController
  include Response
  include ExceptionHandler

  # return auth token once user is authenticated
  def authenticate
    auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password], auth_params[:subdomain]).call
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password, :subdomain)
  end
end
