class OrganizationController < ApplicationController
  require "http"
  def index

  end
  def issue_badge
    email = JSON.parse(params['info'])['email']
    user = User.find_by(email: email)
    badge_id = Badge.first.remote_id
    info = {
      recipient_email: email,
      issued_to_first_name: user.last_name,
      issued_to_last_name: user.last_name,
      badge_template_id: badge_id,
      issued_at: Time.now.to_s
    }
    
    response = HTTP.headers(:accept => 'application/json', "content-type" => 'application/json')
      .auth("Basic #{ACCLAIM_AUTH_TOKEN}")
      .post("https://sandbox-api.youracclaim.com/v1/organizations/#{ACCLAIM_ORG_ID}/badges.json", :params => info)
    
    render :json => {success:true, head: :no_content}, status: 200 
  end

  def batch_badges
    emails = JSON.parse(params['info'])['emails']
    emails.each do |email|
      user = User.find_by(email: email)
      badge_id = Badge.first.remote_id
      info = {
        recipient_email: email,
        issued_to_first_name: user.last_name,
        issued_to_last_name: user.last_name,
        badge_template_id: badge_id,
        issued_at: Time.now.to_s
      }
      
      response = HTTP.headers(:accept => 'application/json', "content-type" => 'application/json')
        .auth("Basic #{ACCLAIM_AUTH_TOKEN}")
        .post("https://sandbox-api.youracclaim.com/v1/organizations/#{ACCLAIM_ORG_ID}/badges.json", :params => info)
    end
    render :json => {success:true, head: :no_content}, status: 200 
  end

  # the URI is too long, will do properly later
  # def batch_badges
  #   badge_id = Badge.first.remote_id

  #   emails = JSON.parse(params['info'])['emails']
  #   info = []
  #   emails.each do |email|
  #     user = User.find_by(email: email)
  #     info.push({
  #       recipient_email: email,
  #       issued_to_first_name: user.last_name,
  #       issued_to_last_name: user.last_name,
  #       badge_template_id: badge_id,
  #       issued_at: Time.now.to_s
  #     }.to_s)
  #   end
    
  #   badge_info = {badges: info}
  #   response = HTTP.headers(:accept => 'application/json', "content-type" => 'application/json').auth("Basic #{ACCLAIM_AUTH_TOKEN}").post("https://sandbox-api.youracclaim.com/v1/organizations/#{ACCLAIM_ORG_ID}/badges/batch.json", :params => badge_info)
  #   binding.pry
  #   render :json => {success:true, head: :no_content}, status: 200 
  # end
end
