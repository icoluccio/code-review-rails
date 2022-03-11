class RentMailer < ApplicationMailer
  default from: 'notifications@wolox.com.ar'

  def send_create_rent
    @rent = Rent.find(params[:rent_id])
    @book = @rent.book
    user = @rent.user

    I18n.with_locale(user.locale.to_sym) do
      mail(to: user.email, subject: "#{@book.title} " + I18n.t(:rented) + '!')
    end
  end

  def expired_rent
    @rent = params[:expired_rent]
    @book = @rent.book
    user = @rent.user

    I18n.with_locale(user.locale.to_sym) do
      mail(to: user.email, subject: "#{@book.title} " + I18n.t(:rent_expired) + '!')
    end
  end
end
