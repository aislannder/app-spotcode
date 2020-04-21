class ApplicationController < ActionController::Base
    #forca autenticacao, a menos que nao seja /
    before_action :authenticate_user!, unless: -> { request.env['PATH_INFO'] == '/' }
    #liberar chamadas externas ao app do tipo json
    protect_from_forgery unless: -> { request.format.json? }

    def after_sign_in_path_for(resource)
    '/discovery'
    end

end
