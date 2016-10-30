@designer = Designer.create(
  name: 'Stephen West',
  brand: 'Westknits')

@designer2 = Designer.create(
    name: 'Andrea Mowry',
    brand: 'DreaRenee')

@season = Season.create(
    name: 'Spring/Summer')

@season2 = Season.create(
    name: 'Fall/Winter')

@pattern = Pattern.create(
    name: 'Candle Flame Lapghan',
    description: 'Made using Quince & Co. Osprey, 100% American wool',
    designer: @designer,
    season: @season)

@pattern2 = Pattern.create(
    name: 'Forest Wreath',
    description: 'It uses two different colors of the Maiden Hair yarn',
    designer: @designer2,
    season: @season2)

puts "Melanie's Sanity Check; the database now contains #{Designer.count} designers, #{Season.count} seasons and #{Pattern.count} patterns."