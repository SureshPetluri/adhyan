import 'package:flutter/material.dart';

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < 1200;






class Constants {
 /// header content keys
 static const String CONTENT_TYPE = 'Content-Type';
 static const String signIn = "Sign In";
 static const String AUTHORIZATION = 'Authorization';

 /// header content values
 static const String APPLICATION_JSON = 'application/json';
 static const String BEARER = 'Bearer';
 static const String ACCEPT_ALL = '*/*';

 /// Market place server URL's
 static const String DEV_API_BASE =
     'https://custommeet4.centralus.cloudapp.azure.com:8081';



 static const String ACCEPT = 'Accept';
 static const String APP_NAME = "Smart Crop";
 static const String Auth_Repo = "AuthRepository";


 /// versions
 static const String VERSION_1 = '/v1';
 static const String VERSION_2 = '/v2';
 static const String CURRENT_VERSION = VERSION_1;
}