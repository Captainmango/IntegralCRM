class Note < ActiveRecord::Base
    belongs_to :case
    belongs_to :user
    belongs_to :client
    validates_presence_of :title, :owner
end
