
![DotCoder](https://raw.githubusercontent.com/OsamaQureshi796/MealMonkey/main/assets/dotcoder.png)

# Overview
___

**SearchHelpe**r is code wrapper for searching functionality developed by **`DOTCODER`**. It is kind of help  to developer to perform searching easy.

## How it work's:
**SearchHelper** is class that has **_three_** static methods.
1- `wordSearch()`
2- `stringInstantSearch()`
3- `searchModel()`

1st and 2nd method expect same **Parameter** to be passed. 
given bellow.

 Parameter  | Description                                                                                            
------------|--------------------------------------------------------------------------------------------------------
 data       | This parameter takes `List<Map<String,dynamic>>` as a data source and perform search on that data.     
 keys       | This parameter takes `List<String>` as a searching field like search work in title, description field. 
 searchWord | This parameter is basically the word that need to be searched in the data.                             

##### Note:
`SearchWord` parameter takes dynamic value like it accepts `bool, int, double and String`.


### How `wordSearch()` and `stringInstantSearch()` works:
It takes `List<Map<String,dynamic>>` as data parameter, `List<String>` as properties parameter and `searchWord` parameter takes dynamic value. It returns `List<Map<String,dynamic>>` as a search result.

#### How `searchModel()` Works:
It takes `List<T>` as data parameter, `List<String>` as keys parameter, `Map<String,String>` as object search in each user defined model and `searchWord` parameter takes dynamic value. It returns `List<Map<String,dynamic>>` as a search result.

##### **Important note**:
Make sure that every model that you're using have it's `toJson()` and `fromJson()` methods because plugin is using it in underlying work.

| Parameter   | Description                                                                                                                                            |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| data        | This parameter takes `List<T>` as a data source and perform search on that data.                                                                       |
| properties  | This parameter takes `List<String>` as a searching field like search work in title, description field.                                                 |
| innerObject | If you want to search in a `List<T>` and there is another object inside `T` then you can use `innerObject` to search specific object containing model. |
| searchWord  | This parameter is basically the word that need to be searched in the data.                                                                             |
### Getting Started
In _pubspec.yaml_

```
dependencies:
    search_helper: ^0.0.6
```

### Code Example of 1st and 2nd method as they're same:

```
import 'package:search_helper/search_helper.dart';

void main(){
  
  List<Map<String,dynamic>> items = [
    {
      'name': "Osama",
      'age': 21,
      'father': "Noushad"
    },
    {
      'name': "Haseeb",
      'age': 20,
      'father': "Noushad"
    },
    {
      'name': "Shahrok",
      'age': 22,
      'father': "Noushad"
    },
    {
      'name': "Asad",
      'age': 23,
      'father': "Noushad"
    },
  ];
  
  
  List<String> keys = ['age','name','father'];
  
  
  List<Map<String,dynamic>> result = SearchHelper.stringInstantSearch(data: items,keys: keys,searchWord: 'osama');
 
}
```
### Code Example of model based search:

#### 1st Example:

First of all let's define our User Model. and we'll be using that User model to search for some users.

```
class User {
  String name;
  int age;

  User(this.name, this.age);

  Map toJson() => {
    'name': name,
    'age': age,
  };

  factory User.fromJson(dynamic json) {
    return User(json['name'] as String, json['age'] as int);
  }
}
```

as it is mentioned that `toJson()` and `fromJson()` is required in searching model.

Let's search over `List<User>`.

```
import 'package:search_helper/search_helper.dart';
import 'dart:convert';

void main(){
  
  
    List<User> users = [
        User('Osama',12),
        User('Haseeb',13),
        User("Shahrokh",14)
    ];
    
    List<User> filteredUsers = [];

    var result = SearchHelper.searchModel(
        data: users,
        properties: ['name',],
        searchWord: 'osama'
    );
           
    result.forEach((e){
       User u = User.fromJson(e);
       filteredUsers.add(u);
    });              
    
    
 
}
```

#### 2nd example:

let's perform little deep search on another model that have tutorial information and it's author information.

so let's first create cass for `Tutorial` model.

```
class Tutorial {
  String title;
  String description;
  User? author;
  
  Tutorial(this.title, this.description, {this.author});

  Map toJson() {
  Map? author =
  this.author! != null ? this.author!.toJson() : null;

  return {
  'title': title,
  'description': description,
  'author': author,
  };
  }

  factory Tutorial.fromJson(dynamic json) {
    
      return Tutorial(
          json['title'] as String,
          json['description'] as String,
          author:
          User.fromJson(json['author'])
      );
    
  }
}
```

Now our `Tutorial` model is completed let's now use the same `User` class that we used above.

Let's create the search for all those tutorials whose author name is starting with osama.

```
import 'package:search_helper/search_helper.dart';
import 'dart:convert';

void main(){
  
  
    List<Tutorial> tutorials = [
    Tutorial('C++', "This is c++ course.",author: User('Osama', 12)),
    Tutorial('C#', "This is c# course.",author: User('Haseeb', 13)),
  ];
  
  List<Tutorial> filteredTutorials = [];

  var result = SearchHelper.searchModel(
        data: tutorials,
        innerObject: {'author': 'name'},
        searchWord: 'osama'
    );

 result.forEach((e){
       Tutorial t = Tutorial.fromJson(e);
       filteredTutorials.add(t);
    });                                    
    
}
```

The result that we'll be get at the end of `searchModel()` is `List<dynamic>` and then you need to convert it again to model.

## That's all we've to do.
# Happy Coding and Searching  🤗.
