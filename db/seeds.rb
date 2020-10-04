require "http"

UserBadge.delete_all          
User.delete_all
Badge.delete_all


fetch_users = JSON.parse(HTTP.get('https://randomuser.me/api/?results=50').body)['results']
# this particular API will either allow you to make multiple requests, or search for gender
users = fetch_users.map {|user| {
  email: user['email'],
  first_name: user['name']['first'],
  last_name: user['name']['last'],
  dob: user['dob']['date'],
  phone: user['phone'],
  profile_picture: user['picture']['medium'],
  latitude: user['location']['coordinates']['latitude'],
  longitude: user['location']['coordinates']['longitude'],
  password: user['login']['password'].length >= 6 ? user['login']['password'] : '123456'
  }}

puts "creating #{users.length} users"
User.create!(users)

badge_templates = JSON.parse(HTTP.headers(:accept => 'application/json', "content-type" => 'application/json')
  .auth("Basic #{ACCLAIM_AUTH_TOKEN}")
  .get("https://sandbox-api.youracclaim.com/v1/organizations/#{ACCLAIM_ORG_ID}/badge_templates")
  .body)['data']

badge_info = badge_templates.map{|badge| {
  remote_id: badge['id'],
  badge_url: badge['image']['url'],
  image_url: badge['image']['image_url'],
  skill: {skills: badge['skills']}
}}
puts "creating Badge Information"
Badge.create!(badge_info)

puts "creating a random set of badges "
User.all.each do |user|
  Badge.all.each_with_index do |badge, index|
    has_earned = rand(0..1) == 1 ? true : false
    if has_earned
      puts "User: #{user} has earned #{badge}"
      UserBadge.create!(user: user, badge: badge) 
    end
  end
end