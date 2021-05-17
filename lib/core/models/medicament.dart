class Medicament {
  String name; // Name
  String qte; // Qte
  String type; // Type
  String category; // Category
  String state; // state
  String material; // Material
  String ingrds; // Ingredients
  String imprt; // importance
  String dvs; // categories
  String subCategory; // subcat
  String fab; // Fabricant
  String rank; // Rank
  String period; // Period
  String desc; // description
  String prg; // (Princeps/Générique)
  String mat; // matricule
  String fabdate; // date
  String code; // code

  String get CatName => subCategory;
  String get medName => name;


  Medicament.fromMap(dynamic obj) {
    this.name = obj["tab0"];
    this.qte = obj["tab1"];
    this.type = obj["tab2"];
    this.category = obj["tab3"];
    this.state = obj["tab4"];
    this.material = obj["tab5"];
    this.ingrds = obj["tab6"];
    this.imprt = obj["tab7"];
    this.dvs = obj["tab8"];
    this.subCategory = obj["tab9"];
    this.fab = obj["tab10"];
    this.rank = obj["tab11"];
    this.period = obj["tab12"];
    this.desc = obj["tab13"];
    this.prg = obj["tab14"];
    this.mat = obj["tab15"];
    this.fabdate = obj["tab16"];
    this.code = obj["tab17"];
  }
}