FactoryBot.define do
    factory :book do 
        title { Faker::Lorem.word }
        description { Faker::Lorem.word }
        author_id nil
    end
end