class BooksController < ApplicationController
  
  def create
    @create_book = Book.new (book_params)
    
    if @create_book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path (@book.id)
    else
      @index_books = Book.all.order("id")
      @new_book = Book.new
      render :index
    end
    
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
    flash[:notice] = "Book was successfully updated."
  end
  
  def destroy
    destroy_book = Book.find(params[:id])
    destroy_book.destroy
    redirect_to "/books"
    flash[:notice] = "Book was successfully destroyed."
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
