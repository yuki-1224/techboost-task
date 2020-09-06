class CommentsController < ApplicationController
  def new
    @topic = Topic.find_by(id: params[:topic_id]) 
    @comment = Comment.new
    @comments = Comment.where(topic_id: params[:topic_id])
  end
  
  def create
    @comment = Comment.new(sentence: params[:comment][:sentence],topic_id: params[:comment][:topic_id])
    @comment.user_id = current_user.id
    if @comment.save
      # flashはなくてもいいかも
      redirect_to comments_new_path, success: "コメントを送信しました"
    else
      @topic = Topic.find_by(id: params[:topic_id])
      flash.now[:danger] = "コメントを送れないのよ"
      render :new
    end
  end
  
  def comment_params
    params.require(:comment).permit(:sentence, :topic_id)
  end
end
