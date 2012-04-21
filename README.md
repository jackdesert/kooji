# Kooji, an even better Online Event Registration System

Kooji is Rails. 

Kooji is based on REGI

REGI is a PHP project that can be seen at http://github.com/jackdesert/REGI
and is in use at http://hbbostonamc.org/regi

## Basic Features of Kooji

* Event leaders can post details about the event they are hosting, including cost, meals, dates, speed and difficulty of hike/ski/bike/etc, what the terrain will be like, and what type of gear is required for the event.
* Participants can view all of the events being sponsored by their AMC committee, and those that use REGI for registration will have a direct link to the registration page.
* Participants can create a profile telling a bit about themselves, including what their usual workout routine is, what kinds of other outdoor experience they have, and any dietary/medical restrictions they have
* With the help of these profiles, event leaders can screen participants, making sure only those properly prepared and outfitted come along.
* Once a participant is approved for an event, he/she can see all the other approved participants who are going, including contact information, so they can all arrange their own carpooling.

## Recent Enhancements to Kooji

* More responsive (with fewer page loads) using AJAX for things like approving users
* News feed showing what your most recent activity is (like who you approved for a trip, what you signed up for, when you last updated your profile, etc.)
* Photos of each user, displayable on the carpooling page, so you can get to know people better that you hiked with
* A leader blurb, or philosophy, displayed on each event that leader is associated with. By seeing the leader's name, photo, and philosophy blurb before you even sign up, you have a better sense of whether his/her leadership style will mesh with what you're looking to get out of the adventure
* An enhanced ADMIN page, where you can see all leaders in the system, and easily upgrade them to be admins if you like
* Carpooling page with entries grouped by whether they are offering or soliciting a ride
* Enhanced menus
* Clear delineation of who is the registrar for the event. This allows a user to respond to a system email, and it will go to the registrar for the event. Likewise, if a leader or registrar responds to the email that says "so and so signed up", that email goes to the user who signed up.
* Code is much easier to maintain, since it's written in RAILS
  
  
## Try it Out

You can test out a live prototype of Kooji at http://evening-mountain-9380.heroku.com/ Once you create an account there, if you want additional privileges (like to be able to create events in the system) then you need to upgrade your account. To upgrade it, log out, then log back in with this admin account:
    
    email: admin@sunni.ru
    password: pass

Then you will have an "Admin" tab at the top of your screen. Find the account you created for yourself, and click to make yourself either and "event creator" or a full blown "admin". 

Happy viewing, and I'm always welcome to feedback. 


## Hosting Requirements
You'll need:

* A server that can host rails apps (like heroku.com or rackspace.com or amazon.com)
* A working installation of python (used by elyxer.py for the support page)
* Your own sendgrid account for sending mail (http://sendgrid.com)
* A smile
 

## Contact Information

If you have questions about either hosting or contributing to either Kooji or REGI, please contact me. I'm:

    Jack Desert
    Lead Developer, REGI and Kooji
    jworky@gmail.com 
    (208) 366-6059

