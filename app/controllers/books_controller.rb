class BooksController < ApplicationController
  
  def create
    @create_book = Book.new(book_params)
    @create_book.save
    redirect_to book_path (@create_book.id)
  end
  
  def index
    @index_books = Book.all.order("id")
    @new_book = Book.new
  end

  def show
    @show_book = Book.find(params[:id])
  end

  def edit
    @edit_book = Book.find(params[:id])
  end
  
  def update
    update_book = Book.find(params[:id])
    update_book.update(book_params)
    redirect_to book_path(update_book.id)
  end
  
  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
