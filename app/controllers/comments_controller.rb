class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    respond_to do |format|
      if @comment.save
        format.html{ redirect_to topic_path(@topic), notice: 'コメントを投稿しました！'}
        format.js {render :index}
      else
        format.html {render :new}
      end
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    @topic = @comment.topic
    redirect_to topic_path(@topic)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @topic = @comment.topic

    respond_to do |format|
      if @comment.destroy
        format.html{ redirect_to topic_path(@topic), notice: 'コメントを削除しました！'}
        format.js {render :index}
      else
        format.html {render :new}
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end
end
