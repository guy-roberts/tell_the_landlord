class ProfileResource < JSONAPI::Resource
  model_name 'Profile'
  has_many :reports

  attributes :firstname, :lastname, :address1,
             :address2, :address3, :postcode, :email,
             :mobile_phone, :home_phone, :tenant_reference

  filters :lastname, :firstname

  paginator :paged #can also operate in 'offset' mode: see README

end
