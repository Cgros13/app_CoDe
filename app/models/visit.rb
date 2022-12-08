class Visit < ApplicationRecord
  belongs_to :user

  validates :url, presence: true

  def energy
    statistics["energy"] if statistics
  end

  def co2
    (statistics["co2"]["grid"]["grams"] + statistics["co2"]["renewable"]["grams"]) / 2 if statistics
  end

  def co2_by_time
    co2 * time if time
  end

  def time
    ((end_time - created_at) / 60).round(2) if end_time
  end

  def co2_per_time
    return unless time

    ret = co2 / time
    ret.round(2)
  end

  def energy_per_time
    time / energy if time
  end

  def phone_cycles
    energy * 50
  end

  def e_bike
    energy * 100
  end

  def laundry
    energy * 30
  end
end
