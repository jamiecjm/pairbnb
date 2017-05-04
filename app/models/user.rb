class User < ApplicationRecord
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  
  has_many :authentications, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :email, uniqueness: true

  @@auth_login = false

  def self.create_with_auth_and_hash(authentication, auth_hash)
      @@auth_login = true
      user = User.new(name: auth_hash["info"]["name"], email: auth_hash["extra"]["raw_info"]["email"])
      if user.save
        user.authentications << (authentication)
      else
        user=User.find_by(email: auth_hash["extra"]["raw_info"]["email"])
        user.name = auth_hash["info"]["name"]
      end      
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    if @@auth_login
      return true
    else
      return false
    end
     @@auth_login = false
  end


end
