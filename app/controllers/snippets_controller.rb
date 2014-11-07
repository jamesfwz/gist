class SnippetsController < ApplicationController
  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(create_params)

    if @snippet.save
      flash[:notice] = 'Snippet created successfully.'
      redirect_to new_snippet_url
    else
      render :new
    end
  end
  
  def edit
    @snippet = Snippet.find(snippet_id)
  end

  private

  def create_params
    params.require(:snippet).permit(:title, :content)
  end

  def snippet_id
    params.require(:id)
  end
end