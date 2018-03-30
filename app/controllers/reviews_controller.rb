class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :description,
      :rating
    )
  end
end
