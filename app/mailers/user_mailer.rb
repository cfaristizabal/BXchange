class UserMailer < ActionMailer::Base
  default from: "cfaristizabalr@gmail.com"

  def notification_email(book,current_user)
    @book = book
    @user = current_user
    puts "#{@book.user.email}"
    mail(to: "#{@book.user.email}", subject: 'This is a proof' )
  end
end
