class ReportResource < JSONAPI::Resource
  model_name 'Report'
  attributes :category, :description, :latitude, :longitude

  filters :category
end
