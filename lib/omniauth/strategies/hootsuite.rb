require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Hootsuite < OmniAuth::Strategies::OAuth2
      option :name, :hootsuite

      option :client_options, {
        site: 'https://platform.hootsuite.com',
        authorize_url: 'https://platform.hootsuite.com/oauth2/auth',
        token_url: 'https://platform.hootsuite.com/oauth2/token'
      }

      uid { raw_info['data']['id'].to_s }

      info do
        {
          'name' => raw_info['data']['fullName'],
          'organization' => raw_info['data']['companyName'],
          'email' => raw_info['data']['email']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        res = access_token.get('/v1/me')
        pp res
        pp res.parsed
        @raw_info ||= res.parsed
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
    end
  end
end

OmniAuth.config.add_camelization 'hootsuite', 'Hootsuite'
