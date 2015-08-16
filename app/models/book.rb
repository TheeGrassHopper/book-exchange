class Book < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	enum book_type: [:hardcover, :softcover, :loose_leaf] 
	enum condition: [:poor,:used,:likenew]
end