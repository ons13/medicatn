// This file contains database queries
const String allMedicamentCategories = 'SELECT DISTINCT tab8 FROM med ORDER BY tab8 ASC';
const String subCategories = "SELECT DISTINCT tab9 from med where tab8='";
const String medicamentsByName = "SELECT * from med where tab0='";
const String allMedicaments = "SELECT * from med";
