# app/controllers/bookmarks_controller.rb

class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]

  # ... other actions ...

  def destroy
    if @bookmark.destroy
      redirect_to @list, notice: 'Bookmark was successfully destroyed.'
    else
      redirect_to @list, alert: 'Failed to destroy bookmark.'
    end
  end

  # ... other actions ...

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
  end

  # ... other private methods ...

end
