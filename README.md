# A path towards a larger Flutter app
Google has quite a few excellent demo apps that demonstrate various concepts. The most notable is a counter app that showcases some of the neat Flutter features.

However, the market for counter apps in the app stores is fairly limited (lol), so I've been exploring how I might move from that basic application structure into a more robust architecture.

This project captures the various techniques that I've been working through in order to arrive at an app architecture that I believe will scale to support some fairly standard app features. For example:

* Login/logout
* Multiple tabs that represent different sections of the app
* Asynchronously fetching data behind a spinner before transitioning to a new screen
* Screen lifecycle support such as fetching, error and success
* A pattern for passing data between screens (some form of dependency injection)
* Mockable API architecture to support tests

After reviewing a number of options, I decided to base my app architecture around Redux library.

## TLDR
Check out the [first pull request](https://github.com/edwardaux/flutter-holidays-redux/pull/1) and step through commit-by-commit as I build up to the final solution.

## Demo
In order to demonstrate the concepts, I wanted to try and build a somewhat realistic app. As you can see from the video below, I have implemented the following functionality:

* Login
* Display a list of holiday summaries
* Select details for a specific holiday and view those details in a new screen
* Navigate back to the holiday list
* Display the user's profile screen
* Logout

<img src="https://github.com/edwardaux/flutter-holidays-redux/raw/master/demo.gif" width="200"/>

## How to use this repository
There are a number of excellent full-featured apps (see *References* section below) that show complete, working apps. However, it is sometimes overwhelming coming to grips with a large, complete codebase.

To that end, this repository contains a series of [pull requests](https://github.com/edwardaux/flutter-holidays-redux/issues?utf8=✓&q=is%3Aclosed+) that build upon each other to incrementally arrive at a final solution.

You're welcome to check out the complete repository and wander through the source, however, I've deliberately structured it so that each commit is meaningful and able to be understood by itself.

**IMPORTANT:** The intent of this repository is not to teach redux specifically, but rather to explore how you might apply it in a working application. It would be worth reading some articles on flutter and redux beforehand.

## Important caveats
It is important to note that I am not holding this project up as the holy grail of app architectures. There are many other equally valid patterns and architectures. What suits my needs may not suit your needs. 
 
I have not shipped an app in the store using this architecture. I have, however, shipped many other apps using native iOS and Android development techniques, and hopefully you will see that I'm trying to address some of the common problems found when building modern mobile applications.

Also, I have spent literally zero effort in trying to style the application. That is not the intent of this project.

## References
* [Outstanding series of using different architectures](https://github.com/brianegan/flutter_architecture_samples)
* [Contains a number of great examples](https://github.com/ericwindmill/flutter_by_example_apps)
* [Real world app - movie browser](https://github.com/roughike/inKino)
* [Real world app - invoice management](https://github.com/invoiceninja/flutter-mobile)

## Feedback
This is the first time I've tried to use github pull requests as a means of communicating a gradual implementation path. If you have any suggestions, please feel free to follow me on [twitter](https://twitter.com/edwardaux) or send me an [email](craig@blackdogfoundry.com).