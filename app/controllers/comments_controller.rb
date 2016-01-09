class CommentsController < ApplicationController
  def edit
  end

  def update
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @post.comments.build(comment_params)
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
end
