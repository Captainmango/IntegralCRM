class Case < ActiveRecord::Base
    belongs_to :user
    belongs_to :client
    has_many :notes
end
