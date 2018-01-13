class TestController < ApplicationController
  def index
    if current_user
      @current_test = current_user.tests.last
      # вывести страницу окончания теста (типа результат + кнопка пройти ещё раз)
      if @current_test
        @end_page = @current_test.end_page? if @current_test
        @current_question = @current_test.questions[@current_test.last_question_number + 1]
      end
    else
      redirect_to root_path
    end
  end

  def create
  end
end
