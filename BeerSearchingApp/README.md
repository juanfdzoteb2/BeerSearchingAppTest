# BeerSearchingAppTest

This is an aplicaction for a Technical Test iOS MO2O


## Authors

If you have any doubt, please contact me.
jfernandezoterodev@gmail.com


## App description 

This app have 3 funcionalities.

The first screen contains a search bar to find beer that pairing the food introduced. It also has an empty state  when the user hasn’t introduced the food or it hasn’t found any match. 

![alt text](https://github.com/juanfdzoteb2/BeerSearchingAppTest/blob/main/BeerSearchingApp/ScreenShots/screenshot_1.png)
![alt text](https://github.com/juanfdzoteb2/BeerSearchingAppTest/blob/main/BeerSearchingApp/ScreenShots/screenshot_2.png)

The second screen is a detail screen where the user can read the main params of the beer selected (description, food pairing, alcohol volume, IBU...)

![alt text](https://github.com/juanfdzoteb2/BeerSearchingAppTest/blob/main/BeerSearchingApp/ScreenShots/screenshot_3.png)

The third screen is a configuration screen where the user can set a filter to select the beers with a bitterness higher or equal to the value specified.

![alt text](https://github.com/juanfdzoteb2/BeerSearchingAppTest/blob/main/BeerSearchingApp/ScreenShots/screenshot_4.png)


## Testing 


This app has 3 tests to check that the API provider is working correctly.
-> Check if the searched value is empty, return a nil
-> Check if the searched value is not empty, return  an Array of beers
-> Check if two searched values are the same, return the same value. 

Also the app has  a UITest that tests to search a chicken and go to the detail screen of the second element.

