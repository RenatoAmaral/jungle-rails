class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

    def purchase_confirmation_email(email, order_details)
        @email = email
        @order = order_details

        @items = LineItem.where(order_id: @order.id)
        @items.each do |item|
            item.product = Product.find(item.product_id)
        end

        mail(to: @email, subject: "Jungle | Purchase Receipt (Order ##{@order.id})")
    end
end
