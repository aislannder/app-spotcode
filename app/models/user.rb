class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :recently_heards

  def is_favorite? kind, id
    self.favorites.where(favorite_type: kind, favorite_id: id).present?
  end
  
end
