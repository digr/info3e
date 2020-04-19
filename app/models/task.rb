class Task < ApplicationRecord
    belongs_to :cource
    has_many_attached :document

    validates :text, presence: true, length: { minimum: 3 }
end
