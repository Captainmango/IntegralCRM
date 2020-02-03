class User < ActiveRecord::Base
    has_many :tasks
    has_many :cases
    has_many :notes, through: :cases
    has_many :clients

    has_secure_password
    validates_presence_of :username, :password_digest
    validates :username, uniqueness: true
end
