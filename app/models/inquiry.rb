class Inquiry < ActiveRecord::Base
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  validates(:name,    presence: true, length: { maximum: 50 })
  validates(:email,   presence: true, format: { with: VALID_EMAIL_REGEX })
  validates(:content, presence: true, length: { maximum: 500 })

end
