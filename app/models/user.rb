class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:github]

  has_many :skills,       dependent: :destroy
  has_many :technologies, through: :skills
  has_many :levels,       through: :skills
  belongs_to :company, optional: true

  def self.filter_users(search)
    if search
      User.joins(:technologies)
           .where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
