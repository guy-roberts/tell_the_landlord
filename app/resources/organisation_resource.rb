class OrganisationResource < JSONAPI::Resource
  model_name 'Organisation'
  attributes :name

  filters :name
end
