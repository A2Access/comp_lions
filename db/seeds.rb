food = Classification.create!(name: 'Food', path: 'food')

restaurant, bar, food_truck, bakery = ["Restaurant", "Bar", "Food Truck", "Bakery"].collect do |classification|
  Classification.create!(name: classification, path: [food.path, classification.parameterize.underscore].join("."))
end

diner, family, haute_cuisine, fast_food = ["Diner", "Family", "Haute Cuisine", "Fast Food"].collect do |classification|
  Classification.create!(name: classification, path: [restaurant.path, classification.parameterize.underscore].join("."))
end

["50s", "New England", "West Coast"].each do |classification|
  Classification.create!(name: classification, path: [diner.path, classification.parameterize.underscore].join("."))
end

["Pizza", "Comfort", "Chinese"].each do |classification|
  Classification.create!(name: classification, path: [family.path, classification.parameterize.underscore].join("."))
end

["Molecular Gastronomy", "French", "Chinese"].each do |classification|
  Classification.create!(name: classification, path: [haute_cuisine.path, classification.parameterize.underscore].join("."))
end

["Burgers", "Taqueria", "Chinese"].each do |classification|
  Classification.create!(name: classification, path: [fast_food.path, classification.parameterize.underscore].join("."))
end

pub, speakeasy, wine_bar = ["Pub", "Speakeasy", "Wine Bar"].collect do |classification|
  Classification.create!(name: classification, path: [bar.path, classification.parameterize.underscore].join("."))
end

["Irish", "English", "Chinese"].each do |classification|
  Classification.create!(name: classification, path: [pub.path, classification.parameterize.underscore].join("."))
end

["Hipster", "Tolerable"].each do |classification|
  Classification.create!(name: classification, path: [speakeasy.path, classification.parameterize.underscore].join("."))
end

["French", "Italian", "Napa", "Chinese"].each do |classification|
  Classification.create!(name: classification, path: [wine_bar.path, classification.parameterize.underscore].join("."))
end

["Sketchy", "Safe"].each do |classification|
  Classification.create!(name: classification, path: [food_truck.path, classification.parameterize.underscore].join("."))
end

coffee_shop, cupcakes, pretzels = ["Coffee Shop", "Cupcakes", "Pretzels"].collect do |classification|
  Classification.create!(name: classification, path: [bakery.path, classification.parameterize.underscore].join("."))
end

["Hipster", "Tolerable"].each do |classification|
  Classification.create!(name: classification, path: [coffee_shop.path, classification.parameterize.underscore].join("."))
end

