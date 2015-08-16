class BooksController < ApplicationController
	before_action :find_book, only: [:show, :edit, :destroy, :update]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@books = Book.all.order("created_at DESC")
	end

	def show
	end

	def new
		@book = current_user.books.build
	end

	def edit

	end

	def update
		respond_to do |format|
    		if @book.update(book_params)
       			format.html { redirect_to book_path, notice: 'book was successfully updated.'}
        		format.json { render :show, status: :ok, location: @book }
      		else
        		format.html {render :edit}
        		format.json {render json: @book.errors, status: :unprocessable_entity }
        		render 'edit'
    		end
    	end
	end

	def destroy

		@book.destroy
		redirect_to root_path
	end
	
	def create
		@book = current_user.books.build(book_params)
		if @book.save
			redirect_to root_path
		else
			render 'new'
		end
	end	
	
	private

		def find_book
			@book = Book.find(params[:id])
		end

		def book_params
     	 params.require(:book).permit(:title,:description, :isbn, :author, :class, :class_date, :book_type, :condition, :price, :description)
	end
end


