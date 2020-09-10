class CommentsController < ApplicationController
  def new
    if params[:topic_id]
      @topic = Topic.find_by(id: params[:topic_id]) 
      @comment = Comment.new
      @comments = Comment.where(topic_id: params[:topic_id])
    else
      @topic = Topic.find_by(id: params[:comment][:topic_id]) 
      @comment = Comment.new
      @comments = Comment.where(topic_id: params[:comment][:topic_id])
    end
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      # flashはなくてもいいかも
      redirect_to comments_new_path(comment: comment_params), success: "コメントを送信しました"
    else
      @topic = Topic.find_by(id: params[:comment][:topic_id])
      @comments = Comment.where(topic_id: params[:comment][:topic_id])
      flash.now[:danger] = "コメントを送れません"
      render :new
    end
  end
    
  def destroy
    comment =Comment.find_by(id: params[:comment_id])
    comment.destroy
    redirect_to topics_path, info: "コメントを削除しました"
  end
  
  def comment_params
    params.require(:comment).permit(:sentence, :topic_id)
  end
end
