# Add a declarative step here for populating the DB with movies.

Given(/the following movies exist/) do |movies_table|
    movies_table.hashes.each do |movie|
      Movie.create!(movie)
    end
  end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

# Then(/I should see "(.*)" before "(.*)"/) do |e1, e2|
#     expect(page).to have_text(/#{e1}.*#{e2}/m)
#   end
  
When(/I (un)?check the following ratings: (.*)/) do |uncheck, rating_list|
ratings = rating_list.split(', ')
ratings.each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
end
end

Then(/I should see "(.*)" before "(.*)"/) do |movie1, movie2|
    expect(page.body.index(movie1)).to be < page.body.index(movie2)
end

When(/I follow "(.*)"/) do |sort_option|
    click_link sort_option
end
  
  
  
