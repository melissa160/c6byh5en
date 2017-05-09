class Api::V1::ProductsController < ApiController

  def index
    @products = Product.all

    request.format = :json
    respond_to do |format|
      format.json { render :index }
    end
  end

end