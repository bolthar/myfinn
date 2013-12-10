MyFinn
======

Apartament searching assistant for finn.no

What is this?
-------------

I recently moved to Norway, and I needed a small tool to help me keep track of apartments for rent on finn.no. Basically - you enter a finnkode, it scrapes all the insertion's info from finn.no and imports it. After that, you can rate apartments, add comments and schedule appointments based on the insertions you've imported.

How do I use this?
------------------

This is a standard rails3 app, so the usual bootstrapping process applies: modify your <tt>config/database.yml</tt> to point to your database instance, <tt>rake db:migrate</tt> and <tt>rails server</tt> should then start the app.

PostgreSQL is the default for production (I included the <tt>pg</tt> gem in the gemfile) but you can change it to whatever you want to - there are no hard dependencies, just change the adapter in the gemfile and you're good to go.

If you want to see the maps, you should also add a valid Google API key with Maps activated in the <tt>config/config.yml</tt> file.

There is no point and click user management available. To create users, run <tt>rake myfinn:admin</tt> for an admin or <tt>rake myfinn:user</tt> for a standard user, with the following parameters:

<tt>name</tt>: the actual user's name
<tt>email</tt>: the email that will be used for access
<tt>password</tt>: the user's password (at least 8 chars long)

for example:

<tt>rake myfinn:admin name=andrea email=andrea@test.com password=mytestpass</tt>

creates an user with admin privileges named 'andrea' with login email 'andrea@test.com' and password 'testpass'.

You can connect to 

> myfinn.herokuapp.com

to see a live demo. To access the demo site:

As an admin user: email - admin@myfinn.com, password - adminpass

As a normal user: email - user@myfinn.com, password - userpass

Watcher
-------

It is possible also to specify a filter and auto-import all the matching results for later screening. In the <tt>config.yml</tt> file, you can set the <tt>insertion_filter_url</tt> parameter to the URL corresponding to a given filter created on finn.no (complete with the domain name). If you do, you can then call the rake task <tt>myfinn:poll</tt> to run the job collecting all the new insertions matching the filter. You can then automate the polling by, for example, creating a cron job running that rake task. Example (search, every hour, for all new insertion with a monthly cost inferior to 17000 NOK/month):

- Set the <tt>insertion_filter_url</tt> parameter in <tt>config.yml</tt> to <tt>http://www.finn.no/finn/realestate/lettings/result?PRICE_FROM=&sort=1&ESTATE_SIZE/LIVING_AREA_FROM=75&areaId=20061&PRICE_TO=17000</tt> (a filter screaming for all insertion with a monthly cost less than 17000 NOK a month.

- Set up a cron job by creating a bash script calling the rake job (<tt>bundle exec rake myfinn:poll</tt>) and placing it into the <tt>/etc/cron.hourly</tt> folder

That's it - the new insertions will be displayed in the appropriate section and you can then move them to the apartment section and rate them, set appointments and so on.

SMS Notifications (via Twilio)
------------------------------

If you own a Twilio account you can also get an SMS notification when the watcher process finds new insertions. For that, you will need to set the appropriate informations on your <tt>config.yml</tt> file, as explained there, and call the rake task <tt>myfinn:notify</tt>. As for with the watcher process, you can automate the job using cron or another scheduler.


Cool. What now?
---------------

Well, first of all - good luck. The housing market's pretty tough in Norway at the moment, especially in Oslo.

If you take a look at the source, you'll see that it is in <i>bad</i> shape. I basically pasted this together in a day or two and then kept adding stuff when I felt the need to have it. No tests - at all - inline styles, inline JS.

So, if you're a rails programmer and feel like cleaning this mess up, you're most welcome :)
