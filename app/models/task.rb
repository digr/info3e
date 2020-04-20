class Task < ApplicationRecord
    belongs_to :cource
    has_many_attached :documents
    has_rich_text :content

    validates :content, presence: true
end
