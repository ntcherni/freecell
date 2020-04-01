// Author: Nick Tchernikov
// Title: FreeCell made for NGX Interactive 24- Hour Assessment
// Lanngauge: Processing.js 
// Date: December 21, 2019

// Column class organizes cards into ... columns
class Column {
    // ArrayList cards is for storing cards in the column
    ArrayList cards; 
    int length;
    Column() {
        cards = new ArrayList();
        length = 0;
    }
    void addCard (Card card, int index) {
        cards.add(card);
        length++;
        // specific x and y positions that change with each card added
        card.xPos = (50 + index * 70); 
        card.yPos = (300 + (length * 30));
    }
}

// Card class stores the suit, value and display information for the card
class Card  {
    float xPos, yPos;
    float offsetX, offsetY;
    int suit, value, height, length;
    boolean mouseHover;
    boolean grasped;

    Card(float tempXPos, float tempYPos, int tempSuit, int tempValue) {
        xPos = tempXPos; 
        yPos = tempYPos; 
        suit = tempSuit; 
        value = tempValue;
        
        mouseOver = false;
        grasped = false;

        offsetX = 0.0;
        offsetY = 0.0;

        // card dimensions
        height = 30;
        length = 40; 
    }

    void drawCard() {
        // below is all about the style of the card
        rectMode(CENTER_RADIUS);

        // change card appearance based on whether it's "grasped"
        if(!grasped) {
            stroke(64, 64, 64);
            fill(255, 255, 255);
        } else if (grasped) {
            stroke(64, 64, 64);
            fill(224, 224, 224);
        } 

        // actually draw the card
        rect(xPos, yPos, height, length);
        
        // card text drawing (suit/value)
        if(suit == 1) { 
            // heart
            fill(255, 0, 0); 
            textFont(font, 15);
            text(value + "\u2661", xPos - 10, yPos - 20);
        } else if (suit == 2) { 
            // spade
            fill(0); 
            textFont(font, 15);
            text(value + "\u2660", xPos - 10, yPos - 20); 
        } else if(suit == 3) { 
            // diamond
            fill(255, 0, 0); 
            textFont(font, 15);
            text(value + "\u2666", xPos - 10, yPos - 20);
        } else if (suit == 4) { 
            // club
            fill(0); 
            textFont(font, 15);
            text(value + "\u2663", xPos - 10, yPos - 20);
        }   
    }
}

// delcarations
boolean welcomeScreen;
ArrayList deck;
ArrayList columns;
PFont font;
ArrayList bottomCards; 
int columnIndex;

void setup() 
{
    // canvas size
    size(600, 600); 

    // initializations
    deck = new ArrayList();
    columns = new ArrayList();
    bottomCards = new ArrayList();

    // initialize the columns
    for(i = 0; i < 8; i++) {
        columns.add( new Column() );
    }

    // initialize the cards as integers
    // suits = Hearts (1), Spades(2), Diamonds(3), Clubs(4)
    // values = A(1), 2, 3, 4, 5, 6, 7, 8, 9, 10, J(11), Q(12), K(13)
    int[] cards = new int[52];
    int cardNumber = 0; 
    for(i = 1; i < 5; i++) {
        for(j = 1; j < 14; j++) {
            String card = new String; 
            // "value + suit"(for concatenation)
            card = int(str(j) + str(i)); 
            // cast into integer and store
            cards[cardNumber] = int(card);
            cardNumber++;
        }
    }

    // shuffle the cards
    randomize(cards);

    // initialize shuffled deck
    for (i = 0; i < cards.length; i++) {
        String cardStr = str(cards[i]);
        int cardValue = int(cardStr.substring(0,cardStr.length()-1));
        int cardSuit = int(cardStr.substring(cardStr.length()-1));
        deck.add( new Card(0, 0, cardSuit, cardValue) );
    }

    // put cards from deck into columns 
    for(i = 0; i < deck.size(); i++) {
        Card card = (Card) deck.get(i);
        if(i > 0 && i < 7) {
            columnIndex = 0;
        } else if (i >= 7 && i < 14) {
            columnIndex = 1;
        } else if (i >= 14 && i < 21) {
            columnIndex = 2;
        } else if (i >= 21 && i < 28) {
            columnIndex = 3;
        } else if (i >= 28 && i < 34){
            columnIndex = 4;
        } else if(i >= 34 && i < 40) {
            columnIndex = 5;
        } else if (i >= 40 && i < 46) {
            columnIndex = 6;
        } else if (i >= 46 && i < 52) {
            columnIndex = 7;
        }
    
        
        Column column = columns.get(columnIndex);
        column.addCard(card, columnIndex);
    }

    // load a font for any text
    font = loadFont("arial.ttf"); 

    // welcome screen displays first
    welcomeScreen = true;
}


