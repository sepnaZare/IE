class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]


  # GET /tags
  # GET /tags.json

  def add_tag
    @tag = Tag.new
    @tag.is_sold = false
    @tag.item_id = current_user.store.current_item_id
    @tag.tag_serial = params[:tag_serial]
    @tag.save
  end

  def index
    # byebug
    # @tags = Tag.all
    @tags = Tag.search(params[:item]) 
    @store = current_user.store
    @store.current_item_id = params[:item]
    @store.save
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new
    @tag.item_id = params[:item_id]
    @tag.tag_serial = params[:tag_serial]
    @tag.is_sold = params[:is_sold]

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:item_id, :is_sold, :tag_serial)
    end
end
