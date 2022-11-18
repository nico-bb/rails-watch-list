class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :destroy]
  
  def show
  end
  
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to(@bookmark.list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.delete
    redirect_to "/lists/#{@bookmark.list_id}"
  end

  private
  
  def bookmark_params
    return params.require(:bookmark).permit(:comment, :movie, :list, :movie_id, :list_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
