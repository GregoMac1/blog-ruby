class NewsController < ApplicationController
  #load_and_authorize_resource
  before_action :get_new, only: [:show, :edit, :update, :destroy]

  def get_new
    @new = New.find(params[:id])
  end

  def index
    @news = New.all
  end

  def show
  end

  def new
    @new = New.new
  end

  def create
    @new = New.new(new_params)
    if @new.save
      redirect_to @new
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @new.update(new_params)
      redirect_to @new
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @new.destroy
    redirect_to news_url, status: :see_other
  end

  private
    def new_params
      params.require(:new).permit(:name, :address, :phone)
    end
end
