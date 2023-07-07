class BooksController < ApplicationController
  
  def create
    @new_book = Book.new (book_params)
    
    if @new_book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path (@new_book.id)
    else
      @index_books = Book.all.order("id")
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
    @edit_book = Book.find(params[:id])
    
    if @edit_book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@edit_book.id)
    
    else
      render :edit
    end
    
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
