class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      # @feed_items = current_user.feed.paginate(page: params[:page])
      if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
        @q = current_user.feed.ransack(microposts_search_params)
        @feed_items = @q.result.paginate(page: params[:page])
        if @feed_items.empty?
          flash.now[:danger] = 'Search String Not Found'
        end
        @url = root_path
      else
        @q = Micropost.ransack
        @feed_items = current_user.feed.paginate(page: params[:page])
        @url = root_path
      end
    end
  end
  
  def help
  end
  
  def about
  end
  
  def contact
  end

end
