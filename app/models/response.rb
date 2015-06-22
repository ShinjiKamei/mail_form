class Response < ActiveRecord::Base
  
  belongs_to :inquiry
  
  default_scope -> { order('created_at DESC') }
  
  validates :inquiry_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }


end
