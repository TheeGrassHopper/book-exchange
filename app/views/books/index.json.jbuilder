json.array!(@books) do |book|
  json.extract! book, :id, :title, :isbn, :author, :professor, :book_type, :condition, :price, :description
  json.url book_url(book, format: :json)
end
