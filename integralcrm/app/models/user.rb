class User < ActiveRecord::Base
    has_many :tasks
    has_many :cases
    has_many :notes, through: :cases

    has_secure_password
    validates_presence_of :username, :password_digest
end
