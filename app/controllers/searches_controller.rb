class SearchesController < ApplicationController

  def search
    @search_category = params[:category]
    @search_type = params[:type]
    # search_category:1=User検索,2=Book検索
    # search_type:1=完全一致,2=前方一致,3=後方一致,4=部分一致
    if @search_category == "1"
      @users = User.search(params[:search], @search_category, @search_type)
    else
      @books = Book.search(params[:search], @search_category, @search_type)
    end
  end

end
