class Quiz < ActiveRecord::Base
  has_many :answered_questions, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :answered_questions
end
