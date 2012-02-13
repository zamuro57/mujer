class Step < ActiveRecord::Base
  validates :title,:content, presence:true
  belongs_to :post
end
