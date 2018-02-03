# require libraries/modules here
# no Open-URI request, so don't need to require 'open-uri'
require 'nokogiri'

# Each project has a title, an image, a short description, a location and some funding details
# The goal is to collect this information for each project and build a hash for each project
# These individual project hashes will be collected into a larger hash called projects

def create_project_hash
  # open a file and read it into a variable
  html = File.read("fixtures/kickstarter.html")
  kickstarter = Nokogiri::HTML(html)

  projects = {}

   # iterate through the projects
   # each project title is a key, and its value is another hash with each of the other data points as keys
   kickstarter.css("li.project grid_4").each do |project|
     title = project.css("h2.bbcard_name strong a").text
     projects[title.to_sym] = {} # project titles point to a hash of info. Note: Convert title into symbol using #to_sym. Symbols make better hash keys than strings
   end

   # return the projects hash
   projects
end


# selecting elements
  # projects: kickstarter.css("li.project grid_4")
  # title: project.css("h2.bbcard_name strong a").text
  # image: project.css(".project-thumbnail a img").attribute("src").value
  # description: project.css("p.bbcard_blurb").text
  # location: project.css("ul.project-meta li a span.location-name").text
  # funding: projet.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i




# each project has an image link hosted on AmazonAWS
# each project has a description which is a string
# each project has a location which is a string
# each project has percentage funded listed which is an integer
