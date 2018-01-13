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
    subject = Subject.find_by(id: params[:subject_id])
    if subject
      if current_user
        questions_count = subject.questions_count
        # сделать выборку вопрос рандомно
        test_questions = subject.questions.first(questions_count)
        if test_questions.count == questions_count
          test = current_user.tests.create(subject: subject)
          test.questions << test_questions
          redirect_to test_index_path
        else
          flash[:info] = 'Недостаточно вопросов для теста по данному предмету, обратитесь к преподавателю!'
          redirect_to root_path
        end
      else
        flash[:danger] = 'Для прохождения теста нужно авторизоваться'
        redirect_to root_path
      end
    else
      flash[:danger] = 'Выберите предмет тестирования'
      redirect_to root_path
    end
  end
end
