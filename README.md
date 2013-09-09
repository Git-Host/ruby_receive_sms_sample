In App Messaging from Mobile Number Sample Application
===========
This sample application uses AT&T Messaging APIs. It allows users to join a group and then send messages to all members of the group as if the message had come from their own phone number.



Using the Application
----------------------

The user interacts with the web app in two ways:

* Users can register their AT&T phone numbers with the application, granting the application permission to send messages on their behalf  
* Users can send a message to a shortcode, and the message is forwarded to all registered users as if sent from the user who sent the message to the shortcode.  

The application demonstrates the following APIs:
* Authorization with user consent
* The ReceiveSMS method, which listens for SMS messages sent to a shortcode
* The In App Messaging from Mobile Number API, which sends SMS messages on behalf of a user

The application requires a web server. Below are instructions for hosting on either Heroku or AppFog. 


Heroku Installation Instructions
--------------------------------
Heroku is a Cloud Service Platform that provides free accounts for limited resources. 

Follow these steps to install and run the sample code:

1.	Create an application at the [AT&amp;T Developer Portal](http://developer.att.com) with both the SMS and IMMN scopes enabled.

2.	Open a terminal (command prompt for Windows).

3.	Use git to clone the git respository, using the command: 

    `git https://github.com/attdevsupport/ruby_immn_sample.git`
4.	Follow the instructions at [Heroku](https://www.heroku.com/) to create an account and log in.  
5.	Follow the [Heroku Quick Start](https://devcenter.heroku.com/articles/quickstart) steps to install the Heroku Toolbelt on your local machine.
6.	Create the Heroku instance with this command:

    `heroku create`
7.	Add a Redis instance. Redis is an open source key-value store. For example, you can add it with the command below. (**Note:** Your Heroku account may need to be verified with a credit card for this to work, even though you won’t be charged. Do this on the Heroku website.)

    `heroku addons:add redistogo`
8.	The app uses environment variables for data that is specific to your app, such as the app key and secret. Set environment variables now with this command:
    `heroku config:set API_KEY=xxxxxx API_SECRET=xxxxxx SHORT_CODE=xxxxxx`

    where you use the app key for API_KEY, secret for API_SECRET, and short code for SHORT_CODE. You should see a response such as:

    `Setting config vars and restarting murmuring-wave-1066... done, v4`

    `API_KEY:xxxxxxxxxxxxxxxxxxxxx`

    `API_SECRET: xxxxxxxxxxxxxx`

    `SHORT_CODE: xxxxxxx`
9.	Push the code from your machine to Heroku with this command:

    `git push heroku master`
10.	Open up the website with this command. Your app will appear in your default browser.

    `heroku open`
11.	You should see a place to enter your phone number. Don’t enter anything just yet.
12.	Copy the URL of the web page. In another browser tab or window, go to the Developer Portal, and edit your app by clicking on the pen button. 
13.	Under **OAuth Redirect**, in the **URL** text box, copy the URL of your app, adding /authcode at the end. This is the page that will be redirected to once users have granted their consent. Click on **Edit Application** to save.
14.	Next click on the **Manage Shortcodes** tab. Click **Edit** to edit your app’s shortcode.
15.	At the bottom of the page, copy in the URL of your app in the **SMS Mobile Originated URI**, adding `/receiveSMS` at the end. This is the URL that is used when the shortcode receives an SMS message. Click **Save** to save.
16.	Now return to your app and enter in an AT&T phone number and click **Submit**.
17.	You will be asked for consent. If you are accessing the internet through an AT&T data connection, then you will see a screen asking you to authorize the application to use IMMN. Click the <strong>Allow</strong> button.
  
    If you are accessing the internet a different way, you have two ways to give consent. One is to text the word to the given shortcode from the device you are using. The other is to click on the <strong>User ID</strong> tab and enter your AT&T username and password.

18.	Once consent is granted, after a few seconds, you will be redirected to the app's page that you specified on the Developer Portal. This page takes the authorization code and then displays the directions to use.
19.	If you like, have other people go to the app's main page and add other AT&T phone numbers. (Note that you cannot add other phone numbers from the same browser because cookies will have been set indicating that consent has been given for the first phone number entered. To work around this, you would need to delete the cookies between adding each number.)
20.	Now, send a text message from the registered phone to the shortcode listed on the Directions page (which is your app's shortcode). The message will be sent to all numbers that have registered with the app. 

AppFog Installation Instructions
--------------------------------

0. Create an application at the [AT&amp;T Developer Portal](http://developer.att.com) with both the SMS and IMMN scopes enabled  
1. Clone the git repository using the command `git clone https://github.com/maymount/immn_sample.git` 
2. Run the `bundle install` and `bundle package` commands
2. See the [AppFog Installation Instructions](https://docs.appfog.com/getting-started/af-cli#installation) for your platform  
3. Log in to your AppFog account using the `af login` command  
4. Use the `af manifest` command in the newly cloned directory, specifying your own unique application name and adding the Redis service:  


		$:~/Projects/immn_sample: af manifest  
		Configure for which application? [.]:  
		Application Name: immnsample_richard   
		Detected a Sinatra Application, is this correct? [Yn]: y   
		1: AWS US East - Virginia   
		2: AWS EU West - Ireland   
		3: AWS Asia SE - Singapore   
		4: HP AZ 2 - Las Vegas   
		Select Infrastructure: 1   
		Application Deployed URL [immnsample_richard.aws.af.cm]: immnsample-richard.aws.af.cm   
		Memory reservation (128M, 256M, 512M, 1G, 2G) [128M]:   
		How many instances? [1]:   
		Bind existing services to 'immnsample_richard'? [yN]: n   
		Create services to bind to 'immnsample_richard'? [yN]: y   
		1: mongodb   
		2: mysql   
		3: postgresql   
		4: rabbitmq   
		5: redis   
		What kind of service?: 5   
		Specify the name of the service [redis-77854]:   
		Create another? [yN]: n   
		Configure for another application? [yN]: n   
		Manifest written to manifest.yml.   


5. Use the `af push --no-start` command to create an AppFog instance   
6. Use the `af env-add` command to set these environment variables based on the values of your AT&T API Application:
	* API_KEY
	* API_SECRET
	* SHORT_CODE
7. Use the `af start <appname>` command to start the application 
8. Configure your AT&amp;T short code so that its **SMS Mobile Originated URI** is set to the URI of your application's receive SMS location, for example, http://immnsample.aws.af.cm/receiveSMS.

