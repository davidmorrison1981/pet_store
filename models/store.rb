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

  def self.find(id)
    sql = "SELECT * FROM stores WHERE id = #{id};"
    store = SqlRunner.run( sql ).first
    return Store.new(store)
  end

  def update()
     sql = "UPDATE stores SET (
       name = '#{@name}',
       address = '#{@address}',
       stock_type = '#{@stock_type}', 
       WHERE id = #{@id};)
       "
    result = SqlRunner.run( sql )
   end

    def delete()
    sql = "DELETE FROM stores WHERE id = #{id};"
    deleted = SqlRunner.run( sql )
  end
  
  def self.all()
    sql = "SELECT * FROM stores;"
    stores = SqlRunner.run( sql )
    result = stores.map{ |artist| Store.new(store) }
    return result
  end

end
