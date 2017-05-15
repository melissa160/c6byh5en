class Api::V1::ProductsController < ApiController

  def index
    @products = Product.all
    json_response(@products)
  end

end