class CommentsController < ApplicationController
  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment created"
      redirect_to @entry
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @entry = Entry.find(params[:entry_id])
    @comment = Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to @entry
  end

  private
	def comment_params
		params.require(:comment).permit(:content)
	end
end