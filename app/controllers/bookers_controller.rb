class BookersController < ApplicationController
  def new
    @booker = Booker.new
  end

  def create
    @booker = Booker.new(booker_params)
    if @booker.save
     flash[:notice] = "投稿が成功しました"
     redirect_to booker_path(@booker.id)
    else
     render :new
    end
  end

  def index
    @bookers = Booker.all
  end

  def show
    @booker = Booker.find(params[:id])
  end

  def edit
    @booker = Booker.find(params[:id])
  end

  def update
    booker = Booker.find(params[:id])
    booker.update(booker_params)
    redirect_to booker_path(booker.id)
  end

  def destroy
    booker = Booker.find(params[:id])
    booker.destroy
    redirect_to '/bookers'
  end


  private

  def booker_params
    params.require(:booker).permit(:title, :body)
  end
end
