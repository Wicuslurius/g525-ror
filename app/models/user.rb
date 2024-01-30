class User < ApplicationRecord
    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :address, presence: true
    validates :living_place, presence: true
    validates :observations, presence: true
    validates :birthdate, presence: true
end
