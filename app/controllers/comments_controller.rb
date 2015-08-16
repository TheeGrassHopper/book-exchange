class CommentsController < ApplicationController
		before_action :find_book
		before_action :find_comment, only: [:edit, :update, :destroy]
		before_action  :authenticate_user!

	def create 
		@comment = @book.comments.create(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to book_path(@book)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to book_path(@book)
	end


	private

		def comment_params
			params.require(:comment).permit(:content)
		end

		def find_book
			@book = Book.find(params[:book_id])
		end

		def find_comment
			@comment = Comment.find(params[:id])
		end

end
