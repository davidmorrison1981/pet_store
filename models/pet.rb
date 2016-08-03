require ( 'pg' )
require_relative( '../db/sql_runner' )

class Pet
   
  attr_reader( :id, :store_id, :pet, :type )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @store_id = options[ 'store_id' ].to_i
    @pet = options[ 'pet' ]
    @type = options[ 'type' ]
  end

  def save()
    sql = "INSERT INTO pets ( pet, store_id, type ) VALUES ( '#{ @pet }', '#{@store_id}', '#{type}' ) RETURNING *;"
    pet = SqlRunner.run( sql ).first
    @id = pet[ 'id' ].to_i
  end

  def store()
    sql = "SELECT * FROM stores WHERE id = #{@store_id};"
    store = SqlRunner.run( sql ).first
    result = Store.new(store)
    return result 
  end

end