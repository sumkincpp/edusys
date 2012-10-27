# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_setting do
    var "MyString"
    value "MyText"
    target_id 1
    target_type "MyString"
  end
end
