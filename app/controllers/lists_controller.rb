class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  # GET /restaurants
  def index
    @lists = List.all
  end

  # GET /restaurants/1
  def show; end

  # GET /restaurants/new
  def new
    @lists = List.new
  end

  # GET /restaurants/1/edit
  # POST /restaurants
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end
end
