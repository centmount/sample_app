class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  def microposts_search_params
    params.require(:q).permit(:content_cont)
  end
  
  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end

