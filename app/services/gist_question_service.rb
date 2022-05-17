class GistQuestionService
  Result = Struct.new(:hash) do
    def success?
      !hash.nil?
    end

    def url
      hash.html_url
    end
  end

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test

    @client = client 
  end

  def call
    Result.new(@client.create_gist(gist_params))
  end

  private

  def default_client
    Octokit::Client.new(:access_token => ENV.fetch('OCTOKIT_TEST_GITHUB_TOKEN'))
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
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
