## WaitList App

Description: An iOS application that shows wait time for all restaurants on UT campus

Team: Waitlist App

Team Number: 13

Members: Avie Desai, Naveli Shah, Ben Chesney, Surya Manikonda

## Introduction:

Highlights:

So far, we have managed to create and successfully build a prototype of the application. We have created a home page to display different restaurants and their waiting times so that the user can check-in. Since our app is based on user check-in and check-out we have created a page to let the user tell us whether they received their food yet (checking out). We also have a feedback page to rate the app and submit any comments.

Overview:

We have not made any changes, and have followed the design and other requirements mentioned in the proposal.


## Customer Value:

No changes were made from the original project proposal.

As mentioned in the project proposal, the Waitlist app is specifically designed for students who are living on and around the UT campus. It can be exhausting for students to stand-in long lines, and wait longer to get food, especially during the lunch hours. If they are thinking about getting food but are in a rush or have less time between classes, they could easily look up the waiting times and determine if they can get food in less time than usual. This can save them time or maybe open up extra free time, as opposed to going to a restaurant and wait longer to be in-line and get food. By using our Waitlist app, students can manage their time wisely, as it cut downs the waiting time to get food.

## Technology:

All tools and software used in developing this application are the same. No other approach was taken. Our goals for our final version of the application was to make sure it looked clean and presentable and was working properly even with the load of multiple users. Another goal we wanted to shoot for was implementing a sign in feature, so we can easily keep track of users utilizing the application. We wanted to limit this application to just University students and staff and we also do not want duplicate user accounts. Because of time and complexity, we did not get the Google sign in feature working fully, but we did get a good start where we could pick up from in the future. One thing we found not to work was if a user checks into a restaurant, it increments the time, but if the user kills the app and goes back into it, there is no way for the user to check out. That is why we wanted the sign in feature in place so we could keep track of who checked into a particular restaurant so we can check them out after a certain timeout period, thus keeping the waiting time information more accurate for other users. In the screenshots below, our check in buttons and check out buttons changed to show more color. We also added a developer mode toggle to allow us to test the application away from the restaurants. If developer mode is turned off, then the application will only allow the user to check in within 0.05 miles of the restaurant. There is also a google sign in button on the initial screen which does not function completely. 
 
<img width="254" alt="screen shot 2018-05-01 at 2 07 23 pm" src="https://user-images.githubusercontent.com/29310209/39486202-55c2ed38-4d49-11e8-8676-2fb028a84575.png">

<img width="253" alt="screen shot 2018-05-01 at 2 07 47 pm" src="https://user-images.githubusercontent.com/29310209/39486220-63c40f98-4d49-11e8-95a8-1007d7d0c2aa.png">

<img width="250" alt="screen shot 2018-05-01 at 2 08 18 pm" src="https://user-images.githubusercontent.com/29310209/39486236-6e8d41e2-4d49-11e8-9b4d-df82b67a3eb9.png">

Tests ran and results:

We started out using mainly using the iPhone simulator in Xcode to test the app. Using the iPhone simulator for testing allowed us to see what features were working and what changes or modifications we need to make app work. Testing the app on the simulator also allowed us to see what our app would like in a real-world environment. Major bugs were fixed based on iPhone simulations through Xcode. Only when those major bugs were fixed, then after we advanced to moving our application to our working iPhones. All 4 of our team members currently have the application installed on our mobile devices ready for testing. Upon first time use of the app, we are successfully prompted to allow location tracking. Using the mobile devices, we retrieved the most accurate location. We have tested the app simultaneously and is working successfully. When a user checks in on one device and if another user refreshes their home page, the time is updated reflecting an increment of 2 min and it also works when a user checks out decrementing the waiting time by 2 min. on another user's mobile device when refreshed. Also, we ran tests with the Google sign in button, but sometime it works and sometimes it does not. More improvements need to be made on that part of the application. 

## Team:

Team member roles:

Since Avie has previous experience working on iOS applications, we decided that he is the team leader. Avie has been assigning issues to everyone and helping all the team members. We all have been working on our assigned issues and contributing to the app. The team member roles stayed the same throughout the project. 


## Project Management:

Schedule:

Overall, we met our goals based on our originial schedule. We added on features that we would like to have in the application towards the end of the semester, but we still went ahead and got started on those improvements such as Google Sign In. We did not finish those features mainly because of time. There is some complexity, but with online resources and tutorials, it could have been accomplished. There just was not enough time to finish the feature and also other bugs that were brought up as a result. 

## Reflection:

Many things went well such as the team structure. All of the team members were willing to contribute to the project to reach the deadlines and propose meaningful ideas. Each team member was motivated to learn the new language, Swift, and make something useful, Waitlist. Even when we hit roadblocks, it pushed us to communicate with each other and arrive at a decent solution. Avie, the team lead, had some familiarity with coding in Swift, which helped us get started quickly with the project. Everybody contributed on how to develop the app in such a way to provide the functionality discussed in the initial proposal describing what kind of app it should be.


