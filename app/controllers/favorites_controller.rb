class FavoritesController < ApplicationController

def create
  favorite = current_user.favorites.create(book_id:params[:book_id])
  redirect_to request.referer
end

def destroy
  favorite = Favorite.find_by(book_id:params[:book_id],user_id:current_user.id)
  favorite.destroy
  redirect_to request.referer
end

end
