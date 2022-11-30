class User < ApplicationRecord
  has_many :visits, dependent: :destroy
  after_create :generate_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def generate_token
    # Generate a token of 30 characters and save it to the database
    self.authentication_token = SecureRandom.hex(15)
    self.save
  end
end
