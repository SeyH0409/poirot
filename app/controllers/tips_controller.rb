class TipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_novel
  before_action :back_to_top
  def index
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(tip_params)
    if @tip.valid?
      tip_novel
      @tip.save
      redirect_to novel_path(@tip.novel)
    else
      render :index
    end
  end

  private
  def tip_params
    params.require(:tip).permit(:price).merge(user_id: current_user.id, novel_id: params[:novel_id], token: params[:token])
  end

  def set_novel
    @novel = Novel.find(params[:novel_id])
  end

  def tip_novel
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: tip_params[:price],
      card: tip_params[:token],
      currency: 'jpy'
    )
  end

  def back_to_top
    if current_user.id == @novel.user.id
      redirect_to "/"
    end
  end
end
