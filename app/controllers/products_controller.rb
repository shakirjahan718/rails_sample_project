class ProductsController < ApplicationController
  # filters
  # before_action :check_login?, only: [:index]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  after_action :write_log
  prepend_before_action :action1, :action2 
  # prepend_after_action :action2

  # GET /products or /products.json
  def index
    @products = Product.paginate(page: params[:page])
  end

  def premium
    @products = Product.premium
  end

  def by_price
    @products = Product.get_by_price(20000)
  end  

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    # respond_to do |format|
    #   format.js
    # end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.js{}
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      Rails.logger.info(".............SET PRODUCT................")
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :model, :price)
    end

    def write_log
      Rails.logger.info("Executing action from #{action_name}")
    end
    
end
