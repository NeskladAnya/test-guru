class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test

    @client = client || setup_client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def setup_client
    @client = Octokit::Client.new(:access_token => ENV.fetch('OCTOKIT_TEST_GITHUB_TOKEN'))
  end

  def gist_params
    {
      description: I18n.t('services.gist.title', title: @test.title),
      files: {
        'test-gutu-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
