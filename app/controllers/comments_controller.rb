class CommentsController < ApplicationController
  def edit
  end

  def update
  end

  def create
    p "$$$$$$$$$$$$$$$"*50
    p params
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Comment posted.'
      redirect_to @recipe
    else
      render @recipe
    end
  end

  def show
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
