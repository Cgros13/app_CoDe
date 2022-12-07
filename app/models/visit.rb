class Visit < ApplicationRecord
  belongs_to :user

  validates :url, presence: true

  def energy
    if statistics
      statistics["energy"]
    end
  end

  def co2
    if statistics
      (statistics["co2"]["grid"]["grams"] + statistics["co2"]["renewable"]["grams"]) / 2
    end
  end
end
