class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]

  def new
    # Action for creating a new bookmark, where you can specify movie_id and list_id
    @bookmark = Bookmark.new
  end

  def create
    # Action for handling the creation of a new bookmark based on movie_id and list_id
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark.list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    # Action for deleting a bookmark
    @list = @bookmark.list # Store the associated list before destruction
    @bookmark.destroy
    redirect_to @list || root_path, notice: 'Bookmark was successfully destroyed.'
  rescue ActiveRecord::RecordNotFound
    # Handle the case where the bookmark is not found (e.g., redirect to an error page)
    redirect_to root_path, alert: 'Bookmark not found'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :list_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end

