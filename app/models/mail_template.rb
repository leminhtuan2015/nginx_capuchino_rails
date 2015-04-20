class MailTemplate < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  scope :recent, -> {order "created_at DESC"}
end
