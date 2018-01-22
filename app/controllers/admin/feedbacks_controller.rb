module Admin
  class FeedbacksController < AdminController
    def index
      @feedbacks = Feedback.all
    end

  end
end
