class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :mailbox, :conversation


    def after_sign_in_path_for(resource)
    	'/home'
	end

    def after_sign_out_path_for(resource_or_scope)
  		"/home"
	end

  private

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def mailbox
    @mailbox ||= current_user.mailbox
  end

 protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :city, :state, :street, :location, :age, :avatar)
    end
end
