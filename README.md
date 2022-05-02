# FoodRecipeApp

## About the project
Food recipe app is an iOS app which gives a list of food recipes along with details. Details such as preparation time, cooking time, total time, ingredients, instructions to prepare and the total servings. It also shows the rating of recipe.

## Application at a glance
Application has five screens, the details are as shown below:


![home screen](/images/homepage.png)
![search results](/images/searchResults.png)
![Recipe Detail](/images/recipeDetail.png)
![Recipe Ingredients](/images/ingredientsRecipe.png)
![Recipe Instructions](/images/instructionsRecipe.png)


    *     Home Screen
        The above screen represents the Home Screen of our “Recipe App”. This view has below objects namely:
            - Search Bar: whenever user wants to search a recipe, user can use this bar to search.
            - Collection View: All the popular recipes are shown in this view with horizontal scrolling.
            - Table View: Recipes are shown alphabateical order of their name in this table view along with an image. 
        ### Navigation
        Following are the navigations available from this screen:
            - Whenever a user clicks on the search bar and types something and when he clicks on enter on the keyboard, view will be navigated to search results view.
            - On the click of any of the popular recipes from the collection view cell, view will be navigated to recipe app detail page.
            - Similarly, on click of any of the recipes from the table view, view will be navigated to recipe app detail 
    *   Search Results
        The above screen represents the Search Results screen. In this screen, search results based on the search made from the home screen are listed. This view contains a label which is named search results, a table which shows all the searched results and a Home button which navigates to home screen.
        ### Navigation
        Following are the navigations from the search results view:
            - Navigation from the search result cell to recipe detail screen is done whenever clicked on a search results cell.
            - When user clicks on the <Home button, view will be navigated to a home screen.
    *   Recipe Detail
        Recipe detail screen shows all the details of a recipe detail. Recipe detail contains a label which shows the recipe name, an image of a recipe, five labels which shows preparation time, cook time, total time ,ratings and total servings, show ingredients button, show instructions button and a Home button.
        ### Navigation
        Following are the navigations made from the recipe detail screen:
            - Whenever clicked on show ingredients button, view will be navigated to ingredients of the particular recipe.
            - Navigation from recipe detail to instructions of recipe is done whenever clicked on show instructions button.
            - Home button is available at the top left which is used to navigate from recipe detail to home screen whenever clicked on the button.
    *   Recipe Ingredients
        The above screes is a recipe ingredient screen which contains a label with name instructions, a table which shows all the instructions and back-recipe button.
        ### Navigation
        Following are the navigations made from the ingredients view:
            - Navigation to the recipe detail screen is done whenever clicked on Recipe button
    *   Recipe Instructions
        The above screen is a recipe instruction view where all the instructions to make a recipe are shown. This view contains a table view which lists all the recipe instructions, Recipe button which is used to navigate to the recipe detail screen.
        ### Navigation
        Following are the navigation made from the instructions view:
            -   When a user clicks on Recipe button, view is navigated from instructions view to recipe detail view.

## Techincal Requirements for implementing app
    *   XCode 13.0
    *   Swift Language 5.5
    *   Firebase account    

## Requirements to run the app
    *   Software Requirements
            -   XCode 13.0
    *   Installations
            -   Pod
                *   To install the pod follow the instructions mentioned in the [Cocopods website](https://cocoapods.org/)
                *   Once installed, navigate to the file location in the terminal and type the following command:
                    <pod install
## Contributors
[Venkata Gopi Siva Sai Nallapati](https://github.com/NVGSSAI)

[Raghavendra Reddy](https://github.com/reddy-raghavendra)

[Amulya Mallepalli](https://github.com/amulyamallepalli)

[Sushma Nalla](https://github.com/SushmaNalla)

[Pariveshita Thota](https://github.com/PariveshitaThota)

[Chandra Bhanu Tata](https://github.com/tata1141)



