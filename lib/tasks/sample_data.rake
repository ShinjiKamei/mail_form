# Used by faker gem.
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_categories
    make_inquiries
  end
end

def make_categories
  Category.create!(name: "このサイトについて")
  Category.create!(name: "ご注文方法")
  Category.create!(name: "お支払い方法")
  Category.create!(name: "商品の配送")
  Category.create!(name: "その他")
end

def make_inquiries
  Inquiry.create!(name: "亀井　慎司",
                  email: "kamei@railstutorial.jp",
                  category_id: 3,
                  content: "質問があります。")
  33.times do |n|
    name     = Faker::Name.name
    email    = "example-#{n+1}@foo.com"
    category = Random.rand(1 .. 5)
    content  = Faker::Lorem.sentence(10)
    Inquiry.create!(name: name,
                 email: email,
                 category_id: category,
                 content: content)
  end
end

