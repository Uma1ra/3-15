class BooksController < ApplicationController
  
  def new
    @new_book = Book.new
  end
  
  def create
  end
  
  def index
    @index_books = Book.all
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
