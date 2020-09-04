class CommentsController < ApplicationController
  def new
    @topic = Topic.find_by(id: params[:topic_id]) 
    @comment =Comment.new
  end
  
  def create
    @comment = Comment.new(sentence: params[:comment][:sentence],topic_id: params[:comment][:topic_id])
    @comment.user_id = current_user.id
    if @comment.save
      # flashはなくてもいいかも
      redirect_to topics_path, success: "コメントを送信しました"
    else
      flash.now[:danger] = "コメントを送れないのよ"
      render :new
    end
  end
end
