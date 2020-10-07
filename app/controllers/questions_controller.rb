class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @questions = Question.all
    @rank = Question.team_rank
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to request.referrer, notice: '投票しました。'
    else
      redirect_to request.referrer, notice: '投票することができませんでした。'
    end
  end

  private

  def question_params
    params.require(:question).permit(:team)
  end
end
