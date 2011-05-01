class Question < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
  attr_reader :question_id
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  def self.random
    find(:all,:select => 'id', :order => "RANDOM()", :limit => 10).map {|x| x.id}
    #find(:all, :select => :id, :order => "RANDOM()", :limit => 10)
    #ids = find(:select => :question_id, :order => "RANDOM()", :limit => 10)
    # if (c = count) != 0
    #   find(:first, :offset =>rand(c))
    # end
  end

end
