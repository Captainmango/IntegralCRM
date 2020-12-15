class Note < ActiveRecord::Base #change this to case notes and add a client notes table
    belongs_to :case
    belongs_to :user
    belongs_to :client
    validates_presence_of :title, :owner



end
