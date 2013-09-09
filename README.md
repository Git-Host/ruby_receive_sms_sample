Receive SMS Sample Application
===========
This sample application uses AT&T SMS APIs. It receive online SMS messages from the AT&T server.



Using the Application
----------------------

* Place the application on a publicly accessible web server
* Send an SMS message to the configured short code
* View the server logs

The application requires a web server. Below are instructions for hosting on Heroku. Any hosting provider will work as long as the server is publicly accessible.


Heroku Installation Instructions
--------------------------------
Heroku is a Cloud Service Platform that provides free accounts for limited resources. 

Follow these steps to install and run the sample code:

1.	Open a terminal (command prompt for Windows).

2.	Use git to clone the git respository, using the command: 

    `git clone https://github.com/attdevsupport/ruby_receive_sms_sample.git`
3.	Follow the instructions at [Heroku](https://www.heroku.com/) to create an account and log in.  

4.	Follow the [Heroku Quick Start](https://devcenter.heroku.com/articles/quickstart) steps to install the Heroku Toolbelt on your local machine.

5.	Create the Heroku instance with this command:

    `heroku create`
6.	Push the code from your machine to Heroku with this command:

    `git push heroku master`
7.	View the logs

    `heroku logs -t`
8.	Create an application at the [AT&amp;T Developer Portal](http://developer.att.com) with the SMS scope enabled.

9.	Create an online short code by selecting "Manage Short Codes", and adding a new short code.

10. Specify the Heroku URL as the "SMS Mobile Originated URI" and selecting "Save".

11. Send an SMS message to your short code and you should see a message in the logs.
