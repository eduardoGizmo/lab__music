require ('pg')
require_relative ('../db/sql_runner')
require_relative('album')

class Artists
  attr_reader :id
  attr_accessor :name


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run( sql, values )
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artist WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def list_albums_by_artist()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    albums = results.map {|album| Albums.new(album)}
    return albums
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    customers = SqlRunner.run(sql)
    return customers.map{ |artist| Artist.new(artist)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end


end
