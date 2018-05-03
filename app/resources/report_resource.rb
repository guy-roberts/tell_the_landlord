class ReportResource < JSONAPI::Resource
  model_name 'Report'
  attributes :category, :description, :latitude, :longitude

  filters :category

  paginator :paged #can also operate in 'offset' mode: see README

end
