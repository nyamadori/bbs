FactoryGirl.define do
  factory :message do
    body 'MyText'

    factory :invalid_message do
      body ''
    end
  end
end
