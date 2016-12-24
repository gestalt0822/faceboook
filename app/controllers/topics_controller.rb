class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:edit, :update, :show, :destroy]

  def index
    @topics = Topic.all.order(created_at: :desc)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path, notice: "投稿しました！"
    else
      render 'new'
    end
  end

  def edit
    unless @topic.user_id == current_user.id
      redirect_to root_path, notice: "自分の投稿以外は編集出来ません！"
    end
  end

  def update
    if @topic.user.id == current_user.id
      @topic.update(topic_params)
      redirect_to topics_path
    end
  end

  def show
  end

  def destroy
    if @topic.user.id == current_user.id
      @topic.destroy
      redirect_to topics_path
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :content)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
