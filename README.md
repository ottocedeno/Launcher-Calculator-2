# README

Welcome to Launcher Calculator 2.0 (BIG TIME WORK IN PROGRESS)

This project is a personal take and aim to improve the open source project, Launcher Calculator. The original project was developed by the team at Launcher, an aerospace company based in Brooklyn, NY.

## Background / Purpose

The purpose of the original Launcher Calculator is to provide the entire aerospace industry, (engineers, investors, founders, media, etc) a way to prove out basic assumptions that many rocket companies claim. The goal of the tool is to provide transparency and education. Simply put, it's use is to measure this simple equation: "Can Rocket X leave from place Y and get to Z orbit successfully?"

## Inspiration to Improve

Being a part of the Launcher community, I was able to get access to the project before it was published and also to the team of engineers who built the original tool. The first version published was an excellent first step into achieving the goal of industry transparency. However, as someone who is studying computer science, I wanted to peak at the code driving the tool and propose one simple question: Can I improve this? The short answer was YES. But it was going to be hard. Here's how I broke the project down:

## Goals

### Cleaning up the code base (Inspired by reading Clean Code)

First thing that stood out to me: The entire program is written in one giant file. CUE: Gasps. Being only a year into my journey as a softwear developer, I quickly knew this was wrong. If the goal was to build and maintain an open source project, step one was to clean up house. Technically, this was the A HA moment when I decided to take on this 'clean up project' for my first ever Rails App. Which ended up being a good and a bad thing (more on that later)

### Turning the main objects into models

Another big glaring issue I saw in the exisiting code base was how the object data for the rockets, orbits and spaceports were stored. They were all in nested arrays with values that had no decipherable meaning unless you knew what index was what. A bit of a nightmare for an open source project. This was a perfect opportunity to build proper Classes for each of these main resources, with their key data stored in the database as instances of that particular model.

### Saving configurations

Another aspect that I thought could improve was being able to configure different rockets to spaceports to orbits and then save them. This seemed like a fairly straight forward taks of creating a join table called 'Missions' that would have foreign keys for each of the objets and the user who created the mission.

### User profiles

Speaking of users. We needed a way to save Missions unique to each user. So implementing a signup/login flow made a ton of sense here.

### The hard part: Running the actual calculations

Not even going to sugar coat it. This part on paper, seems to be easy, but it's not. After reading the code base and finding the section of Javascript that handled the 'calculations', I assumed (mistake), that it would be a simple transcribing and cleaning up project. Wrong. This is where I realized I had bitten off way more than I could chew. And that brings us to the lessons learned:

## Lessons learned

1. Be careful what you wish for / sign up for. This project required way more research into the domains (rockets, propulsion terms, rocket algorithms) than I originally thought. Really make sure you understand what you're buidling and who you're building it for before you commit to buliding it.

2. Make an MVP list, don't let feature creep sit in. Focus on getting a prototype up and running as fast as possible without sacrificing quality of code. Instead of getting distracted by new feature ideas and building them straight away, write them down in a wishlist and make them stretch goals.

3. If you're going to refactor existing code. Read the original codebase 100x and make sure you know how it all works BEFORE you start. I was a bit foolish here. My strategy was to get all the easier application features up and running and save the complex mission calculations for the end. Big mistake. By the time I got to that part, I realized that was months of work on it's own, and also, I was missing some key data in my models, (and some models altogether, like the engines)

## Summary and next steps

My first rails app / experience with open source was peppered with lessons, and great practice. Being a perfectionist, I'm not thrilled with the app as it stands now. But I 100% plan to see this through and chip away at the remaining features, especially the harder calculations, one line at a time.
