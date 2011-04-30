class CreateAnsweredQuestions < ActiveRecord::Migration
  def self.up
    create_table :answered_questions do |t|
      t.integer :question_id
      t.integer :answer_chosen
      t.integer :result
      t.integer :quiz_id

      t.timestamps
    end
  end

  def self.down
    drop_table :answered_questions
  end
end
