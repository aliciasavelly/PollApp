# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#


class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  belongs_to :poll,
    class_name: :Poll,
    primary_key: :id,
    foreign_key: :poll_id

  has_many :answer_choices,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :question_id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    votes = self.answer_choices.includes(:responses)
    results = {}

    votes.each do |answer_choice|
      results[answer_choice.text] = answer_choice.responses.length
    end

    results
  end

  def results_sql
    self.answer_choices.select("answer_choices.text, COUNT(responses.id) AS num_votes")
      .joins("LEFT JOIN responses ON responses.answer_choice_id = answer_choices.id")
      .where("answer_choices.question_id = ?", self.id)
      .group("answer_choices.id")

    # Below is a working SQL query

    # PollApp_development.instance.execute(<<-SQL, question_id)
    #   SELECT
    #     answer_choices.*, COUNT(responses.answer_choice_id) AS num_votes
    #   FROM
    #     answer_choices
    #   LEFT JOIN
    #     responses ON responses.answer_choice_id = answer_choices.id
    #   WHERE
    #     answer_choices.question_id = ?
    #   GROUP BY
    #     answer_choices.id
    # SQL
  end

end
