class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @book = Book.new
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end


  # POST /books
  # POST /books.json
  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :index
    end
  end

  # GET /books/1/edit
  def edit
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id), notice: 'Book was successfully updated.'
    else
      redirect_to books_path
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
