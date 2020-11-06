class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, omniauth_providers: [:google_oauth2]
         
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :tickets
  has_many :issue_types, through: :tickets

  def full_name
    self.first_name + " " + self.last_name
  end

  def self.google_omniauth(auth)
    #  binding.pry
    where(provider: auth["provider"], uid: auth["uid"]).first_or_create(email: auth["info"]["email"]) do |user|
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        # user.profile_img_url = auth.info.image
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
    end
  end

end
