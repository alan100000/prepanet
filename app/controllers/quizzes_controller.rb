class QuizzesController < ApplicationController
  # GET /quizzes
  # GET /quizzes.xml
  def index
    @quizzes = Quiz.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quizzes }
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.xml
  def show
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quiz }
    end
  end

  # GET /quizzes/new
  # GET /quizzes/new.xml
  def new
    @quiz = Quiz.new
    @ques = Question.random
    
    @ques.each do |a|
      temp=@quiz.answered_questions.build
      temp.question_id=a
    end

    # 10.times do
    #   temp=@quiz.answered_questions.build
    #   temp.question=Question.random
    # end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quiz }
    end
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  # POST /quizzes
  # POST /quizzes.xml
  def create
    total = 0
    correct = 0
    @quiz = Quiz.new(params[:quiz])

    respond_to do |format|
      if @quiz.save
        @quiz.answered_questions.each do |a|
          total += 1
          if a.answer_chosen == a.question.correct_answer
            correct += 1
            a.update_attribute(:result,1)
          else
            a.update_attribute(:result,0)
          end

          @quiz.update_attribute(:num_correct,correct)
          @quiz.update_attribute(:num_total,total)
        end

        format.html { redirect_to(@quiz, :notice => 'Quiz was successfully created.') }
        format.xml  { render :xml => @quiz, :status => :created, :location => @quiz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quiz.errors, :status => :unprocessable_entity }
      end
    end


  end

  # PUT /quizzes/1
  # PUT /quizzes/1.xml
  def update
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      if @quiz.update_attributes(params[:quiz])
        format.html { redirect_to(@quiz, :notice => 'Quiz was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quiz.errors, :status => :unprocessable_entity }
      end
    end

  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.xml
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to(quizzes_url) }
      format.xml  { head :ok }
    end
  end
end
