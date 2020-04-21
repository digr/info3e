class Solution < ApplicationRecord
    belongs_to :cource
    belongs_to :user

    has_many_attached :documents

    validates :documents, presence: true
end
