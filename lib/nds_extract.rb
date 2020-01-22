# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  movie_array = []
 i = 0
 while i < movies_collection.length do
   pp movies_collection
   movies = movies_collection[i]
   #pp movies_collection[0]
   #movie_array = movie_with_director_name(name, movies)
   movie_array.push(movie_with_director_name(name, movies))
   i += 1
   #puts movie_with_director_name(name, movies)
 end
 #puts movies_collection
 movie_array
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  i = 0
total = 0
array_total = []
new_hash_with_gross_total = {}
inner_count = 0
while i < collection.length do
  inner_nds = collection[i]
  #studio_name = collection[i][:studio]
  #inner_studio_name = ""
  #while inner_count < collection.length do
  #  if studio_name == collection[inner_count][:studio]
  #    total += collection[inner_count][:worldwide_gross]
  #    inner_studio_name = collection[inner_count][:studio]
  #    #array_total[inner_count] << total
      #puts "algo time #{inner_count}"
  #    new_hash_with_gross_total[inner_studio_name] = total
  #  else
  #    inner_studio_name = collection[inner_count][:studio]
  #        total = collection[inner_count][:worldwide_gross]
  #    new_hash_with_gross_total[inner_studio_name] = total
  #  end
    #new_hash_with_gross_total[inner_studio_name] = total
  #  inner_count += 1
  #end
  if new_hash_with_gross_total[inner_nds[:studio]]
    new_hash_with_gross_total[inner_nds[:studio]] += inner_nds[:worldwide_gross]
  else
    new_hash_with_gross_total[inner_nds[:studio]] = inner_nds[:worldwide_gross]
  end
  i += 1
end
#puts total
#puts new_hash_with_gross_total
new_hash_with_gross_total
#pp collection
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  aoa_movies = []
  i = 0
  while i < source.length do
    data = source[i]
    dir_name = data[:name]
    dir_movies = data[:movies]
    aoa_movies << movies_with_director_key(dir_name, dir_movies)
    i += 1
  end
  aoa_movies
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
