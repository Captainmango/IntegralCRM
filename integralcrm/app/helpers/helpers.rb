class Helpers
    def self.logged_in(session_hash)
        !!session_hash[:user_id]
    end

    def self.current_user(session_hash)
        User.find_by_id(session_hash[:user_id])
    end

    
end