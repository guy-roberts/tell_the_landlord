class ReportResource < JSONAPI::Resource
  model_name 'Report'
  attributes :category, :description, :latitude, :longitude, :created_at, :name_of_profile

  filters :category

  paginator :paged #can also operate in 'offset' mode: see README

  def name_of_profile
    @model.profile.first_name + ' ' + @model.profile.last_name
  end

  def created_at
    @model.created_at.strftime('%d/%m/%Y at %R')
  end

end
