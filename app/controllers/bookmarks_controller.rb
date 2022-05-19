class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(book_params)
    @bookmark.list = @bookmark
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'list/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to @bookmark.list
  end

  private

  def book_params
    params.require(:bookmark).permit(:comment)
  end
end
