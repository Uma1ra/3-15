class BooksController < ApplicationController
  
  def create
    create_book = Book.new(book_params)
    create_book.save
    redirect_to "/"
  end
  
  def index
    @index_books = Book.all
    @new_book = Book.new
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
