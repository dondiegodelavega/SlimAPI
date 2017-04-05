# Wishlist APIs

A basic wishlist API implementation using Php where customers can get, add, update and delete wishes to a wishlist. This project is implemented using Slim micro framework and Eloquent ORM. 

### Built With

* [Slim](http://www.slimframework.com/) - PHP Micro framework.
* [Eloquent](https://laravel.com/docs/4.2/eloquent) - A PHP ORM.

### Installation

Follow the steps below for up and running the APIs on your local machine : 

* Make sure you have [Composer](https://getcomposer.org/) installed on your machine.<br/>
* Import the database SQL file to your local MySQL. Sample database file is stored in ./database/db_wishlist.sql .
* Modify the ./config/credential.php file based on your local database credentials.  
* Navigate to the root folder of the project using terminal and run :
 ```
 composer install
 ```
All Done!

### Using the APIs

To be able to use the APIs you may use [Postman](https://www.getpostman.com/). Postman enables you to call APIs with ability to Set headers and do relevant HTTP calls such as GET, PUT, POST, DELETE etc.<br/>
Before calling the APIs please make sure to set following headers :

* Current sample user API key : 

Authorization : 
```
bearer 17EA4931D317F48E62F2A78A836AB
```
* Type of the content APIs expect :

Content-Type:
```
application/json
```

### Current APIs' reference

* v1/ in the urls can be replaced with v2/ to access version 2 APIs.
* [root] should be replaced with root address of where you have hosted the files. e.g. [http://localhost/wishlist](http://localhost/wishlist).
* {wishlistId} should be replaced id of specific wishlist. ( 1 and 2 are valid based on sample data in database ).
* {wishId} should be replaced with the id of specific wish.
* Version 2 APIs for PUT and POST requires lat and lon values in body JSON string e.g. : 
```
"latitude":"101.123456", "longitude":"102.123456"
```
<br/><br/>

1.  To get list of wishes for a wishlist: <br/>
Method : GET  
```
[root]/v1/wishlist/{wishlistId}/wishes
```
2.  To create add a new wish: <br/>
Method : POST 
```
[root]/v1/wishlist/wishes
```
Body : 
```
{"name":"test", "description":"test description", "wl_wishlist_id" : "1"}
```
3.  To update a wish by wish id: <br/>
Method : PUT
```
[root]/v1/wishlist/wishes/{wishId}
```
Body : 
```
{"name":"test", "description":"test description"}
```
4.  To delete a wish by wish id: <br/>
Method : DELETE 
```
[root]/v1/wishlist/wishes/{wishId}
```
5.  Get list of wishes of a user : (not implemented) <br/>
Method : GET 
```
[root]/v1/wishlists/wishes
```

## Next : 
1. Proper implementation of User related CURD APIs and creating assigning the API keys
2. API implementation of CURD for Wishlists with its relevant classes. 
3. Making the Database credentials config more secure
4. Making the Eloquent models more complete by defining the columns etc.
5. Note that related APIs for each model will have its own controller class to handle the route functions.   