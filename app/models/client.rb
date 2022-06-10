class Client < ApplicationRecord

    has_many :memberships
    has_many :gyms, through: :memberships

    def sum
        Membership.where(client_id: self.id).sum(:charge)
    end

end
