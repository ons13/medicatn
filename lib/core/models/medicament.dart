class Medicament {
  String name; // Name
  String dosage; // Qte
  String forme; // Type
  String presentation; // Category
  String conditionnement; // state
  String specification; // Material
  String generique; // Ingredients
  String dci; // importance
  String classeveic; // categories
  String subCategory; // subcat
  String fab; // Fabricant
  String Laboratoire; // Rank
  String Tableau; // Period
  String conservation; // description
  String Indication; // (Princeps/Générique)
  String Princeps; // matricule
  String AMM; // date
  String DateAMM; // code

  String get CatName => subCategory;
  String get medName => name;


  Medicament.fromMap(dynamic obj) {
    this.name = obj["tab0"];
    this.dosage = obj["tab1"];
    this.forme = obj["tab2"];
    this.presentation = obj["tab3"];
    this.conditionnement = obj["tab4"];
    this.specification = obj["tab5"];
    this.generique = obj["tab6"];
    this.dci = obj["tab7"];
    this.classeveic = obj["tab8"];
    this.subCategory = obj["tab9"];
    this.fab = obj["tab10"];
    this.Laboratoire = obj["tab11"];
    this.Tableau = obj["tab12"];
    this.conservation = obj["tab13"];
    this.Indication = obj["tab14"];
    this.Princeps = obj["tab15"];
    this.AMM = obj["tab16"];
    this.DateAMM = obj["tab17"];
  }
}