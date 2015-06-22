
FactoryGirl.define do

  factory :inquiry do
    name    { |n| "Person #{n}" }
    email   { |n| "person_1@example.com" }
    content { |n| "content_#{n}" }
    category_id 1
  end
  factory :category do
    id 1
    name "ご注文方法"
  end
  factory :response do
    content "下記の通り回答します。。。。"
    inquiry
  end



=begin
  factory :inquiry do
    name    "Shinji Kamei"
    email   "example@railstutorial.com"
    content "How is it?"
    category_id 1
  end
=end
end



