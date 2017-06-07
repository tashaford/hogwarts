require_relative ('../models/student')
require_relative ('../models/house')


house1 = House.new({
  "name" => "Gryffindor",
  "logo" => "https://vignette1.wikia.nocookie.net/harrypotter/images/8/8e/0.31_Gryffindor_Crest_Transparent.png/revision/latest?cb=20161124074004"
  })
house1.save()

house2 = House.new({
  "name" => "Hufflepuff",
  "logo" => "http://vignette2.wikia.nocookie.net/harrypotter/images/5/50/0.51_Hufflepuff_Crest_Transparent.png/revision/latest?cb=20161020182518"
  })
house2.save()

house3 = House.new({
  "name" => "Ravenclaw",
  "logo" => "http://vignette1.wikia.nocookie.net/pottermore/images/4/40/Ravenclaw_Crest_1.png/revision/latest?cb=20140604194505"
  })
house3.save()

house4 = House.new({
  "name" => "Slytherin",
  "logo" => "http://vignette4.wikia.nocookie.net/harrypotter/images/d/d3/0.61_Slytherin_Crest_Transparent.png/revision/latest?cb=20161020182557"
  })
house4.save()


student1 = Student.new({
  "first_name" => "Katy",
  "last_name" => "Brown",
  "house_id" => house1.id,
  "age" => 14
  })
student1.save()

student2 = Student.new({
  "first_name" => "Cedric",
  "last_name" => "Diggory",
  "house_id" => house2.id,
  "age" => 17
  })
student2.save()