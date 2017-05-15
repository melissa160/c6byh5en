class Api::V1::ProductsController < ApiController
skip_before_action :verify_authenticity_token, if: :json_request?

  def index
    @products = Product.all
    json_response(@products)
  end

  def create
    @product = Product.new(products_params)

    if @product.save
      json_response(@product, :created)
    else
      @error = {error: @product.errors.full_messages}
      json_response(@error, 422)
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(products_params)
    if @product.valid?
      json_response(@product)
    else
      @error = {error: @product.errors.full_messages}
      json_response(@error, 422)
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    json_response({}, 204)
  end

  private
  
  def products_params
    params.permit(:name, :price)
  end

  def json_request? 
    request.format.json?
  end

end