class Cource < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: true

  def self.assessmnt
    Cource.where(assessmnt: true)
  end
end
