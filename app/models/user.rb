class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:github]

  has_many :users_technologies_levels
  has_many :technologies, through: :users_technologies_levels
  has_many :levels, through: :users_technologies_levels
end
