class NovelsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @novels = Novel.all.order("created_at DESC")
  end

  def new
    @novel = Novel.new
  end

  def create
    @novel = Novel.new(novel_params)
    @novel.save
    if @novel.valid?
      redirect_to "/"
    else
      render :new
    end
  end

  def show
    @novel = Novel.find(params[:id])
  end

  private
  def novel_params
    params.require(:novel).permit(:title, :content, :image).merge(user_id: current_user.id)
  end
end
