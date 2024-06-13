# Jarasic Tycoon
A park managment rougelike

## Goal 
The Goal of Jarasic Tycoon is to earn as many points as possible befor getting a game over.

Points are caluclated using the following formula
- Profits durring managment phase (p)
- Total Guest satisfaction (s)
- Total Guest dissatisfaction (d)
- Number of fatalities during dissastor phase (f)

(p * (s - d)) / f

If any dinasours escape the park during the disaster phase the game is over.

## Mechanics

The main gameplay loop consists of two phases:
- Managment Phase
- Disaster Phase

The game ends when a dinasour escapes the park or you go bankrupt.

### Managment Phase
In managment phase the player will be tasked with building an amusment park whos main attraction is horrible man eating dinasours.
Guests will enter the park and have a number of needs/desiers that must be met.

In order to meet the guests needs the player will have to build various attractions and amenities that match one or more guest needs. As the game progresses the player will have to hire more expensive and qualified staff to deal with more complex customer senarios.

### Disaster Phase
Once a threshold has been reached or after a random intervul the game will switch to disaster mode. To start, the streen will flash red and the player will be notified of the phase change.

In disaster mode each amenitie will change its function from a place of service to a place of protection. Some will offer shelter, each with a different capancty, others will murder any dinasour within range once activated and enter a cooldown. After all the dinasours are dead the phase ends and we enter Managment Phase.

## Tech Stack
Programing Language: zig

Graphics Library: raylib
