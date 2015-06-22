class Inquiry < ActiveRecord::Base
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  has_one :category
  
  has_many :responses, dependent: :destroy
  
  self.per_page = 10
  
  default_scope -> { order('created_at ASC') }
  
  validates(:name,        presence: true, length: { maximum: 50 })
  validates(:email,       presence: true, format: { with: VALID_EMAIL_REGEX })
  validates(:content,     presence: true, length: { maximum: 500 })
  validates(:category_id, presence: true)
  
end
