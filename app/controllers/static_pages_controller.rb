class StaticPagesController < ApplicationController

  def home
  end

  def about
  end

  def contact
  end

  def send_message
    MessageMailer.send_message_email(params[:name], params[:email], params[:subject], params[:message]).deliver
    flash['success'] = 'Message Sent!'
    redirect_to '/contact'
  end

end
