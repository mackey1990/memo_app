class MemosController < ApplicationController

  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.create(memo_params)
    if @memo.save
      redirect_to memos_path
    else
      render :new
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    # @memo = Memo.find(params[:id])
  end

  def update
    if @memo.update(memo_params)
      redirect_to memos_path
    else
      render
    end
  end

  def destroy
    # memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to "/memos"
  end

  private

  def memo_params
    params.require(:memo).permit(:title, :content)
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end

end
