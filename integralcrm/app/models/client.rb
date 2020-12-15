class Client < ActiveRecord::Base
    has_many :cases
    has_many :tasks #only users will have tasks. the relationship will be symetrical
    has_many :notes, through: :cases #make sure to update case and client notes relationships
    validates_presence_of :name, :contact_number, :email

    alias_attribute :created_by, :user_id
end
