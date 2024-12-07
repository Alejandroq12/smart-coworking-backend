class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :workspaces, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :role, presence: true, inclusion: { in: %w[default admin] }
end
