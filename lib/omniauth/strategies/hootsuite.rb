require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Hootsuite < OmniAuth::Strategies::OAuth2
      option :name, :hootsuite

      option :client_options, {
        :site => 'https://api.hootsuite.com',
        :authorize_url => 'https://apis.hootsuite.com/auth/oauth/v2/authorize',
        :token_url => 'https://apis.hootsuite.com/auth/oauth/v2/token'
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
        @raw_info ||= access_token.get('/v1/me').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'hootsuite', 'Hootsuite'
