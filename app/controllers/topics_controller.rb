class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    # binding.pry
    if @topic.save
      redirect_to topics_path, success: "投稿完了"
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