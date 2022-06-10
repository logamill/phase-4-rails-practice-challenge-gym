class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

    def index 
        gyms = Gym.all
        render json: gym
    end

    def show
        gym = find_gym
        render json: gym
    end

    def create 
        gym = Gym.create!(gym_params)
        render json: gym, status: :created
    end

    def update
        gym = find_gym
        gym.update!(gym_params)
        render json: gym 
    end

    def destroy
        gym = find_gym
        gym.destroy
        render json: {} 
    end

    private
    
    def render_record_not_found
        render json: { error: "Gym not found" }, status: :not_found
    end

    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.permit(:name, :address)
    end
end
