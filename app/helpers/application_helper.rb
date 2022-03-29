module ApplicationHelper
  def person_movies(id)
      title=[]
      movies= Tmdb::Person.movie_credits(id)
      movies.cast.take(4).each do |movie|
        title.append(movie.title)
      end
      return title
  end

  def search_cast(movie_params)
      @movies=Tmdb::Search.movie(movie_params)
      p @movies
      cast=[]
      @movies.results.each do |movie|
          p movie.id
          person=Tmdb::Movie.cast(movie.id).first
          unless person.nil?
              cast.append("name"=> person.name,
                          "profile_path"=> 'https://image.tmdb.org/t/p/original/'+person.profile_path.to_s,
                          "known_for"=> person_movies(person.id))
          end
      end

      return cast.uniq!()
  end



end
