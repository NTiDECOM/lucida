class BooksController < ApplicationController
	before_action :set_book, only: [:show, :edit, :update, :destroy]

	def index
      #@books = Book.all
      @books = Book.order(:title).page(params[:page]).per(5)
	end

	def new
      @book = Book.new
	end

	def show
	end	

    def create      
      if @book.save
        redirect_to @book, notice: "Book created successfully"
      else
      	render action: :new, notice: "Could not update this book"
      end
	end

	def edit       
	end

	def update
	  if @book.update(book_params)
	  	redirect_to @book, notice: "Book updated successfully"
	  else
        redirect_to @book, notice: "Could not update this book"
	  end
	end

	def destroy
      if @book.destroy
	    redirect_to :books_path, notice: "Book removed successfully"
	  else
	  	redirect_to :books_path, notice: "Book could not be removed"
	  end
	end

    ##### helper methods #####
    private

	def book_params
      params.require(:book).
        permit(:isbn, :title, :author, :spiritual_author, :publisher, :buy_price, :sell_price, :year, :pages_number)
	end

	def set_book
	  @book = Book.find(params[:id])
	end


	def handleShopify
	
	end
end