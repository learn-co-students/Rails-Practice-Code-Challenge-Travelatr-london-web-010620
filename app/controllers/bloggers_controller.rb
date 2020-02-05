class BloggersController < ApplicationController

  def new
    @blogger = Blogger.new
  end
  
  def show
    @blogger = Blogger.find(params[:id])
  end

  def create
    # Create the new instance of pet.
    @blogger = Blogger.create(blogger_params)
    # If the pet is valid, redirect to the index.
    if @blogger.valid?
      redirect_to blogger_path(@blogger)
    # Otherwise, render the form again so that we can show the users the validation errors.
    else
      render :new
    end
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end

end
