class StocksController < ApplicationController
  def index

#     require 'rubygems'
#     require 'mechanize'
 
# # Where are we logging into?
 
# hostname = "login.xing.com"
# url = "/login"
# post_url = "http://#{hostname}#{url}"
 
# # Who are we logging in as?
 
# username = "test"
# password = "test"
 
# # Create our Mechanize object with some defaults
 
# agent = Mechanize.new
# agent.user_agent_alias = 'Windows Mozilla'
# agent.follow_meta_refresh = true
# agent.redirect_ok = true
# agent.keep_alive = true
# agent.open_timeout = 30
# agent.read_timeout = 30
 
# # Go get the login page
 
# page = agent.post(post_url)
 
# # Check to make sure we're on the login page
 
# page.content.include?"Login"
 


# pup = page.form.fields

 
# # Fill in the username and password fields
 
# pup.login_form["username"] = username
# login_form["password"] = password
 
# # And submit it
 
# page = agent.submit(login_form)
 
# # Make sure we're logged in
 
# page.links.find { |l| l.text == "Log Out" }
 
# # Do whatever we need to do here
 


  	search = params[:search] || "xing"

  	if search =~ /\s/
			search.gsub!(/\s+/, "+")
		end


    if search.downcase.include? "telekom"
      search = 'deutschetelekomag'
    elsif search.downcase.include? "aareal"
      search = 'aarealbankag'
    elsif search.downcase.include? "adidas"
      search = 'adidasgroup'
    elsif search.downcase.include? "hanse"
      search = 'hansemerkurversicherungsgruppe'
    elsif search.downcase.include? "adva"
      search = 'advaopticalnetworkingse'
    elsif search.downcase.include? "aixtron"
      search = 'aixtronse'
    elsif search.downcase.include? "altana"
      search = 'altana'
    elsif search.downcase.include? "axel"
      search = 'axelspringerse'
    elsif search.downcase.include? "basf"
      search = 'basf'
    elsif search.downcase.include? "bauer"
      search = 'bauerag'
    elsif search.downcase.include? "baywa" 
      search = 'baywaag'
    elsif search.downcase.include? "bechtle"
      search = 'bechtleag'
    elsif search.downcase.include? "beiersdorf"
      search = 'beiersdorfag'
    elsif search.downcase.include? "bilfinger"
      search = 'bilfinger'
    elsif search.downcase.include? "cancom"
      search = 'cancom'
    elsif search.downcase.include? "meditec" || "carl" || "zeiss" || "cz"
      search = 'carlzeissmeditecag'      
    elsif search.downcase.include? 'continental'
      search = 'continentalag'
    elsif search.downcase.include? 'euro'
      search = 'deutscheeuroshopag'
    elsif search.downcase.include? 'post'
      search = 'deutschepostag'
    elsif search.downcase.include? 'wohnen'
      search = 'deutschewohnenag'
    elsif search.downcase.include? 'douglas'
      search = 'douglasholdingag'
    elsif search.downcase.include? 'draeger' || 'dräger'
      search = 'draeger'
    elsif search.downcase.include? 'drillisch'
      search = 'drillisch'
    elsif search.downcase.include? 'duerr' || 'dürr'
      search = 'dürrsystemsgmbh'
    elsif search.downcase.include? 'elring'
      search = 'elringklingerag'

      



    else 
    end


    # require 'grabzit'

    # grabzItClient = GrabzIt::Client.new("NGFjNWVmMmM2NjMyNDU1Mzk2M2YxYjFiODRhYWYzNDI=", "Pz9yP2pUaj8/PyZlP1s/Py8/Pz9iPz8/Ll9mPz8/Iyk=")
  	

    
  	response = HTTParty.get("https://www.xing.com/companies/#{search}")
  	@company = search.gsub(/[+]/, " ").upcase
  	dom = Nokogiri::HTML(response.body)
  	@results = dom.css("body")
    @puppies = dom.css("#about-us-content a")
    @wauwau = dom.css ("section.facts dl dd a")



    #zahlen und daten
    response2 = HTTParty.get("https://www.xing.com/companies/#{search}/employees/statistics")
    dom2 = Nokogiri::HTML(response2.body)
    @results2 = dom2.css("body")


#     # Or to take a PDF screenshot
#     # grabzItClient.set_pdf_options("https://www.xing.com/companies/#{search}")
#     # Now we can log out
 
# page = agent.page.link_with(:text => "Log Out").click
 
# # And check we are logged out
 
# page.content.include?"Please log in"



  end
end





