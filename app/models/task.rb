class Task < ApplicationRecord
    belongs_to :cource
    has_many_attached :documents

    validates :text, presence: true, length: { minimum: 3 }
end
