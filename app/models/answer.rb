class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question

  validates :user_id, presence: true
  validates :test_id, presence: true
  validates :question_id, presence: true

  before_create :check_correctness, if: proc{ |a| a.answer.present? }

  def similar_arrays?(array1, array2, similarity = 0.81)
    sence_changing_words = %w(не нет)
    return true if array1.sort == array2.sort
    size = [array1.size, array2.size].max
    arrays_diff = (array2 - array1) + (array1 - array2)
    (arrays_diff.size.to_f / size < 1 - similarity) && (arrays_diff & sence_changing_words).empty?
  end

  def analize_string(str)
    trash_words = %w(потому что был была были было это как очень)
    str.gsub!(/[[:punct:]]/, '') # удаление знаков пунктуации
    str = str.mb_chars.downcase.to_s # приведение к нижнему регистру
    str.gsub!('ё', 'е') # замена ё на е
    str.gsub!(/[\s\r\n]+/, ' ') # удаление лишних пробелов
    words = str.split(' ') # разбиение на массив слов
    words - trash_words # исключение мусорных слов
  end

  private

  def check_correctness
    true_answers = question.correct_answer_variants.map{ |a| analize_string(a) }
    false_answers = question.incorrect_answer_variants.map{ |a| analize_string(a) }
    answered = analize_string(answer)
    if true_answers.find{ |a| similar_arrays?(a, answered) }.present?
      self.correct = true
      number = question.tours.first.number
      user.test_rating.increment!("tour_#{number}")
    elsif false_answers.find{ |a| similar_arrays?(a, answered) }.present?
      self.incorrect = true
    else
      question.update(incorrect_answer_variants: question.incorrect_answer_variants + answer)
      self.incorrect = true
    end
  end
end
