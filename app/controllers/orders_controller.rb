class OrdersController < ApplicationController
before_action :set_order, except: :index

  def show
  @order = current_user.orders.find(params[:id])

  end

  def index
    @bookings = current_user.orders
  end

  def create
  trainning = Trainning.find(params[:trainning_id])
  order = Order.create!(trainning: trainning, amount: trainning.price_cents, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: trainning.description,
      images: [trainning.photo],
      amount: trainning.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
  end

 private

  def set_order
    @order = current_user.orders
  end

end
