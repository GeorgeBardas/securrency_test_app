# **Securrency Test App**
 
 ### The app supports both light and dark mode(dark theme not entirely implemented)

 ### The app supports localizations(only english for now)

 ### Flutter linter - to maintain the code quality

 ### **MVVM architecture(Provider)**
   1. Screen for UI logic
   2. ViewModel for business logic
   3. Repository for API call


### **Supported versions**
   1. Android min SDK 21 - Android 5.0
   2. iOS min 9.0
   
 ### **Flavors**
   1. dev
      1. [DEV]Test App
   2. uat
      1. [UAT]Test App
   3. prod
      1. Test App

### **Flavor Config**
   1. baseUrl - used for the main BE APIs
   2. countriesUrl - used for the countries list API(may be different from env to env)
   3. countriesApiKey - API Key for the countries API
   4. geoApiKey - API Key for Google's geolocation

Note - API keys would be hidden in an .env file but for testing purposes I exposed them in the flavors configs

### **Screens**
   1. Welcome Screen
   2. Register Screen
      1. when entering the screen the countries API start loading
      2. after the API is loaded the geolocator asks for the permission and finds the coordinates
      3. if the coordinates are not null the geocoder will try to find the address
      4. if the country name from the address is found in the countries list it will place it at the beginning(may not work sometimes because of the free API key limitations, would need an error case but this would not happen in a real case)
      5. the password entered is encrypted with AES(in a real case, a real encryption key received from the BE would be used)
      6. native calendar pickers are use(cupertino/material)
   3. Register Photo Screen
      1. user is asked to take a photo of himself
   4. Register Summary Screen
      1. all the info the user entered in the previous screens is displayed before he completes the registration process

## **Sugestions**
   1. Splash screen to preload all the data necessary and decide where to redirect the user (welcome screen/main screen for user already logged in)
   1. LTR/RTL support with TextDirectionality if needed
   2. SSL Pinning for security between the app and the BE
   3. Authentication with biometrics(Fingerprint/Face ID) after register
   4. Root/Jailbreak prevention
   5. Authentications system with JWT(access token, refresh token that can be stored locally with encrypted_local_storage)
   6. The MVVM with Provider architecture used in the project seems to be suitable for a medium sized app, but would also work Redux or BLoC
   7. Jenkins with fastlane for build automation
   8. SonarQube for code quality and validation
   9. Integration with Apple/Google Pay for new features regarding cards/in-app payments
   10. Websockets with FutureBuilder for live stream of data for trading data

## **Known Issues**
   1. The matching between the list of countries and the geocode API is made via the country name. It should be made via id(maybe country code?)
   2. The cupertino pickers does not trigger onSelected on the first item from the list