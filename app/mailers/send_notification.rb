class SendNotification < ApplicationMailer
  default from: "cfaristizabalr@gmail.com"

  def notification_email(book,current_user)
    @book = book
    @user = current_user
    mail(to: @book.user.email, subject: 'This is a proof' )
  end
end
