class Helpers
    def logged_in
        !!sessions[:user_id]
    end

    def current_user
        User.find_by_id(sessions[:user_id])
    end
end