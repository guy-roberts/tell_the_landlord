class ProfileResource < JSONAPI::Resource
  model_name 'Profile'
  attributes :first_name, :last_name, :address1,
             :address2, :address3, :postcode, :email,
             :phone, :gender, :notes

  filters :last_name, :first_name
end
