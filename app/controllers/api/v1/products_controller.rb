class Api::V1::ProductsController < ApiController

  def index
    @products = Product.all


    respond_to do |format|
      format.any { render :partial => 'api/v1/products/index.json.jbuilder'}
    end
  end

end