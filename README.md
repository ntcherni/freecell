Rules 
-----

* 52 playing cards
* Starting position: 
** 8 columns
*** 4 columns x 7 cards each
*** 4 columns x 6 cards each
* Cards in these columns referred to as the Tableau
* Win state: 
** the 4 HomeCells contain cards in ascending order of identical suit: 
*** Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K
* Lose state: 
** No more moves available
* Exposed card at the bottom of each column is available for play
* Exposed cards may be moved to any FreeCell 
* Exposed cards and those in FreeCells may be moved in to a Tableau cell if 
** Tableau cell is empty
** Moving the card to the Tableau cell will form a descending sequence of cards in alternating suit colour (red/black)
*Shortcut: 
* Empty FreeCells allow you to move an entire sequence of cards
** The limit of the sequence of cards is the number of open FreeCells + 1
* Supermove with empty Tableau available: 
** The limit of the sequence of cards that can be moved is doubled

* Serialized Game State: 
** 4 x FreeCells
** 4 x HomeCells
** 8 Columns

* Drawing the game: 
** Processing draws in order of the draw commands
