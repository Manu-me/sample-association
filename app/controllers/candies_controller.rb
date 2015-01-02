class CandiesController < ApplicationController
  before_action :set_candy, only: [:show, :edit, :update, :destroy]

  # GET /candies
  # GET /candies.json
  def index
    @candies = Candy.all
    @kid = Kid.find(params[:kid_id])
  end

  # GET /candies/1
  # GET /candies/1.json
  def show
        @kid = Kid.find(params[:kid_id])
  end

  # GET /candies/new
  def new
    @candy = Candy.new
    @kid = Kid.find(params[:kid_id])    
  end

  # GET /candies/1/edit
  def edit
    @kid = Kid.find(params[:kid_id])
  end

  # POST /candies
  # POST /candies.json
  def create
    @candy = Candy.new(candy_params)
     @kid = Kid.find(params[:kid_id])
    respond_to do |format|
      if @candy.save
        format.html { redirect_to kid_candy_path(@kid,@candy), notice: 'Candy was successfully created.' }
        format.json { render :show, status: :created, location: @candy }
      else
        format.html { render :new }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candies/1
  # PATCH/PUT /candies/1.json
  def update
    @kid = Kid.find(params[:kid_id])
    respond_to do |format|
      if @candy.update(candy_params)
        format.html { redirect_to kid_candy_path(@kid,@candy), notice: 'Candy was successfully updated.' }
        format.json { render :show, status: :ok, location: @candy }
      else
        format.html { render :edit }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candies/1
  # DELETE /candies/1.json
  def destroy

    puts "========================================"

    puts params[:kid_id], params[:id]


    puts "========================================"
     @kid = Kid.find(params[:kid_id])
    @candy.destroy
    respond_to do |format|
      format.html { redirect_to kid_path(@kid), notice: 'Candy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candy

      @candy = Candy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candy_params
      params.require(:candy).permit(:name, :kid_id)
    end
end
