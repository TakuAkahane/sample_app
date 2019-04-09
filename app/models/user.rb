class User < ApplicationRecord
  # gem deviseで有効にする機能を列挙
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable,
         omniauth_providers: %i[google_oauth2 facebook linkedin]
end
