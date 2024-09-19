# movies_app

A movies project created in flutter .It displays popular, newly released, most liked, recommended, and similar movies to the movie you choose. You can search for movies and add them to your watch list. movies app support mobile, clone the appropriate branche mentioned below:

* For Mobile: https://github.com/mohammedashraf16/Islami_App

## Getting Started

The Movies contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

![Brown Fashion Sale With Phone Mockup Instagram Post (1)](https://github.com/user-attachments/assets/96346b25-ddb3-4062-8862-4f587e8a3356)

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
  https://github.com/mohammedashraf16/Islami_App
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```



## Movies Features:

* Splash
* Home
* Routing
* Provider (State Management)
* Api (http)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- core/
     |- Constants
     |- functions
     |- generated
|- features/
     |- splash
     |- details
     |- home/
          |- data
          |- tabs
          |- widgets
          |- home_view.dart
     |- providers
|- theme
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- constants - This directory contains the constants for `Endpoints `and `BaseUrl`.
2- features  - Contains all the ui of your project, contains sub directory for each screen,and contain the logic of app in seperate folders
3- theme     - contain the theme for all application 
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Constants

This directory contains all Endpoints and BaseUrls. in example below:

```
constants/
|- constants.dart
```
### Packages 
```
Packages /
|- firebase_core
|- google_fonts
|- provider
|- carousel_slider
|- cloud_firestore
|- cached_network_image
|- http
|- shimmer
```
### Samples Of Ui:
![Brown Fashion Sale With Phone Mockup Instagram Post (1)](https://github.com/user-attachments/assets/96346b25-ddb3-4062-8862-4f587e8a3356)

![Brown Fashion Sale With Phone Mockup Instagram Post](https://github.com/user-attachments/assets/748eb0a5-36df-4eed-bb77-3cfba3368b77)

       
## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the Movies then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectured for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
