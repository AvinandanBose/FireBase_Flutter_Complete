# Shared Preferences

It takes Map <key , value> pair , and process the data asynchronously . It basically store and retrieve small amounts of primitive data as key/value pairs to a file on the device storage such as String, int, float, Boolean.

Here we have used :


```Syntax: 
String sharedPrefferenceKey = "ISLOGGEDIN";
 
Future<dynamic> funct_name (bool  value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences.setMockInitialValues({sharedPrefferenceKey: value});
    return await prefs.setBool(sharedPrefferenceKey, value);
  }
`````
That is it first takes a bool value as parameter and then it calls the inbuild function getInstance() which takes key:String , value:Object as a Map. 

prefs → Object of SharedPreferences class, calling setBool() inbuild function in Shared Preference key which takes MAP values (key:sharedPrefferenceKey(String) and value:Value (Boolean) ).

And it is necessary to get instance ( getInstance()) of shared preference , when it is used.

And another thing is :

setMockInitialValues(Map<String , Object> values)→ that is {string as key : Object as a value} and it is a static void inbuilt function which doesnot return but store data i.e. can be used for testing data.

Note: SharedPreferences is used to store some small amount so that we doesnot loose it throughout the process. In terms of LogIn and Register we doesnot get logout.  


