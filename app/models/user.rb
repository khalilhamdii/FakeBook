class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :user_avatar, dependent: :destroy
  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    if user_avatar.attached?
    user_avatar.variant(resize: "150x150!").processed
    else
      "/user_avatar.png"
    end
  end

  private
  def add_default_avatar
    unless user_avatar.attached?
      user_avatar.attach(
        io: File.open(
          Rails.root.join(
            'app','assets','images', 'user_avatar.png'
          )
        ), filename: 'user_avatar.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
