class Task < ActiveRecord::Base
    belongs_to :user
    belongs_to :case 
    belongs_to :client
    validates_presence_of :user_id
    
end
