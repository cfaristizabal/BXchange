class BooksController < ApplicationController

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  def profile
    @book=current_user.books
  end

  def xchange
    @book = Book.find(params[:id])
    SendNotification.notification_email(@book,current_user)
      redirect_to @book, notice: 'Email was successfully sent. Wait for an answer. '
  end

  private
    def book_params
      params.require(:book).permit(:name, :author, :descrption, :image)
    end
end
