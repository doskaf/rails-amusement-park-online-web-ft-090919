class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if (self.user.tickets < self.attraction.tickets) && (self.attraction.min_height > self.user.height)
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.attraction.min_height > self.user.height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            new_tickets = self.user.tickets - self.attraction.tickets
            new_nausea = self.user.nausea + self.attraction.nausea_rating
            new_happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.update(:nausea => new_nausea, :happiness => new_happiness, :tickets => new_tickets)
            "Thanks for riding the #{self.attraction.name}!"
        end
    end

end
