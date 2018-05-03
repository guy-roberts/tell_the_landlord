class ProfileResource < JSONAPI::Resource
  model_name 'Profile'
  attributes :firstname, :lastname, :address1,
             :address2, :address3, :postcode, :email,
             :phone, :gender, :notes

  filters :lastname, :firstname

  paginator :paged #can also operate in 'offset' mode: see README

end
