class CommentsController < ApplicationController
  before_action :set_product, only: [ :create ]

  def create
    @product.comments.create(comment_params)
    redirect_to @product, notice: "Comment was saved success"
  end

  private

  def set_product
    @product = Product.find_by slug: params[:product_id]
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end