void draw() 
{  
    background(0);

    if(welcomeScreen) {
        fill(255, 255, 255); // white
        textFont(font, 25);
        text("Click Anywhere to Start Game", 150, 300);       
    } else {
        // go through cards column by column
        for(i = 0; i < columns.size(); i++ ) {
            Column column = (Column) columns.get(i);
            ArrayList cards = column.cards;
            
            // go through all cards
            for(j = 0; j < cards.size(); j++) {
                Card card = (Card) cards.get(j);

                // detect when mouse is over the card
                if(mouseX > card.xPos-card.height && mouseX < card.xPos+card.height && 
                    mouseY > card.yPos-card.length && mouseY < card.yPos+card.length) 
                {
                    card.mouseOver = true;
                } else {
                    card.mouseOver = false;
                }

                // update bottom cards
                if((j+1) == column.length) {
                    // column.length would be changed if a card 
                    // was added or removed from a column successfully
                    bottomCards.add(card);
                }

                // draw the card on screen

                // draw a grasped card last?
                card.drawCard();
            }
        } // end all cards
       // graspedCard.drawCard();
    }
}

// mouse is pressed
void mousePressed() {
    if( welcomeScreen ) {
        welcomeScreen = false;
    } else {
        for (int i = bottomCards.size()-1; i >= 0; i--) { 
            Card card = (Card) bottomCards.get(i);
            if(card.mouseOver) { 
                card.grasped = true; 
            } else {
                card.grasped = false;
            }
            card.offsetX = mouseX-card.xPos; 
            card.offsetY = mouseY-card.yPos; 
        }
    }

}

// change card X and card Y pos when mouse is pressed down and moved
void mouseDragged() { // only traverse bottom cards ... 
    for (int i = bottomCards.size()-1; i >= 0; i--) { 
        Card card = (Card) bottomCards.get(i);
        if(card.grasped) {
            card.xPos = mouseX-card.offsetX; 
            card.yPos = mouseY-card.offsetY; 
        }
    }
}

// mouse is released
void mouseReleased() { 
    for (int i = bottomCards.size()-1; i >= 0; i--) { 
        Card card = (Card) bottomCards.get(i);
        card.grasped = false;
        // NOTE: here is where checks would happen for where the card grasped was dropped, 
        // and whether it "collides" with a card underneath that is valid
        // if so, the card would be added to the column that the card underneath is located, 
        // and removed from the column it was in originally
        // the length parameter of the columns would be adjusted accordingly, which would 
        // adjust the bottomCards available for the next player action
    }
}


// helper function for shuffling an array of integers
// ---------------------------------------------------
void randomize (int[] arrMy) {
    for (int k=0; k < arrMy.length; k++) {
      int x = (int)random(0, arrMy.length);    
      arrMy = swapValues(arrMy, k, x);
    }
  }
int[] swapValues (int[] myArray, int a, int b) {
    int temp=myArray[a];
    myArray[a]=myArray[b];
    myArray[b]=temp;
    return myArray;
} 