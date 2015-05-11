class UsagesController < ApplicationController
  before_action :set_usage, only: [:show, :edit, :update, :destroy]

  # GET /usages
  # GET /usages.json
  def index
    @usages = Usage.all
    # byebug
    # redirect_to usage_path(params[:id])

  end

  # GET /usages/1
  # GET /usages/1.json
  def show
    @shoppings = Shopping.all.where(:usage_id => params[:id])
    @price = 0
    @shoppings.each do |s|
      @price = @price + s.tag.item.price.tr('۰۱۲۳۴۵۶۷۸۹','0123456789').to_i
      # .tr!()
    end
  end

  def show_with_cart
    usage = Usage.where(:cart_id => params[:usage][:cart_id].to_i).last
    if not usage.blank?
      redirect_to :controller => :usages, :action => :show, :id => usage.id
    else
      redirect_to :back
    end
  end

  # GET /usages/new
  def new
    @usage = Usage.new

  end

  # GET /usages/1/edit
  def edit
  end

  # POST /usages
  # POST /usages.json
  def create
    # @usage = Usage.new
    # @usage.user_id = params[:user_id]
    # @usage.cart_id = params[:cart_id]
    # byebug
    @user = User.find(params[:usage][:user_id].to_i)
    @cart = Cart.find(params[:usage][:cart_id].to_i)
    @usage = @user.usages.new()
    @usage.cart_id = params[:usage][:cart_id].to_i


    respond_to do |format|
      if @usage.save
        format.html { redirect_to @usage, notice: 'Usage was successfully created.' }
        format.json { render :show, status: :created, location: @usage }
      else
        format.html { render :new }
        format.json { render json: @usage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usages/1
  # PATCH/PUT /usages/1.json
  def update
    respond_to do |format|
      if @usage.update(usage_params)
        format.html { redirect_to @usage, notice: 'Usage was successfully updated.' }
        format.json { render :show, status: :ok, location: @usage }
      else
        format.html { render :edit }
        format.json { render json: @usage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usages/1
  # DELETE /usages/1.json
  def destroy
    @usage.destroy
    respond_to do |format|
      format.html { redirect_to usages_url, notice: 'Usage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usage
      # byebug
      @usage = Usage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usage_params
      params.require(:usage).permit(:user_id, :cart_id)
    end
end
