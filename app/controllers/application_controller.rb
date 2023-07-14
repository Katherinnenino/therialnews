class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
        redirect_to posts_path, notice: "Lo siento, no estas autorizado para realizar esta acción."
        end
    end   
protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone])
    end
    def after_sign_in_path_for(resource)
        posts_path
    end

end
