# Used by faker gem.
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_categories
  end
end

def make_categories
  Category.create!(name: "このサイトについて")
  Category.create!(name: "ご注文方法")
  Category.create!(name: "お支払い方法")
  Category.create!(name: "商品の配送")
end


