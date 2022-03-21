class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Event.comment.new( params.require(:comment).permit(:content, :user_id))
    if @comment.save
      flash[:notice] = "Event successfully created"
      redirect_to event_path(@comment)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_event_path
    end
  end

  def destroy
  end
end
