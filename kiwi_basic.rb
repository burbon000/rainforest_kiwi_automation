#tester starts at 
# "https://https://www.kiwi.com/us/"


test(id: 252263, title: "Kiwi Basic") do
  # You can use any of the following variables in your code:
  # - []
  
  # used to run Saucelabs with version 45 of Firefox. Version 50 was causing problems with some functionality
  Capybara.register_driver :sauce do |app|
    @desired_cap = {
      'platform': "Windows 7",
      'browserName': "firefox",
      'screenResolution': "1920x1080",
      'version': "50",
      'name': "kiwi_basic",
    }
    Capybara::Selenium::Driver.new(app,
      :browser => :remote,
      :url => 'http://@ondemand.saucelabs.com:80/wd/hub',
      :desired_capabilities => @desired_cap
    )
  end

  # chrome testing
  #Capybara.register_driver :selenium do |app|
  #  Capybara::Selenium::Driver.new(app, :browser => :chrome)
  #end  

  
  visit "https://www.kiwi.com/us/"

  step id: 1,
      action: "Enter 'New York' in the From: field. Pick 'JFK New York City, _' from the flyout",
      response: "Do you see a New York City tag in the From: field?" do
    # *** START EDITING HERE ***
    # Close cookies notification and any pre-filled to/from locations
    if page.has_css?('.CookiesBanner-close', wait: 2)
      page.find(:css, '.CookiesBanner-close').click
    end
    page.find(:css, '.RadioButtonsOption-label', text: 'RETURN').click

    # action
    for close_icon in page.all(:css, '.input-place-close') do
      close_icon.click
    end
    page.find(:css, '.input-places-input.input-origin').send_keys 'New York'
    page.find(:css, '.place-row.clickable', text: 'JFK').click

    # response
    expect(page).to have_selector(:css, '.input-place', text: 'New York Cit')

    #page.save_screenshot('screenshot_step_1.png')
    # *** STOP EDITING HERE ***
  end

  step id: 2,
      action: "Enter 'San Francisco' the To: field. Pick 'SFO San Francisco, _' from the flyout.",
      response: "Do you see a San Francisco tag in the To: field?" do
    # *** START EDITING HERE ***

    # action
    page.find(:css, '.input-places-input.input-destination').send_keys 'San Francisco'
    page.find(:css, '.place-row.clickable', text: 'SFO').click

    # response
    expect(page).to have_selector(:css, '.input-place', text: 'San Fran')

    #page.save_screenshot('screenshot_step_2.png')
    # *** STOP EDITING HERE ***
  end

  step id: 3,
      action: "Click in the Departure: field and select April 16 2018.",
      response: "Do you see a date in the Departure field?" do
   
    # *** START EDITING HERE ***

    # action

    page.find(:css, "input[name='search-outboundDate']").click
    if page.has_css?('.Calendar', text: 'April 2018', wait: 1) != true
      page.find(:css, '.next').click
    end
    within(:css, '.Calendar', text: 'April 2018') do
      page.find(:css, '.day-number', text: '16').click
    end

    # response
    expect(page).to have_selector(:css, "input[value='Mon Apr 16']")

    #page.save_screenshot('screenshot_step_3.png')
    # *** STOP EDITING HERE ***
  end

  step id: 4,
      action: "Click in the Return: field and select April 23 2018.",
      response: "Do you see a date in the Return field and flights listed under the Recommend tab?" do
    
    # *** START EDITING HERE ***

    # action
    page.find(:css, "input[name='search-inboundDate']").click
    within(:css, '.Calendar', text: 'April 2018') do
      page.find(:css, '.day-number', text: '23', wait: 30).click
    end

    # response
    expect(page).to have_selector(:css, "input[value='Mon Apr 23']")
    
    if page.has_css?('.SimpleLandingPage-searchFlights', wait: 1)
      page.find(:css, '.SimpleLandingPage-searchFlights').click
    end
    # wait till loading bar is not active
    expect(page).to have_no_selector(:css, '.LoadingBar.is-active', wait: 60)
    expect(page).to have_selector(:css, '.Journey-overview.Journey-return')

    #page.save_screenshot('screenshot_step_4.png')
    # *** STOP EDITING HERE ***
  end

  step id: 5,
      action: "",
      response: "" do
   
    # *** START EDITING HERE ***
	   
    # action
      

    # response
    

    #page.save_screenshot('screenshot_step_5.png')
    # *** STOP EDITING HERE ***
  end

  step id: 6,
      action: "",
      response: "" do
    # *** START EDITING HERE ***
      
    # action

    # response 

    #page.save_screenshot('screenshot_step_6.png')
    # *** STOP EDITING HERE ***

  end
  
  
 step id: 7,
      action: "",
      response: "" do
    # *** START EDITING HERE ***

    # action

    # response

    #page.save_screenshot('screenshot_step_7.png')
    # *** STOP EDITING HERE ***

  end

  step id: 8,
      action: "",
      response: "" do
    # *** START EDITING HERE ***
    
    # action

    # response

    #page.save_screenshot('screenshot_step_8.png')
    # *** STOP EDITING HERE ***

  end
  
  step id: 9,
      action: "",
      response: "" do

    # *** START EDITING HERE ***

    # action

    # response

    #page.save_screenshot('screenshot_step_9.png')
    # *** STOP EDITING HERE ***

  end

  
  step id: 10,
      action: "",
      response: "" do

    # *** START EDITING HERE ***

    # action

    # response

    #page.save_screenshot('screenshot_step_10.png')
    # *** STOP EDITING HERE ***

  end

  sleep(5)
end
