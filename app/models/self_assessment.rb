class SelfAssessment < ApplicationRecord
    belongs_to :cource
    belongs_to :user

    def icon
        case value
        when 1
            "sunny-outline"
        when 2
            "partly-sunny-outline"
        when 3
            "rainy-outline"
        else
            nil
        end
    end

    def color
        case value
        when 1
            "orange"
        when 2
            "grey"
        when 3
            "black"
        else
            nil
        end
    end
end
