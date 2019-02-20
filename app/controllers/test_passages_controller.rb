class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    gist_url = result.call
    
    flash_options = 
      if result.success?
        create_gist!(gist_url)
        { notice: t('.success', url: gist_url.html_url) }
      else
        { alert: t('.failure') }
      end

    redirect_to @test_passage, flash_options
  end

  def update
    if checking_timer
      @test_passage.completed?
    else
      @test_passage.accept!(params[:answer_ids])
    end

    if @test_passage.completed?
      BadgeRules.new(@test_passage).call

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def create_gist!(gist_url)
    current_user.gists.create(question: @test_passage.current_question, url: gist_url.html_url)
  end

  def checking_timer
    if @test_passage.test.timer && @test_passage.overtime?(@test_passage.end_time)
      redirect_to result_test_passage_path(@test_passage)
    end
  end

end
