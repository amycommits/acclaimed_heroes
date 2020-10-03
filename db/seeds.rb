require "http"
User.delete_all

response = JSON.parse(HTTP.get('https://randomuser.me/api/?results=50').body)['results']
# this particular API will either allow you to make multiple requests, or search for gender
response = response.filter {|user| user['gender'] == 'female'}

response.each do |woman|
  User.create!(
    email: woman['email'],
    first_name: woman['name']['first'],
    last_name: woman['name']['last'],
    dob: woman['dob']['date'],
    phone: woman['phone'],
    profile_picture: woman['picture']['medium'],
    latitude: woman['location']['coordinates']['latitude'],
    longitude: woman['location']['coordinates']['longitude'],
    password: woman['login']['password'].length >= 6 ? woman['login']['password'] : '123456'
  )
end