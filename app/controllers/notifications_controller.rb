class NotificationsController < ApplicationController

  
  def create
    @notification = Notification.new(params[:notification])
    @notification.token = TokenPhrase.generate
    if @notification.save 
      NotificationMailer.authentication(@notification).deliver
      flash[:success] = "Erfolgreich eingetragen."
    else
      flash[:error] = "Leider nicht erfolgreich."
    end
    respond_to do |format|
       format.html
       format.js { head :ok }
    end  
  end
  
  def authentication
    token = params[:token]
    notification = Notification.find_by_token(token)
    notification.authenticated = true
    if notification.save
      flash[:success] = "Erfolgreich."  
    else
      flash[:error] = "Fehlgeschlagen"
    end
  end
  
  
end
