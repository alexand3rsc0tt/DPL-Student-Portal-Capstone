# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    name "MyString"
    last_poster_id 1
    last_post_at "2014-10-15 10:33:09"
  end
end
