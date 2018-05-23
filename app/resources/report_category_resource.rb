class ReportCategoryResource < JSONAPI::Resource
  model_name 'ReportCategory'
  attributes :description

  filters :description


  def self.default_sort
    [{field: 'description', direction: :asc}]
  end
end
