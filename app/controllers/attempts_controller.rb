class AttemptsController < ApplicationController
  def index
    @attempts = Attempt.all
  end

  def show
    @attempt = Attempt.find(params[:id])
  end

  def new
    @attempt = Attempt.new
  end

  def create
    @attempt = Attempt.new
    if params[:correct]
      @attempt.correct = params[:correct]
    else
      @attempt.correct = false
    end

    @attempt.user_id = params[:user_id]
    @attempt.character_id = params[:character_id]

    if @attempt.save
      redirect_to "/attempts", :notice => "Attempt created successfully."
    else
      render 'new'
    end
  end

  def edit
    @attempt = Attempt.find(params[:id])
  end

  def update
    @attempt = Attempt.find(params[:id])

    @attempt.correct = params[:correct]
    @attempt.user_id = params[:user_id]
    @attempt.character_id = params[:character_id]

    if @attempt.save
      redirect_to "/attempts", :notice => "Attempt updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @attempt = Attempt.find(params[:id])

    @attempt.destroy

    redirect_to "/attempts", :notice => "Attempt deleted."
  end
end
