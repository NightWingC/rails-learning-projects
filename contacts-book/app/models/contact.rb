class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: {
    with: URI::MailTo::EMAIL_REGEXP
  }
  validates :email, uniqueness: true
  validates :phone, format: {
    with: /\A\+?\d{7,15}\z/,
    message: "must contain only digits and may start with +"
  }
end
