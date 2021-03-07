class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i # [a-z\d]は英数字,{6,}は下限と上限、/iは大文字も小文字も含む
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/ # 全角ひらがな、カタカナ、漢字
  VALID_PHONENUMBER_REGEX = /\A\d{10,11}\z/ # ハイフンなし10桁or11桁電話番号

  with_options presence: true do
    validates :shop_name
    validates :owner_name,      format: { with: VALID_NAME_REGEX }
    validates :owner_phone_number,       format: { with: VALID_PHONENUMBER_REGEX }
    validates :shop_address
    validates :shop_city
  end

  validates :password, format: { with: VALID_PASSWORD_REGEX }

end
