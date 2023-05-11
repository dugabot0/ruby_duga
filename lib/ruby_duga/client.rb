require "faraday"
require_relative "response"
require_relative "version"

module RubyDuga
  class Client
    BASE_URL          = "http://affapi.duga.jp/".freeze
    DEFAULT_AGENT_ID  = "40413".freeze
    DEFAULT_BANNER_ID = "01".freeze
    API_VERSION       = "1.2".freeze

    def initialize(options = {})
      @appid    = (ENV["DUGA_APP_ID"]       || options[:app_id])
      @agentid  = (ENV["DUGA_AGENT_ID"]     || options[:agent_id]  || DEFAULT_AGENT_ID)
      @bannerid = (ENV["DUGA_BANNER_AGENT"] || options[:banner_id] || DEFAULT_BANNER_ID)
    end

    API_MAP = {
      search: "search"
    }.freeze

    API_MAP.each do |method, path|
      define_method method do |params = {}|
        get(path, must.merge(params))
      end
    end

    private

    def must
      {
        appid: @appid,
        agentid: @agentid,
        bannerid: @bannerid,
        version: API_VERSION,
        format: "json"
      }
    end

    def get(path, options = {})
      Response.new(connection.get(path, options))
    end

    def connection
      @connection ||= Faraday.new(faraday_options) do |faraday|
        faraday.adapter  :net_http
        faraday.request  :url_encoded
        faraday.response :json
      end
    end

    def faraday_options
      {
        url: BASE_URL
      }
    end
  end
end
