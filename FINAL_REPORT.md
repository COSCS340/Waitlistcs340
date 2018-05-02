## WaitList App

Description: An iOS application that shows wait time for all restaurants on UT campus

Team: Waitlist App

Team Number: 13

Members: Avie Desai, Naveli Shah, Ben Chesney, Surya Manikonda

## Introduction:

Overview:

For our final project, we decided to make a prototype of an iOS application. Our goal was to create a working prototype of an app that could potentially reduce the waiting times to get food at restaurants around campus and help users manage time. So, we developed a prototype called Waitlist. This is the most effective way users can check the waiting times to get food at different restaurant locations across the campus just by using an application. Our approach was to get the basic core functionality working, then add features to improvie the project. We have successfully created a working prototype which has a home page to display different restaurants and their waiting times so that the user can check-in. Since our app is a user based app, we have created a page to let the user tell us whether they received their food yet (checking out). We also have a feedback page to rate the app and submit any comments. 


## Customer Value:

No changes were made from the status report.

The Waitlist app is specifically designed for students and faculty at the University of Tennessee. It can be exhausting for students to stand in long lines and wait even longer to get food, especially during the lunch hours. If they are thinking about getting food but are in a rush or have little time between classes, they could easily look up the waiting times on the app and check if they are willing to go get time or just wait till the time goes down. This can open up extra free time, as opposed to going to a restaurant and waiting. By using our Waitlist app, students can manage their time wisely, as it helps them make better dining choices and be more productive with their time.

## Technology:

All tools and software used in developing this application are the same. No other approach was taken. Our goals for our final version of the application was to make sure it looked clean, resentable, and was working properly even with the load of multiple users. Another goal we wanted to shoot for was to implement a sign in feature, so we can easily keep track of users utilizing the application. We wanted to limit this application to just University students and staff and we also do not want duplicate user accounts. Because of time and complexity, we did not get the Google sign in feature working fully, but we did get a good start where we could pick up from in the future. One thing we found to not work was if a user checks into a restaurant, it increments the time, but if the user kills the app and goes back into it, there is no way for the user to check out, thus keeping the time incremented. That is why we wanted the sign in feature in place to keep track of who checked into a particular restaurant so we can check them out after a certain timeout period, thus keeping the waiting time information more accurate for other users. In the screenshots below, our check in and check out buttons are changed to show more color. We also added a developer mode toggle to allow us to test the application away from the restaurants. If developer mode is turned off, then the application will only allow the user to check in within 0.05 miles of the restaurant. There is also a google sign in button on the initial screen which does not function completely. 
 
<img width="254" alt="screen shot 2018-05-01 at 2 07 23 pm" src="https://user-images.githubusercontent.com/29310209/39486202-55c2ed38-4d49-11e8-8676-2fb028a84575.png">

<img width="253" alt="screen shot 2018-05-01 at 2 07 47 pm" src="https://user-images.githubusercontent.com/29310209/39486220-63c40f98-4d49-11e8-95a8-1007d7d0c2aa.png">

<img width="250" alt="screen shot 2018-05-01 at 2 08 18 pm" src="https://user-images.githubusercontent.com/29310209/39486236-6e8d41e2-4d49-11e8-9b4d-df82b67a3eb9.png">

Tests ran and results:

We started out using mainly using the iPhone simulator in Xcode to test the app. Using the iPhone simulator for testing allowed us to see what features were working and what changes or modifications we need to make the app work. Testing the app on the simulator also allowed us to see what our app would look like in a real-world environment. Major bugs were fixed based on iPhone simulations through Xcode. When those major bugs were fixed, we advanced to moving our application to our working iPhones. All 4 of our team members currently have the application installed on our mobile devices ready for testing. Upon first time use of the app, we are successfully prompted to allow location tracking. Using the mobile devices, we retrieved the waiting times and restaurant pictures. We have tested the app simultaneously and is working successfully. When a user checks in on one device and if another user refreshes their home page, the time is updated reflecting an increment of 2 min and it also works when a user checks out decrementing the waiting time by 2 min. on another user's mobile device when refreshed. Also, we ran tests with the Google sign in button, but sometime it works and sometimes it does not. More improvements need to be made on that part of the application. 

## Team:

Team member roles:

Since Avie has previous experience working on iOS applications, we decided that he is the team leader. Avie worked harder to get the app initialized, location tracking, and firebase connection set up. Avie has been assigning issues to everyone and have been completed in a timely manner. The team member roles stayed the same throughout the project. Susie worked on the home page of the application, Naveli worked on the check out page of the application, and Ben worked on the feedback page with Avie tieing all of these pages together.


## Project Management:

Schedule:

Overall, we met our goals based on our originial schedule. We added on features that we would like to have in the application towards the end of the semester. We still went ahead and got started on those improvements such as Google sign In. We did not finish those features mainly because of time. There is some complexity, but with online resources and tutorials, it could have been accomplished. There just was not enough time to finish the feature and also other bugs that were brought up as a result. 

## Reflection:

Many things went well such as the team structure. All of the team members were willing to contribute to the project to reach the deadlines and propose meaningful ideas. Each team member was motivated to learn the new language, Swift, and make something useful, Waitlist. Even when we hit roadblocks, it pushed us to communicate with each other and arrive at a decent solution. Avie, the team lead, had some familiarity with coding in Swift, which helped us get started quickly with the project. Everybody contributed on how to develop the app in such a way to provide the functionality discussed in the initial proposal.

However, some things did not go as expected. Since most of us did not have experience in making an app, the UI did not turn out to be as user friendly or concise as we expected. After we thought we had arrived at the final version of the app, we found a bug in the design. The bug occurs because the app does not have a way to keep up with the users. We decided to add Google sign in to keep track of the users, however, we did not have enough time to finish it. We also had some conflicts with dissolving problems with merge conflicts using Github. 

After all the learning curve we went through while making this app as a prototype, we consider it a success. We could not make some of our ideas work for us, but the experience of learning how to work as a team and develop an iOS app proved to be a worthwhile experience. For a somewhat inexperienced team, it was a great success for us.
