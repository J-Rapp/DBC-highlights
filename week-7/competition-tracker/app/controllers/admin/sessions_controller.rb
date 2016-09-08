class Admin::SessionsController < ApplicationController

  def new
    @login_form = LoginForm.new
  end

  def create
    @login_form = LoginForm.new(login_form_params)

    if @login_form.authenticated?
      session[:user_id] = @login_form.user.id
      redirect_to '/admin/dashboard'
    else
      render 'admin/sessions/new'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def login_form_params
    params.require(:login_form).permit(:username, :password)
  end
end
