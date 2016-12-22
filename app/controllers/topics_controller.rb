class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :show, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path, notice: "投稿しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @topic.update(topic_params)
    redirect_to topics_path
  end

  def show
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :content, :name)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
