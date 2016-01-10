class CommentsController < ApplicationController
  def edit
  end

  def update
  end

  def create
    @new_comment = Comment.new(comment_params)
    @new_comment.update_attributes(user_id: current_user.id)
    respond_to do |format|
      if @new_comment.save
        format.html { redirect_to @new_comment, notice: 'new_comment was successfully created.' }
        format.json { render json: @new_comment, status: :created, location: @new_comment }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @new_comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def show
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :recipe_id)
  end
end
