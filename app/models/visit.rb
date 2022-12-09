class Visit < ApplicationRecord
  belongs_to :user

  validates :url, presence: true

  def energy
    statistics["energy"] if statistics
  end

  def co2
    statistics.present? ? (statistics["co2"]["grid"]["grams"] + statistics["co2"]["renewable"]["grams"]) / 2 : rand(0.5..2)
  end

  def co2_by_time
    co2 * time if co2.present? && time.present?
  end

  def time
    update(end_time: Time.now) unless end_time.present?
    ((end_time - created_at) / 60).round(2)
  end

  def energy_per_time
    time / energy if time
  end

  def phone_cycles
    energy.present? ? energy * 50 : 1
  end

  def e_bike
    energy.present? ? energy * 100 : 1
  end

  def laundry
    energy.present? ? energy * 30 : 1
  end
end
