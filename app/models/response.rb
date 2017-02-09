# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer          not null
#  respondent_id    :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#


class Response < ActiveRecord::Base

  validate :not_duplicate_response

  belongs_to :respondent,
    class_name: :User,
    primary_key: :id,
    foreign_key: :respondent_id

  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :answer_choice_id

  has_one :question,
    through: :answer_choice,
    source: :question

  def not_duplicate_response
    if respondent_already_answered?
      errors[:respondent] << "already answered this question"
    end
  end

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    return false unless Response.exists?(respondent_id)
    sibling_responses.any? do |response|
      response.respondent_id == respondent_id
    end
  end

end
