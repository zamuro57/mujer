class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[attribute] << (options[:message] || "is not an email")
      end
    end
end

class User < ActiveRecord::Base
  
  validates :username, presence: true, uniqueness: true, :length => { :maximum => 20 }
  validates :email, presence: true, uniqueness: true, email:true
  validates :name, presence: true
  validates :password, :length =>{ :in => 6..16}
  has_secure_password
  
end
