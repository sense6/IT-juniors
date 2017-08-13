class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:github]

  has_many :skills,       dependent: :destroy
  has_many :technologies, through: :skills
  has_many :levels,       through: :skills

  validates :first_name, presence: true
end
