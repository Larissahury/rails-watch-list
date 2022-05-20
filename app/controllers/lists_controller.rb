class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  # GET /list
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show; end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to :root, notice: 'List was successfully deleted.'
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
