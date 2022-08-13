# Shared Preferences

It takes Map <key , value> pair , and process the data asynchronously . It basically storeand retrieve small amounts of primitive data as key/value pairs to a file on the device storage such as String, int, float, Boolean.

Here we have used :


```Syntax: 
String sharedPrefferenceKey = "ISLOGGEDIN";
 
Future<dynamic> funct_name (bool  value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPrefferenceKey, value);
  }
`````
That is it first takes a bool value as parameter and then it calls the inbuild function getInstance() which takes key:String , value:Object as a Map. 

prefs → Object , calling setBool() inbuild function in Shared Preference key which takes MAP values (key:sharedPrefferenceKey(String) and value:Value (Boolean) ).

And it is necessary to get instance ( getInstance()) of shared preference , when it is used.
