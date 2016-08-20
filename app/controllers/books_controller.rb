class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :xchange]

  def index
    @book = Book.all
  end

  def show
    @user= current_user
    puts "#{@user.to_json}"
  end

  def new
    @book = Book.new
  end

  def edit

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


    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy

    @book.destroy

    redirect_to books_path
  end

  def profile
    @book=current_user.books
  end

  def xchange_send_email
    @user= current_user
    UserMailer.notification_email(@book,@user).deliver
    redirect_to @book, notice: 'Email was successfully sent. Wait for an answer. '
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :author, :descrption, :image)
    end
end
