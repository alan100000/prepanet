class Question < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
  attr_reader :question_id
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  def self.random
    if (c = count) != 0
      find(:first, :offset =>rand(c))
    end
  end

end
