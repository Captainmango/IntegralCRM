class Case < ActiveRecord::Base
    validates_presence_of :status
    belongs_to :user
    belongs_to :client
    has_many :notes
end
