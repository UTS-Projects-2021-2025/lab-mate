# Lab Mate

- Link to the app github repo: <https://github.com/UTS-Projects-2021-2025/lab-mate>
- Link to the admin page github repo: <https://github.com/UTS-Projects-2021-2025/lab-mate-teachers-web>
- Link to the admin page: <https://lab-mate-admin.pages.dev>

Lab Mate is a mobile application that is mean't

## Motivation for Lab Mate

Lab Mate came about because of our experience in computer science and maths labs
and tutorials. One goal every tutor strives for in computer science labs and
tutorials is to have a social bi-directional feedback stream. Here we list a few
common problems tutors face.

- In a classroom of 30 students, there is no way of knowing who has completed
  the activity, or who to give feedback to.
- Often no student wants to go up and 'present' a proof or solution. However,
  encouraging students to do this is important in subjects in and around maths.
- There is no centralised and systematic way to set timers and track activities.

Notice that each of these problems could be solved by a *combination* of google
drive, google docs, kahoot, etc. However, in the fast paced environment of a
tutorial, it is inefficient to setup each of these seperate tools.

## Using Lab Mate

*Note that Lab Mate utilises a email based authentication system, so if testing
is required, testing needs to be done on your actual phone with your email (5
minute mail should work though).*

Lab Mate is a highly synchronous app, so in order to use the application you
need to follow each step in specific order.

### Creating a classroom

- Can be done in the admin page, use any arbitrary email for now.

### Joining a classroom

- In the mobile app, sign in by entering email and clicking the email redirect
  link to application.
- Also login to admin page to see real time updates.
- Enter a classroom code found on the admin page in the provided text input
  panel.
- You should see the users name appear on the admin panel, or anonymous if the
  name is not set.

### Starting a classroom activity

- Creating an activity on the admin page should automatically change the users
  view in real time if they have entered a classroom.
- There is some time constraints however, such as entering a classroom activity
  will not work if the activity is not scheduled to be happening at the devices
  current set time.

## Libraries and Technology Used

- Supabase: https://supabase.com/

## Contributions

- Noah Koshy
  - The Design of the App
  - The Activity Pages
- Christie Choi
  - Organisational Leader
  - The Authentication and Profile Pages
- Euan Mendoza
  - Backend
  - Internal App Logic
