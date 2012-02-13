class Post < ActiveRecord::Base
  has_many :steps, :dependent => :destroy
  validates :title, presence: true, uniqueness: true
  
end
