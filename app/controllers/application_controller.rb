class ApplicationController < ActionController::Base
	include Pagy::Backend

	def after_sign_in_path_for(user)
        if user.staff?
        	users_path
        else
        	marks_path
        end        
    end

end
