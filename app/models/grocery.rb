class Grocery < ApplicationRecord
  belongs_to :user

  include PgSearch

  pg_search_scope :search, against: [:ingredient]

  def expiry_countdown
    (self.expired_date - Date.today).to_i
  end

  def expired?
    if Date.today == self.expired_date || Date.today > self.expired_date
      return true
    end
  end

  def expiring_within(days)
    time_count = (self.expired_date - Date.today).to_i
    if (time_count < days && time_count > 0) || time_count == days
      return true
    elsif time_count < 0
      return false
    else
      return false 
    end
  end

  def show_valid_items?
    time_count = (self.expired_date - Date.today).to_i
    if time_count > 0
      return true
    else
      return false
    end
  end
end
