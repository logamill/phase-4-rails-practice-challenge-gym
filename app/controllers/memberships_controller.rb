class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

    def create
        membership = Membership.create!(member_params)
        render json: membership, status: :created
    end


    private 

    def render_record_invalid(exception)
        render json: { error: exception }, status: :unprocessable_entity
    end
    
    def render_record_not_found
        render json: { error: "Client not found "}, status: :not_found
    end

    def member_params
        params.permit(:charge, :client_id, :gym_id)
    end
end
