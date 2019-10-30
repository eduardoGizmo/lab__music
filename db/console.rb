require("pry")
require_relative("../models/artist")
require_relative("../models/album")

Albums.delete_all
Artists.delete_all

artist1 = Artists.new({'name' => 'Bob Marley'})
artist1.save

artist2 = Artists.new({'name' => 'Bob Dylan'})
artist2.save

album1 = Albums.new({'title' => 'Redemption Song','genre' => 'reggae', 'artist_id' => artist1.id })
album1.save

album2 = Albums.new({'title' => 'Hurricane','genre' => 'Pop Rock',
'artist_id' => artist2.id })
album2.save

album3 = Albums.new({'title' => 'Desire', 'genre' => 'Pop Rock',
'artist_id' => artist2.id })
album3.save

binding.pry
nil
