class Membership < ApplicationRecord
    validate :unique_gym?

    belongs_to :gym
    belongs_to :client


    def unique_gym?
        gym_arr = self.client.gyms.map { |gym| gym.id}
        check = gym_arr.include? self.gym_id
        if check == true
            errors.add("Client cannot have multiple memberships to the same gym")
        end
    end

end
