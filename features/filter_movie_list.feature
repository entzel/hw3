Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And  I am on the RottenPotatoes home page
  
Scenario: restrict to movies with 'PG' or 'R' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes

  When I check the following ratings: PG, R

  # enter step(s) to uncheck all other checkboxes
  And I uncheck the following ratings: G, PG-13, NC-17

  # enter step to "submit" the search form on the homepage
  And I press ratings_submit

  
  Then "Raiders of the Lost Ark" should appear
  And "The Terminator" should appear
  And "When Harry Met Sally" should appear
  And "Amelie" should appear
  And "The Incredibles" should appear

  And "2001: A Space Odyssey" should not appear
  And "Chicken Run" should not appear
  And "Chocolat" should not appear
  And "The Help" should not appear


Scenario: no ratings selected
  When I uncheck the following ratings: G, PG, NC-17, PG-13, R
  And I press ratings_submit
  Then I should see none of the movies

Scenario: all ratings selected
 When I check the following ratings: G, PG, NC-17, PG-13, R
 And I press 'ratings_submit'
 Then I should see all of the movies
