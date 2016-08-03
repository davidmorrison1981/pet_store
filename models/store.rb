require ( 'pg' ) 
require_relative( '../db/sql_runner' )

class Store

  attr_reader( :id, :name, :address, :stock_type )

  def initialize(options)
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @address = options[ 'address' ]
    @stock_type = options[ 'stock_type' ]
  end

  def save()
    sql = "INSERT INTO stores ( name, address, stock_type ) VALUES ( '#{ @name }', '#{@address}', '#{@stock_type}' ) RETURNING *;"
    store = SqlRunner.run( sql ).first
    @id = store[ 'id' ].to_i
  end

  def pets()
    sql = "SELECT * FROM pets WHERE pet_id = #{@id};"
    pet = SqlRunner.run( sql )
    result = pet.map{ |pet| Pet.new(pet)}
    return result 
  end

  # def self.all()
  #   sql = "SELECT * FROM artists;"
  #   artists = SqlRunner.run( sql )
  #   result = artists.map{ |artist| Artist.new(artist) }
  #   return result
  # end

  # def self.find(id)
  #   sql = "SELECT * FROM artists WHERE id = #{id};"
  #   artist = SqlRunner.run( sql ).first
  #   return Artist.new(artist)
  # end
  

end