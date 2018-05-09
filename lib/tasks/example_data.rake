require 'factory_bot'
require 'faker'

namespace :seed do
  desc 'Seed data'
  task create: :environment do

    def create_organisations
      available_organisations = [
          {name: 'Newthorpe Housing Association'},
          {name: 'Paddlewick Housing'},
          {name: 'Canteloup Coooperative Housing'},
          {name: 'Medway'},
          {name: 'Chesterfield'},
      ]

      available_organisations.each do |organisation|
        Organisation.new(organisation).save!
      end
    end

    def random_report_category
      categories = ['Adaptations',
                    'Basins and Sinks',
                    'Baths and Showers',
                    'Communal Areas and Door Entry',
                    'Drainage',
                    'Doors',
                    'Electrics',
                    'Floors Walls and Ceilings',
                    'Garages',
                    'Gutters and Rainwater Pipes',
                    'Heating and Hot Water',
                    'Kitchen Units',
                    'Locks and Fittings',
                    'Outside the Property',
                    'Roofing',
                    'Stairs',
                    'Toilets',
                    'Water Services',
                    'Windows and Glazing',
                    'Alcohol Related Nuisance',
                    'Criminal Behaviour (Other)',
                    'Drugs/ Substance Misuse',
                    'Hate Related Incidents',
                    'Litter/Fly Tipping',
                    'Noise',
                    'Nuisance from Vehicles',
                    'Pets & Animal Nuisance',
                    'Vandalism & Damage to Property',
                    'Verbal Abuse/  Intimidation',
                    'Misuse of Public Spaces',
                    'Garden Nuisance',
                    'Domestic Abuse',
                    'Other Physical Violence']

      return(categories.sample)
    end

    def create_profiles
      Organisation.all.each do |organisation|
        100.times do
          new_profile = Profile.create!(
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              address1: Faker::Address.street_address,
              address2: Faker::Address.secondary_address,
              address3: Faker::Address.city,
              postcode: Faker::Address.postcode,
              email: Faker::Internet.email,
              phone: Faker::PhoneNumber.phone_number,
              gender: rand(100) > 50 ? 'M' : 'F',
              notes: Faker::Lorem.paragraph,
              organisation_id: organisation.id
              )
          new_profile.save!

          (rand(3) + 1).times do
            new_report = Report.create!(
              category: random_report_category,
              description: Faker::Lorem.sentence,
              profile_id: new_profile.id,
              organisation_id: organisation.id
            )
          end
        end
      end
    end

    def create_user
      User.create!(name: 'Guy', email: 'guy@home.com', password: 'domrob66')
    end

    Faker::Config.locale = 'en-GB'

    create_organisations
    create_profiles

  end
end
