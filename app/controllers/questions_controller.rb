class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @have_team = current_user.questions.first.team
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to request.referrer, notice: '投稿しました。'
    else
      redirect_to request.referrer, notice: '投稿することができませんでした。'
    end
  end

  private

  def question_params
    params.require(:question).permit(:team)
  end
end
