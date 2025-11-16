// import 'package:flutter/material.dart';
// import 'service_page.dart';

// class WaterCoolerROPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ServicePage(title: 'Water Cooler/RO', color: Colors.orange);
//   }
// }

import 'package:flutter/material.dart';

class WaterCoolerROPage extends StatefulWidget {
  const WaterCoolerROPage({super.key});

  @override
  State<WaterCoolerROPage> createState() => _WaterCoolerROPageState();
}

class _WaterCoolerROPageState extends State<WaterCoolerROPage> {
  int selectedIndex = 0;
  String selectedBlock = 'All';
  Map<int,bool> expandedMap = <int,bool>{};

  final List<Map<String,dynamic>> complaints = [
    {'block':'MH1','email':'amit@vit.com','regNo':'22BCE1401','place':'MH1 Common','status':'Pending','filedDate':'2025-11-01','description':'RO not dispensing water.'},
    {'block':'LH3','email':'neha@vit.com','regNo':'22BCE1402','place':'LH3 Corridor','status':'In Progress','filedDate':'2025-11-02','description':'Water cooler leaking.'},
  ];

  final List<Map<String,dynamic>> reported = [
    {'block':'MH2','email':'sana@vit.com','regNo':'22BCE1403','place':'MH2 Common','status':'Reported','filedDate':'2025-11-03','description':'Filter making noise.'},
  ];

  List<Map<String,dynamic>> filterByBlock(List<Map<String,dynamic>> list) => selectedBlock=='All' ? list : list.where((c)=> c['block']==selectedBlock).toList();

  Widget _tile(Map<String,dynamic> c,int idx,bool isReported){
    return Container(
      margin: const EdgeInsets.symmetric(vertical:6,horizontal:10),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius:10, offset: const Offset(0,4))]),
      child: ExpansionTile(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), tilePadding: const EdgeInsets.symmetric(horizontal:16, vertical:8), onExpansionChanged:(e)=> setState(()=> expandedMap[idx]=e), leading: const Icon(Icons.water, color: Colors.lightBlue), title: Text(c['description'], maxLines:1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize:16)), subtitle: Text("Block: ${c['block']}"), children:[
        Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if(isReported) const Padding(padding: EdgeInsets.only(bottom:6), child: Text("📢 Reported Complaint", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent))),
          //_row("Email", c['email']),
          _row("Reg No         ", c['regNo']),
          _row("Place            ", c['place']),
          _row("Status           ", c['status']),
          _row("Filed Date     ", c['filedDate']),
          _row("Description   ", c['description']),
        ]))
      ]),
    );
  }

  Widget _row(String k,String v)=> Padding(padding: const EdgeInsets.symmetric(vertical:3), child: Row(children: [SizedBox(width:110, child: Text("$k:", style: const TextStyle(fontWeight: FontWeight.bold))), Expanded(child: Text(v))]));

  Widget _list(List<Map<String,dynamic>> list,{bool isReported=false}) {
    final filtered = filterByBlock(list);
    return Column(children: [
      const SizedBox(height:10),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text("Filter by Block: ", style: TextStyle(fontSize:16,fontWeight: FontWeight.bold)), DropdownButton<String>(value:selectedBlock, items:['All','LH1','LH2','LH3','MH1','MH2','MH3','MH4','MH5','MH6','MH7'].map((b)=>DropdownMenuItem(value:b, child: Text(b))).toList(), onChanged:(v)=> setState(()=> selectedBlock = v!))]),
      const SizedBox(height:10),
      Expanded(child: ListView.builder(itemCount: filtered.length, itemBuilder:(context,i)=> _tile(filtered[i], i, isReported)))
    ]);
  }

  Widget _settings()=> const Center(child: Text("Settings (Coming Soon)", style: TextStyle(fontSize:18)));

  @override
  Widget build(BuildContext context) {
    final pages = [_list(complaints), _list(reported, isReported:true), _settings()];
    return Scaffold(appBar: AppBar(title: const Text("Water Cooler / RO Complaints"), backgroundColor: Colors.lightBlue, centerTitle:true, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: ()=> Navigator.pop(context))), body: pages[selectedIndex], bottomNavigationBar: BottomNavigationBar(currentIndex:selectedIndex, onTap:(i)=> setState(()=> selectedIndex = i), selectedItemColor: Colors.lightBlue, unselectedItemColor: Colors.grey, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.report_problem), label:'Complaints'),
      BottomNavigationBarItem(icon: Icon(Icons.note_add), label:'Reported'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label:'Settings'),
    ]));
  }
}
