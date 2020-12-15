class Case < ActiveRecord::Base
    validates_presence_of :status, :owner
    belongs_to :user   
    belongs_to :client #change this to a has_one association 
    has_many :notes

    
end
