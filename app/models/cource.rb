class Cource < ApplicationRecord
  has_one_attached :document

  validates :title, presence: true,
    length: { minimum: 5 }
end
