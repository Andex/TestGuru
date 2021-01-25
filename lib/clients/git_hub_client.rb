class GitHubClient

  # url сервиса, к к-му будут посылаться запросы
  ROOT_ENDPOINT = 'https://api.github.com'

  ACCESS_TOKEN = ENV['ACCESS_TOKEN']

  # установка http клиента
  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      # передача токена в заголовке т.к. используется способ OAuth2 Token
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      # параметры должны быть в формате json
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end
