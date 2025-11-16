// import 'package:flutter/material.dart';
// import 'service_page.dart';

// class CivilWorksPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ServicePage(title: 'Civil Works', color: Colors.orange);
//   }
// }
import 'package:flutter/material.dart';

class CivilWorksPage extends StatefulWidget {
  const CivilWorksPage({super.key});

  @override
  State<CivilWorksPage> createState() => _CivilWorksPageState();
}

class _CivilWorksPageState extends State<CivilWorksPage> {
  int selectedIndex = 0;
  String selectedBlock = 'All';
  Map<int,bool> expandedMap = <int,bool>{};

  final List<Map<String,dynamic>> complaints = [
    {'block':'MH5','email':'ajay@vit.com','regNo':'22BCE2001','place':'MH5 Corridor','status':'Pending','filedDate':'2025-11-01','description':'Crack in wall.'},
  ];

  final List<Map<String,dynamic>> reported = [
    {'block':'LH2','email':'latha@vit.com','regNo':'22BCE2002','place':'LH2 Staircase','status':'Reported','filedDate':'2025-11-03','description':'Loose railing.'},
  ];

  List<Map<String,dynamic>> _filter(List<Map<String,dynamic>> list) => selectedBlock=='All' ? list : list.where((c)=> c['block']==selectedBlock).toList();

  Widget _tile(Map<String,dynamic> c,int idx,bool isReported) => Container(margin: const EdgeInsets.symmetric(vertical:6,horizontal:10), decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius:10, offset: const Offset(0,4))]), child:
    ExpansionTile(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), tilePadding: const EdgeInsets.symmetric(horizontal:16, vertical:8), onExpansionChanged:(e)=> setState(()=> expandedMap[idx]=e), leading: const Icon(Icons.construction, color: Colors.grey), title: Text(c['description'], maxLines:1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize:16)), subtitle: Text("Block: ${c['block']}"), children: [
      Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        if(isReported) const Padding(padding: EdgeInsets.only(bottom:6), child: Text("📢 Reported Complaint", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent))),
        //_row("Email", c['email']),
        _row("Reg No         ", c['regNo']),
          _row("Place            ", c['place']),
          _row("Status           ", c['status']),
          _row("Filed Date     ", c['filedDate']),
          _row("Description   ", c['description']),
      ]))
    ]));

  Widget _row(String k,String v)=> Padding(padding: const EdgeInsets.symmetric(vertical:3), child: Row(children: [SizedBox(width:110, child: Text("$k:", style: const TextStyle(fontWeight: FontWeight.bold))), Expanded(child: Text(v))]));

  Widget _list(List<Map<String,dynamic>> list,{bool isReported=false}){ final filtered = _filter(list); return Column(children: [
    const SizedBox(height:10),
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text("Filter by Block: ", style: TextStyle(fontSize:16,fontWeight: FontWeight.bold)), DropdownButton<String>(value:selectedBlock, items:['All','LH1','LH2','LH3','MH1','MH2','MH3','MH4','MH5','MH6','MH7'].map((b)=>DropdownMenuItem(value:b, child: Text(b))).toList(), onChanged:(v)=> setState(()=> selectedBlock = v!))]),
    const SizedBox(height:10),
    Expanded(child: ListView.builder(itemCount: filtered.length, itemBuilder:(context,i)=> _tile(filtered[i], i, isReported)))
  ]); }

  Widget _settings()=> const Center(child: Text("Settings (Coming Soon)", style: TextStyle(fontSize:18)));

  @override
  Widget build(BuildContext context) {
    final pages = [_list(complaints), _list(reported, isReported:true), _settings()];
    return Scaffold(appBar: AppBar(title: const Text("Civil Works Complaints"), backgroundColor: Colors.grey, centerTitle:true, leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: ()=> Navigator.pop(context))), body: pages[selectedIndex], bottomNavigationBar: BottomNavigationBar(currentIndex:selectedIndex, onTap:(i)=> setState(()=> selectedIndex = i), selectedItemColor: Colors.grey, unselectedItemColor: Colors.grey[400], items: const [
      BottomNavigationBarItem(icon: Icon(Icons.report_problem), label:'Complaints'),
      BottomNavigationBarItem(icon: Icon(Icons.note_add), label:'Reported'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label:'Settings'),
    ]));
  }
}
