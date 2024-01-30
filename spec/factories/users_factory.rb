FactoryBot.define do
  factory :user do
    name { 'miguel' }
    last_name { 'Aranguren' }
    email { 'email' }
    address { 'car 41 a # 35 -32 sur' }
    living_place { 'casa' }
    observations { 'desarrollador ruby on rails' }
    birthdate { '1994-07-25' }

    association :sex, factory: :sex
  end
end
