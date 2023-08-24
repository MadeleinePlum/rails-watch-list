class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # find the movie by the movie id in the params
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    # find the list
    @bookmark.list = @list
    @bookmark.movie = @movie
    # create a new bookmark
    if @bookmark.save
    # redirect to list show page
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
