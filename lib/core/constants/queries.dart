// This file contains database queries
const String allMedicamentCategories = 'SELECT DISTINCT tab8 FROM med ORDER BY tab8 ASC';
const String subCategories = "SELECT DISTINCT tab9 from med where tab8='";
const String allMedicaments = "SELECT * from med where tab9='";
<<<<<<< Updated upstream


//Favorites
const String getAllFavorites = "Select * from favorites;";
const String addDrug = "Insert into favorites values"
=======
const String getAllDrugs = "SELECT * from med limit 20";
>>>>>>> Stashed changes
