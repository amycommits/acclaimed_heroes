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
    # verifies whether the email has been used or not
    # badge_templates = JSON.parse(HTTP.headers(:accept => 'application/json', "content-type" => 'application/json').auth("Basic #{ACCLAIM_AUTH_TOKEN}").get("https://sandbox-api.youracclaim.com/v1/organizations/#{ACCLAIM_ORG_ID}/badges.json?filter=query::#{email}"))

    response = HTTP.headers(:accept => 'application/json', "content-type" => 'application/json')
      .auth("Basic #{ACCLAIM_AUTH_TOKEN}")
      .post("https://sandbox-api.youracclaim.com/v1/organizations/#{ACCLAIM_ORG_ID}/badges.json", :params => info)
    
    render :json => {success:true, head: :no_content}, status: 200 
  end
end
