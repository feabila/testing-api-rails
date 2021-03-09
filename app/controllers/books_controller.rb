class BooksController < ApplicationController
    before_action :set_author
    before_action :set_book, only: [:show, :update, :destroy]

    # GET /authors/:author_id/books
    def index 
        json_response(@author.books)
    end

    # GET /authors/:author_id/books/:id
    def show 
        json_response(@book)
    end

    # POST /authors/:author_id/books
    def create 
        @author.books.create!(book_params)
        json_response(@author, :created)
    end

    # PUT /authors/:author_id/books/:id
    def update
        @book.update(book_params)
        head :no_content
    end

    # DELETE /authors/:author_id/books/id
    def destroy
        @book.destroy
        head :no_content
    end

    private

    def book_params
        # primary params
        params.permit(:title, :description)
    end

    def set_author
        @author= Author.find(params[:author_id])
    end

    def set_book
        @book= @author.books.find_by!(id: params[:id]) if @author
    end
end
