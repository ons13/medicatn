class MedicaItem{
  final String title;
  final String category;
  MedicaItem({
    this.title,
    this.category,

});
}
//ye ons baad kif theb tbadalha bel sql bch tfassakh hetheya el kol o taamal
//class HomeState extends State<mainScreen>{
//var listsearch=[];
//Future getData() async{ var url='lenna url'; var response = await http.get(url);}
//var responsebody= jsoncode(response.body);
// for (int i=0; i<resonsebody.lenghth; i++) {
//listsearch.add(responsebody[i]);
// }
//print (listsearch);
// }
//@override
//void initState(){
//getData ()
//super.initState();
//
List<MedicaItem> loadMedicaItem(){
  var me = <MedicaItem>[
    MedicaItem(
        title:"amed1",
        category:"c1"
    ),
    MedicaItem(
        title:"dmed2",
        category:"c2"
    ),
    MedicaItem(
        title:"hmed1",
        category:"c3"
    ),
    MedicaItem(
        title:"gmed1",
        category:"c3"
    ),
    MedicaItem(
        title:"jmed1",
        category:"c4"
    ),
    MedicaItem(
        title:"bmed1",
        category:"c6"
    ),
    MedicaItem(
        title:"lmed1",
        category:"c7"
    ),
    MedicaItem(
        title:"pmed1",
        category:"c6"
    ),
    MedicaItem(
        title:"omed7",
        category:"c3"
    ),
    MedicaItem(
        title:"rmed7",
        category:"c3"
    ),
    MedicaItem(
        title:"tmed7",
        category:"c3"
    ),
  MedicaItem(
  title:"wmed1",
  category:"c1"
  ),
  MedicaItem(
  title:"wmed2",
  category:"c2"
  ),
  MedicaItem(
  title:"med1",
  category:"c3"
  ),
  MedicaItem(
  title:"med1",
  category:"c3"
  ),
  MedicaItem(
  title:"pmed1",
  category:"c4"
  ),
  MedicaItem(
  title:"imed1",
  category:"c6"
  ),
  MedicaItem(
  title:"emed1",
  category:"c7"
  ),
  MedicaItem(
  title:"zmed1",
  category:"c6"
  ),
  MedicaItem(
  title:"vmed7",
  category:"c3"
  ),
  MedicaItem(
  title:"vmed7",
  category:"c3"
  ),
  MedicaItem(
  title:"fmed7",
  category:"c3"),
  ];
  return me;
}