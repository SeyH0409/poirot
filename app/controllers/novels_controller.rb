class NovelsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_novel, only: [:show, :destroy]
  before_action :unless_novel_user, only: [:destroy]

  def index
    @novels = Novel.includes(:user).order("created_at DESC")
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
    @tips = @novel.tips.all
  end

  def destroy
    if @novel.destroy
      redirect_to "/"
    end
  end

  private
  def novel_params
    params.require(:novel).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def set_novel
    @novel = Novel.find(params[:id])
  end


  def unless_novel_user
    unless current_user.id == @novel.user_id
      redirect_to "/"
    end
  end
end
