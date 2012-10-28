# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :change_world_project do
    district ""
    school "MyString"
    nomination ""
    project_name "MyString"
    authors "MyText"
    supervisor "MyString"
    phone_sup "MyString"
    phone_sup_mob "MyString"
  end
end
