class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  
  add_breadcrumb "Página principal", :root_path, :options => { :title => "Página principal" }




  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
    	:email,
		:password,
		:password_confirmation,
		:cpf,
		:nome,
		:cep,
		:cidade,
		:logradouro,
		:bairro,
		:numero,
		:complemento,
		:tel_fixo,
		:tel_celular
    	])
    devise_parameter_sanitizer.permit(:account_update, keys: [
    	:email,
		:password,
		:password_confirmation,
		:cpf,
		:nome,
		:cep,
		:cidade,
		:logradouro,
		:bairro,
		:numero,
		:complemento,
		:tel_fixo,
		:tel_celular
    	])
  end
end
