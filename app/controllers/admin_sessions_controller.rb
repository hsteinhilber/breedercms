class AdminSessionsController < ApplicationController
  def new
    @admin_session = AdminSession.new
  end

  def create
    @admin_session = AdminSession.new(params[:admin_session])
    if @admin_session.save
      flash[:notice] = 'You have been successfully logged in.'
      redirect_to root_path
    else
      flash[:error] = 'Invalid username or password'
      render action: :new
    end
  end

  def destroy
    current_admin_session.destroy
    flash[:notice] = 'You have been successfully logged out.'
    redirect_to root_path
  end
end
