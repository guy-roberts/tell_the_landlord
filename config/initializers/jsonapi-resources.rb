JSONAPI.configure do |config|
  #:underscored_key, :camelized_key, :dasherized_key, or custom
  config.json_key_format = :underscored_key

  #:underscored_route, :camelized_route, :dasherized_route, or custom
  #
  config.route_format = :underscored_route

  # Send the page count so that the UI pagination can work
  config.top_level_meta_include_page_count = true
  config.top_level_meta_page_count_key = :page_count

  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :total_record_count

end
