class CatsController < ApplicationController
  before_action :set_cat, only:[:show, :edit, :update]
  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def create
    cat = Cat.new(cat_params)
    if cat.save
      flash[:notice] = "You successfully created a cat"
      redirect_to cat_path(cat)
    else
      @cat = cat
      render :new
    end
  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      flash[:notice] = "You successfully updated a cat"
      redirect_to cat_path(@cat)
    else
      render :edit
    end
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    flash[:notice] = "You deleted a cat"
    redirect_to root_path
  end

  private

  def cat_params
    params.require(:cat).permit(:name)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end

end
