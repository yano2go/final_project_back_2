class GifsController < ApplicationController
  before_action :set_gif, only: [:show, :update, :destroy]
  before_action :authorized, only:  [:create, :update,:destroy]

  # GET /gifs
  def index
    @category= Gif.where({category: params[:category]})

   @gif = Gif.all()
   if params[:category] == nil 
      render json: @gif 
    else render json: @category
    end
  end

  # GET /gifs/1
  def show
    render json: @gif
  end

  # POST /gifs
  def create
    @gif = Gif.new (gif_params.merge({user_id: @user.id}))

    if @gif.save
      render json: @gif, status: :created, location: @gif
    else
      render json: @gif.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gifs/1
  def update
    if @user.id == @gif.user_id
    if @gif.update(gif_params)
      render json: @gif
    else
      render json: @gif.errors, status: :unprocessable_entity
    end
    
    end
  end

  # DELETE /gifs/1
  def destroy
    
    
    if @user.id == @gif.user_id
    @gif.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gif
      @gif = Gif.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gif_params
      params.require(:gif).permit(:name, :category, :description, :gif_url, :gif_file)
    end
end
