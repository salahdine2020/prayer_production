# prayer_production

Android and IOS version of Prayer Production APP 

## App Feautres:

  - 1/ Onboarding Screens
  - 2/ inscription part
    - 2.1/ form to valid insiption
    - 2.2/ Post Informaion of user into server side
    - 2.3/ save user ID in use of shared preference
  - 3/ succes Screen to Inform User if Your register is OK 
  - 4/ Bottom Bar contain four main part {Accueil, search, favorite, profile}
  - 5/ Accueil Page : 
    - 5.1/ Card Contain default time prayer {get request from http}
    - 5.2/ refrech to load new time evry moment as u need 
    - 5.3/ second party contain 5 parties of prayers allow you to booking prayer {not yet}
  - 6/ Search Page : 
    - 6.1/ allow you to search for mosques 
    - 6.2/ search from App Bar and provide list of code postal existe {you shoul use it to understand}
      - 6.2.1/ Post request to search in use of postal code
      - 6.2.2/ return with list of all mosques existe in that postal code 
    - 6.3/ Mosques List : 
      - 6.3.1/ Contain Card with more information about mosque like name and address
      - 6.3.2/ IconButton allow you to add in favorite List.
    - 6.4/ Booking Page:
      - 6.4.1/ contain mosque choice 
      - 6.4.2/ Post request to get all services allowed in this mosques
      - 6.4.3/ Groups Cards allow you booking in your prayer choice {Cards in red means this groupe is full of}
   - 7/ Favorite Page {not yet}
   - 8/ Profile Page :
     - 8.1/ change Between Dark and Light mode
     - 8.2/ show User Information in base of user ID form shared preferences {Post request to download User Information} 
      - 8.2.1/ profile avatar picture by default according to the gender of User
      - 8.2.2/ User all Information {nom,prenom,code postal, num de telephone}
      - 8.2.3/ Buttons About Us {not yet for production}
     - 8.3/  Button allow you update User Infrmation {not yet for production}  
    
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
