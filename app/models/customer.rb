class Customer < ActiveRecord::Base
  enum sex: [:male, :female]
end
