require_relative( './models/pet' )
require_relative( './models/store' )

require( 'pry-byebug' )

store1 = Store.new( { 'name' => 'Robbies Small and Furrys', 'address' => 'Leith Walk','stock_type' => 'a wee bit creepy'} )

store2 = Store.new( { 'name' => 'Alans Big and Bushy', 'address' => 'Morningside Road', 'stock_type' => 'needs taming'} )

store1.save()
store2.save()


pet1 = Pet.new({'pet' => 'John', 'type'=> 'Orangutang','store_id' => store1.id})
pet2 = Pet.new({'pet' => 'James', 'type'=> 'Cheeta', 'store_id' => store2.id})
pet1.save()
pet2.save()

binding.pry
nil