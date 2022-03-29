class ApplicationController < ActionController::Base
    require 'json'
    before_action :connect_themoviedb

    def connect_themoviedb
        Tmdb::Api.key("63ce4104c0e1e8b11f1e8bfbbd288b26")
        Tmdb::Movie.detail(550, language: 'it')
        Tmdb::Api.language("pt-br")

    end

    def search_movie
        begin
            cast=helpers.search_cast(params[:movie])
            render json: JSON.pretty_generate(cast)
        rescue
            render json: 'Filme nao encontrado'
        end
    end
end
