class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[attribute] << (options[:message] || "is not an email")
      end
    end
end

class User < ActiveRecord::Base
  
  validates :username, presence: true, uniqueness: true, :length => { :maximum => 30 }
  validates :email, presence: true, uniqueness: true, email:true
  validates :name, presence: true
  validates :password, :length =>{ :in => 6..16}
  has_many :posts
  has_secure_password
  
  def to_params
    username
  end
    
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"] || auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.name = auth["info"]["first_name"]+auth["info"]["last_name"]
      user.status = 'confirmed'
      user.password = Random.new.rand(100000..1000000000)
    end     
  end
end
