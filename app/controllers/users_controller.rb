class UsersController < ApplicationController
  def statistic
    # вписать статистику со страницы окончания теста
  end

  def statistics
    if current_user
      user = User.find_by(id: params[:id])
      if current_user.id == user.id || current_user.has_role?(:admin)
        @subjects = Subject.all
        @statistics = user.statistics.order(created_at: :desc).last(100)
      else
        flash[:danger] = 'Нет доступа к просмотру чужой статистики'
        redirect_to root_path
      end
    else
      flash[:info] = 'Нужно авторизоваться'
      redirect_to root_path
    end
  end

  def subject_statistics
    if current_user
      subject_id = params[:subject_id]
      @statistics = current_user.statistics.where(subject_id: subject_id).order(created_at: :desc).last(100)
    else
      flash[:info] = 'Нужно авторизоваться'
      redirect_to root_path
    end
  end
end
