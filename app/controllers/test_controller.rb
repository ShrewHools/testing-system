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

  def next_step
    test = current_user.tests.last
    next_question_number = params[:last_question_number].to_i + 1
    next_question = test.questions[next_question_number] if test
    if next_question
      @current_test = test
      @current_question = next_question
    else
      # конец теста
    end
    # сделать метод создания ответа
    # create_answer if params[:answer]
    update_setting
  end

  def create_answer

  end

  private

  def update_setting
    test = current_user.tests.last
    question = params[:last_question_number].to_i

    test.update(last_question_number: question) if question > test.last_question_number
    questions_count_subject = test.subject.questions_count

    if question + 1 == questions_count_subject
      test.update(end_page: true)
    end
  end
end
