class AddGradeToQuizzes < ActiveRecord::Migration
  def self.up
    add_column :quizzes, :num_correct, :integer
    add_column :quizzes, :num_total, :integer
  end

  def self.down
    remove_column :quizzes, :num_correct
    remove_column :quizzes, :num_total
  end
end
