class Activity < ApplicationRecord
    #dependent destory destorys associated data when activity is destoryed
    has_many :signups, dependent: :destroy
    has_many :campers, through: :signups
end
