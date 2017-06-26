class GameController < ApplicationController
  def reset
    cookies.delete :counter #this makes it nil
    cookies.delete :name
    redirect_to action: :try  #took out parameter
    # render "try.html.erb"
  end

  def try
    cookies[:name] = params[:name] unless params[:name].nil?
    # @secret_num = 84
    session[:secret_num] = 99
    
    if cookies[:counter].nil?
      cookies[:counter] = 0
    else
      counter = cookies[:counter].to_i
      if params[:guess].to_i == session[:secret_num] && counter < 2
        @result = "You Win!!!"
        cookies.delete :counter #this makes it nil
      elsif params[:guess].to_i > session[:secret_num] && counter < 2
        @result = "You smoke too much, you're HIGH!!"
        counter += 1
        cookies[:counter] = counter
      elsif params[:guess].to_i < session[:secret_num] && counter < 2
        @result = "Too low!!!"
        counter += 1
        cookies[:counter] = counter
      else
        @result = "You lose"
        cookies.delete :counter #this makes it nil
      end # if of the guesses
    end #end if cookies
    render "try.html.erb"
  end #end try


end # class
