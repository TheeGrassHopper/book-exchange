class Book < ActiveRecord::Base
		enum book_type: [:hardcover, :softcover, :loose_leaf] 
		enum condition: [:poor,:used,:likenew]
end
