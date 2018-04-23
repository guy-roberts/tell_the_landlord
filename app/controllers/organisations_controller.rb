class OrganisationsController < ApplicationController

  before_action :set_organisation, only: [:show, :update, :destroy]

  # GET /organisations
  def index
    # get current user organisations
    @organisations = Organisation.all
    json_response(@organisations)
  end

  # GET /organisations/:id
  def show
    Rails.logger.info("GET called")
    json_response(@organisation)
  end

  # POST /organisations
  def create
    # create organisations belonging to current user
    @organisation = Organisation.create!(organisation_params)
    json_response(@organisation, :created)
  end

  # PUT /organisations/:id
  def update
    @organisation.update(organisation_params)
    head :no_content
  end

  # DELETE /organisations/:id
  def destroy
    @organisation.destroy
    head :no_content
  end

  private

  # remove `created_by` from list of permitted parameters
  def organisation_params
    params.permit(:name)
  end

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end
end
