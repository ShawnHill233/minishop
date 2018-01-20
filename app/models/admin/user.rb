class Admin::User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, authentication_keys: [:email]
  devise :timeoutable, :timeout_in => 15.minutes if Rails.env.production?
end
