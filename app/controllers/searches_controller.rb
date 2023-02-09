class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    # :range(User or Book)

    if @range == "User" #検索モデルがUserなら
      @users = User.looks(params[:search], params[:word])
    else #検索モデルがBookなら
      @books = Book.looks(params[:search], params[:word])
    end
    # :search(完全一致、前方一致、後方一致、部分一致)
    # :word(text_fieldに書き込んだ任意の文字列)
  end
end
