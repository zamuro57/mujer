class Post < ActiveRecord::Base
  has_many :steps, :dependent => :destroy
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :user_id, presence: true
  
end
