class AssessmentsController < ApplicationController
    def create
        user_id = current_user_info.id

        if params[:assessments]
            params[:assessments].each do |cource, value|
                unless value.blank?
                    assmnt = SelfAssessment.find_or_create_by(user_id: user_id, cource_id: cource, date: date)
                    assmnt.value = value.to_i
                    assmnt.save!
                end
            end
        end
        redirect_to :root
    end
end
