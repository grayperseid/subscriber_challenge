class Subscriber < ApplicationRecord
  validates :email, uniqueness: {case_sensitive: false}, format: URI::MailTo::EMAIL_REGEXP
end
