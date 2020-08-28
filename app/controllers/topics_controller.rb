class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topic_path, success: "投稿完了"
    else
      flash.now[:danger] = "投稿失敗"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end