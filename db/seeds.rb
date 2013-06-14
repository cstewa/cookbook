# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "open-uri"

recipes = [
  "http://www.simplyrecipes.com/recipes/blueberry_maple_breakfast_bake/",
  "http://www.simplyrecipes.com/recipes/portobello_mushroom_burger/",
  "http://www.simplyrecipes.com/recipes/basil_chicken_in_coconut_curry_sauce/"
]
recipe_titles = []

recipes.each do |url|

	document = Nokogiri::HTML(open(url))

	title = document.css(".entry-header .entry-title.fn").children[0].content

	description = ""

	recipe_titles << title
	document.css("#recipe-method p").each { |x| description += x.content }

	Recipe.create(:title => title, :description => description)

end
@twilio_client = Twilio::REST::Client.new(
        "seretcodedbe4a70e092b78",
        "secretcode6e8a5b40e"
      )
@twilio_client.account.sms.messages.create(
    :from => '3018304179',
    :to => '3018012521',
    :body => "#{ recipe_titles.join(', ') }"
  )