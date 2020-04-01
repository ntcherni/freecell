// Author: Nick Tchernikov
// Title: README for FreeCell for NGX Interactive Assessment
// Lanngauge: Processing.js
// Date: December 21, 2019

Impressions:
------------
This was an awesome challenge. My first thought was to use HTML and the Canvas element to accomplish this task Then, I found "Processing.js" which is a javascript port of the Processing language which is suited for interactive animation work. I thought I was would try out as I recall Processing had simplified "drawing" features and would be well-suited to some fancier animations in the future.

I only got so far with the limited time and a few difficulties, but I have a solid foundation made here and believe that I would be able to accomplish a good recreation of FreeCell, and intend to keep working on it now to completion! It took some time also to figure out how to organize this with Object-Oriented Programming, but it will make for easier modification later. 

Current functionality:
----------------------
- Player is presented with "Click Anywhere to Start Game" screen
- Cards appear uniquely shuffled and organized into 8 columns
- There are appopriately 52 cards with suit and value labels
- Player is able to click-drag-drop only the bottom cards from each column

Future Goals:
-------------
- Release of a card should drop it on the original or another column
- When dragging cards, the one being dragged should appear 'on top'
- Clicking a card should send it to 'Free Cells' or 'Tableau'
- Creating a Game class to store game state and detect won state
- Export of JSON object of game state / ability to import same
- Styling cleanups - cards should have multiple values and suits, with a large suit in the middle
- Adding Free Cells and Tableau and logic that goes along with it
- Detecting a won game state and displaying an End screen

Difficulties:
------------- 
- Although I had done some Processing work before, it took some time to get reacquainted with the specific syntax of the language 
- Figuring out an elegant way to "shuffle" the cards proved to be a challenge, never would have thought that would trip me up for so long. I had to use a defined function to accomplish randomizing an array of integers, and coding every card as a number with the form "[value][suit]" and later unpacking it with the substring function
- Figuring out that creating a Column class was the way to go took a bit of time, at first I thought of a grid system of "Spots"
- I had not gotten to the JSON I/O stage of the project, but I imagine that I would create a class called Game and be able to store the entire game state there as an object, and be able to export or import a JSON file to change the arrangment of the cards
- Ultimately, a lot of time was spent getting acquainted with Processing and fiddling with data types/objects










