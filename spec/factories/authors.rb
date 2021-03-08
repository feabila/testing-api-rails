FactoryBot.define do
    factory :author do
        first_name { Faker::Lorem.word }
        last_name { Faker::Lorem.word }
    end
end