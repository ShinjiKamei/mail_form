
FactoryGirl.define do
  factory :inquiry do
    name    "Shinji Kamei"
    email   "example@railstutorial.com"
    content "How is it?"
    category_id 1
  end
  factory :category do
    id 1
  end
end


=begin
FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
  end
  
  factory :micropost do
    content "Lorem ipsum"
    user
  end
end
=end
