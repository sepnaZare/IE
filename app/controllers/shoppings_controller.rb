class ShoppingsController < ApplicationController
  before_action :set_shopping, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!
  before_filter :card_detection_filter , only: [:card_detection]
  # after_action :set_content, only: [:card_detection]
  # helper_method :card_detection


  # GET /shoppings
  # GET /shoppings.json
  def card_detection
  end



  def index
    @shoppings = Shopping.all
  end

  # GET /shoppings/1
  # GET /shoppings/1.json
  def show
  end

  # GET /shoppings/new
  def new
    @shopping = Shopping.new
  end

  # GET /shoppings/1/edit
  def edit
  end

  # POST /shoppings
  # POST /shoppings.json

  def create
    # @usage = Usage.find(params[:usage_id])
    # @shopping = @usage.shoppings.new()

    @shopping = Shopping.new(shopping_params)

    respond_to do |format|
      if @shopping.save
        format.html { redirect_to @shopping, notice: 'Shopping was successfully created.' }
        format.json { render :show, status: :created, location: @shopping }
      else
        format.html { render :new }
        format.json { render json: @shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoppings/1
  # PATCH/PUT /shoppings/1.json
  def update
    respond_to do |format|
      if @shopping.update(shopping_params)
        format.html { redirect_to @shopping, notice: 'Shopping was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping }
      else
        format.html { render :edit }
        format.json { render json: @shopping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoppings/1
  # DELETE /shoppings/1.json
  def destroy
    @shopping.destroy
    respond_to do |format|
      format.html { redirect_to shoppings_url, notice: 'Shopping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping
      @shopping = Shopping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_params
      params.require(:shopping).permit(:usage_id, :purchase_id, :tag_id)
    end

    def card_detection_filter

    # TODO: bayad tag ba in serial peida kone ; be liste kharid ezafe kone
    
      if Tag.find_by(tag_serial: params[:tag_serial], is_sold: false) 
        @content = "ok"
        @tag = Tag.find_by(tag_serial: params[:tag_serial])
        if not @usage = Usage.find_by(cart_id: params[:cart_id])
          @usage = Usage.new
          @usage.cart_id = params[:cart_id]
          @usage.save
        end
        @shopping = Shopping.new
        @shopping.tag_id = @tag.id
        @shopping.usage_id = @usage.id
        @shopping.purchase_id = 0
        @shopping.save
      else
        @content = "nok"
      end

      render :layout => false
    end


  # protected
  #   def set_content
  #     @content = 'felan'
  #     byebug
  #   end
end
