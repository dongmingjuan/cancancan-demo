class TopicsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @topics = Topic.all
  end
  def new
  
  end
  def edit
  end
  def update
    if @topic.update(topic_params)
      redirect_to topics_path
    else
      render :edit
    end
  end
  def create

    @topic.user = current_user
    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
  end
  def show

  end
  def destroy

    @topic.destroy
    redirect_to topics_path
  end
  private
  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
