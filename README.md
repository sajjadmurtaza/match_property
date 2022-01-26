# matching properties

Ruby Version: 3.0.0

Rails Version: 7.0.1

Simple API to recommended properties based on locations, property type and marketing type.

### Key files

    
    app
    ├── controller
    │      ├── api                             
    │           └── v1                        
    │               └── properties_controller  
    │
    ├── models                    
    |      └── property
    |
    ├── services
    │      ├── match_property 
    |      └── search_validation 
    |
    └──  serializer
            └── matched_property
    

### Workflow - How does it work?

    Please Postman/ Insomnia to test.

    GET / http://localhost:3000/api/v1/properties

    
        {
          "property": {
            "lng": "13.4236807",
            "lat": "52.5342963",
            "property_type": "apartment",
            "marketing_type": "sell"
          }
        }
    
 
    │    1. GET request with all required params  │ 
    ├──────────────────────────────────────────── │     
    │                                             ├                        
    │    2. It returns all matched properties     │               
    │──────────────────────────────────────────── │
    │                                             │
    │    3. It raises an error with wrong params  │
    ├──────────────────────────────────────────── │ 
    │                                             ├       
    │    3. also return distance and bearing      │ 
    │ ────────────────────────────────────────────│

***
**Setup**

* first clone the directory 
                      ```
                      git clone git@github.com:sajjadmurtaza/match_property.git'
                      ```
 *  ```cd match_property```

 *  ```bundle install ```
 *  ```rake db:create```
 *  ```rake db:migrate```

 or

 *  ```rake db:setup```

 
***

And import PostgreSQL data dump:

 * **psql match_property_development < properties.sql**
 
 ***

 *  ```rails s ```
 
 ***
 Then open Postman or Insomnia or any API Testing Tool to connect with server
 

 * Enter url ```http://localhost:3000/api/v1/properties``` and pass parameters as json


    ```
      {
        "property": {
          "lng": "13.4236807",
          "lat": "52.5342963",
          "property_type": "apartment",
          "marketing_type": "sell"
        }
      }
    ```

If all params are valid then it will return matched properties

![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/1.png "MP3 Screenshot")


If do not match then there will be a message that NO record found

![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/2.png "MP3 Screenshot")


If request with wrong params then there will be error message with exact missing Information

![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/3.png "MP3 Screenshot")

### Specs

run ``` bundle exe rspec   ``` to run the tests

#### Note
I used following gems for this challenge.

* [geocoder](http://www.rubygeocoder.com/) - geocoding library for Ruby.
* [rspec-rails](https://github.com/rspec/rspec-rails) - testing framework
* [byebug](https://github.com/deivid-rodriguez/byebug) -  debugger for Ruby