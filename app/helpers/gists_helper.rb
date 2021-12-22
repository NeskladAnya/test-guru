module GistsHelper
  def gist_hash(gist)
    gist.url.split('/').last
  end

  def gist_question_truncate(gist)
    gist.question.body.truncate(28)
  end
end
