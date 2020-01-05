class Client < ActiveRecord::Base
    has_many :cases
    has_many :tasks
    has_many :notes, through: :cases
    validates_presence_of :name, :contact_number, :email
end
