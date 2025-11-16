// import 'package:flutter/material.dart';
// import 'service_page.dart';

// class GeyserPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ServicePage(title: 'Geyser', color: Colors.orange);
//   }
// }

// import 'package:flutter/material.dart';

// class GeyserPage extends StatefulWidget {
//   @override
//   _GeyserPageState createState() => _GeyserPageState();
// }

// class _GeyserPageState extends State<GeyserPage> {
//   String selectedBlock = 'All';

//   // Example complaint data
//   final List<Map<String, String>> allComplaints = [
//     {'block': 'LH1', 'text': 'Tube light not working in LH1 Room 201'},
//     {'block': 'LH2', 'text': 'Fan stopped in LH2 Room 112'},
//     {'block': 'LH3', 'text': 'Switchboard issue in LH3 Room 315'},
//     {'block': 'MH1', 'text': 'Power trip in MH1 Ground floor'},
//     {'block': 'MH2', 'text': 'Bulb fuse in MH2 corridor'},
//     {'block': 'MH3', 'text': 'Socket spark in MH3 Room 202'},
//     {'block': 'MH4', 'text': 'No current in MH4 block'},
//     {'block': 'MH5', 'text': 'Broken plug in MH5'},
//     {'block': 'MH6', 'text': 'Switch loose in MH6'},
//     {'block': 'MH7', 'text': 'Fan regulator issue in MH7'},
//   ];

//   List<Map<String, String>> get filteredComplaints {
//     if (selectedBlock == 'All') return allComplaints;
//     return allComplaints.where((c) => c['block'] == selectedBlock).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Geyser Complaints'),
//         centerTitle: true,
//         backgroundColor: Colors.orange,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // 🔽 Filter dropdown
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Filter by Block: ',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 DropdownButton<String>(
//                   value: selectedBlock,
//                   items: [
//                     'All',
//                     'LH1', 'LH2', 'LH3',
//                     'MH1', 'MH2', 'MH3', 'MH4', 'MH5', 'MH6', 'MH7'
//                   ]
//                       .map((b) => DropdownMenuItem(
//                             value: b,
//                             child: Text(b),
//                           ))
//                       .toList(),
//                   onChanged: (val) {
//                     setState(() => selectedBlock = val!);
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),

//             // 🧾 Complaints list
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filteredComplaints.length,
//                 itemBuilder: (context, index) {
//                   final complaint = filteredComplaints[index];
//                   return Card(
//                     elevation: 3,
//                     margin: const EdgeInsets.symmetric(vertical: 6),
//                     child: ListTile(
//                       leading: Icon(Icons.electric_bolt, color: Colors.orange),
//                       title: Text(
//                         complaint['text']!,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       subtitle: Text('Block: ${complaint['block']}'),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class GeyserPage extends StatefulWidget {
//   const GeyserPage({super.key});

//   @override
//   State<GeyserPage> createState() => _GeyserPageState();
// }

// class _GeyserPageState extends State<GeyserPage> {
//   int selectedIndex = 0;
//   String selectedBlock = 'All';
//   Map<int, bool> expandedMap = <int, bool>{};

//   // Complaints
//   final List<Map<String, dynamic>> complaints = [
//     {
//       'block': 'LH1',
//       'regNo': '22BCE1001',
//       'place': 'LH1 Room 201',
//       'status': 'Pending',
//       'filedDate': '2025-11-01',
//       'description': 'Geyser not heating properly.'
//     },
//     {
//       'block': 'MH3',
//       'regNo': '22BCE1050',
//       'place': 'MH3 Room 205',
//       'status': 'In Progress',
//       'filedDate': '2025-11-02',
//       'description': 'Water leakage near geyser pipe.'
//     },
//   ];

//   // Reported
//   final List<Map<String, dynamic>> reported = [
//     {
//       'block': 'LH2',
//       'regNo': '22BCE1088',
//       'place': 'LH2 Room 106',
//       'status': 'Reported',
//       'filedDate': '2025-11-03',
//       'description': 'Geyser switch not working.'
//     },
//     {
//       'block': 'MH1',
//       'regNo': '22BCE1099',
//       'place': 'MH1 Room 102',
//       'status': 'Reported',
//       'filedDate': '2025-11-04',
//       'description': 'No power supply to geyser.'
//     },
//   ];

//   // Filter function
//   List<Map<String, dynamic>> filterByBlock(List<Map<String, dynamic>> list) {
//     if (selectedBlock == 'All') return list;
//     return list.where((c) => c['block'] == selectedBlock).toList();
//   }

//   // Complaint UI
//   Widget _buildComplaintList(List<Map<String, dynamic>> list, {bool isReported = false}) {
//     final filtered = filterByBlock(list);
//     return Column(
//       children: [
//         const SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Filter by Block: ",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             DropdownButton<String>(
//               value: selectedBlock,
//               items: [
//                 'All',
//                 'LH1', 'LH2', 'LH3',
//                 'MH1', 'MH2', 'MH3', 'MH4', 'MH5', 'MH6', 'MH7'
//               ].map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
//               onChanged: (value) {
//                 setState(() => selectedBlock = value!);
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Expanded(
//           child: ListView.builder(
//             itemCount: filtered.length,
//             itemBuilder: (context, index) {
//               final c = filtered[index];
//               return Container(
//                 margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.08),
//                       blurRadius: 10,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: ExpansionTile(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   tilePadding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   onExpansionChanged: (expanded) {
//                     setState(() => expandedMap[index] = expanded);
//                   },
//                   leading: const Icon(Icons.water_drop, color: Colors.blue),
//                   title: Text(
//                     c['description'],
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   subtitle: Text("Block: ${c['block']}"),
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 10),
//                       alignment: Alignment.centerLeft,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           if (isReported)
//                             const Padding(
//                               padding: EdgeInsets.only(bottom: 6.0),
//                               child: Text(
//                                 "📢 Reported Complaint",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.redAccent,
//                                 ),
//                               ),
//                             ),
//                           _buildDetailRow("Reg No          ", c['regNo']),
//                           _buildDetailRow("Place             ", c['place']),
//                           _buildDetailRow("Status            ", c['status']),
//                           _buildDetailRow("Filed Date      ", c['filedDate']),
//                           _buildDetailRow("Description    ", c['description']),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 3),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 110,
//             child: Text(
//               "$label:",
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(child: Text(value)),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettings() {
//     return const Center(
//       child: Text(
//         "Settings (Coming Soon)",
//         style: TextStyle(fontSize: 18),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       _buildComplaintList(complaints),
//       _buildComplaintList(reported, isReported: true),
//       _buildSettings(),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Geyser Complaints"),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: pages[selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         onTap: (index) => setState(() => selectedIndex = index),
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.report_problem),
//             label: 'Complaints',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.note_add),
//             label: 'Reported',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GeyserPage extends StatefulWidget {
  const GeyserPage({super.key});

  @override
  State<GeyserPage> createState() => _GeyserPageState();
}

class _GeyserPageState extends State<GeyserPage> {
  int selectedIndex = 0;
  bool isLoading = true;

  List<Map<String, dynamic>> complaints = [];
  List<Map<String, dynamic>> reported = [];

  String selectedBlock = 'All';
  final List<String> allBlocks = [
    'All',
    'LH1', 'LH2', 'LH3',
    'MH1', 'MH2', 'MH3', 'MH4', 'MH5', 'MH6', 'MH7'
  ];

  /// 🧾 Fetch all geyser complaints
  Future<void> fetchComplaints() async {
    setState(() => isLoading = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Authentication token missing")),
        );
        return;
      }

      const String url = 'http://10.36.184.102:5000/api/complaints';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      debugPrint('📡 Status Code: ${response.statusCode}');
      debugPrint('📦 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final List allComplaints = (data is List)
            ? List<Map<String, dynamic>>.from(data)
            : List<Map<String, dynamic>>.from(data['complaints'] ?? []);

        // Only geyser complaints
        final geyserComplaints = allComplaints
            .where((c) =>
                (c['title'] ?? c['description'] ?? '')
                    .toString()
                    .toLowerCase()
                    .contains('geyser'))
            .toList();

        // Separate reported vs pending
        final pending = geyserComplaints.where((c) => c['reported'] != true).toList();
        final reportedList = geyserComplaints.where((c) => c['reported'] == true).toList();

        setState(() {
          complaints = List<Map<String, dynamic>>.from(pending);
          reported = List<Map<String, dynamic>>.from(reportedList);
        });
      } else {
        debugPrint('❌ Error fetching complaints: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('❌ Error fetching complaints: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  List<Map<String, dynamic>> filterByBlock(List<Map<String, dynamic>> list) {
    if (selectedBlock == 'All') return list;
    return list.where((c) => (c['block'] ?? '').toString().trim().toUpperCase() == selectedBlock).toList();
  }

  @override
  void initState() {
    super.initState();
    fetchComplaints();
  }

  Widget _buildTile(Map<String, dynamic> c, int index, {bool isReported = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)],
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: const Icon(Icons.water_drop, color: Color(0xFFFF3D00)),
        title: Text(
          c['title'] ?? c['description'] ?? 'No title',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Place: ${c['place'] ?? '-'} | Block: ${c['block'] ?? '-'}"),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isReported)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Text("📢 Reported Complaint",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
                  ),
                _detailRow("Email", c['user']?['email'] ?? c['email'] ?? '-'),
                _detailRow("Reg No", c['regNo'] ?? '-'),
                _detailRow("Status", c['status'] ?? '-'),
                _detailRow("Filed Date", (c['createdAt'] ?? c['filedDate'] ?? '-').toString().substring(0, 10)),
                _detailRow("Description", c['description'] ?? '-'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            SizedBox(width: 110, child: Text("$label:", style: const TextStyle(fontWeight: FontWeight.bold))),
            Expanded(child: Text(value)),
          ],
        ),
      );

  Widget _complaintsPage() {
    if (isLoading) return const Center(child: CircularProgressIndicator());

    final filtered = filterByBlock(complaints);
    if (filtered.isEmpty) return const Center(child: Text("No geyser complaints found."));

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Filter by Block: ", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: selectedBlock,
              items: allBlocks.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
              onChanged: (v) => setState(() => selectedBlock = v!),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: RefreshIndicator(
            onRefresh: fetchComplaints,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: filtered.length,
              itemBuilder: (context, i) => _buildTile(filtered[i], i),
            ),
          ),
        ),
      ],
    );
  }

  Widget _reportedPage() {
    if (isLoading) return const Center(child: CircularProgressIndicator());

    final filtered = filterByBlock(reported);
    if (filtered.isEmpty) return const Center(child: Text("No reported geyser complaints found."));

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Filter by Block: ", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: selectedBlock,
              items: allBlocks.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
              onChanged: (v) => setState(() => selectedBlock = v!),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: RefreshIndicator(
            onRefresh: fetchComplaints,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: filtered.length,
              itemBuilder: (context, i) => _buildTile(filtered[i], i, isReported: true),
            ),
          ),
        ),
      ],
    );
  }

  Widget _settingsPage() => const Center(child: Text("Settings (Coming Soon)"));

  @override
  Widget build(BuildContext context) {
    final pages = [_complaintsPage(), _reportedPage(), _settingsPage()];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geyser Complaints"),
        centerTitle: true,
        backgroundColor: Color(0xFFFF3D00),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Color(0xFFFF3D00),
        unselectedItemColor: Colors.black,
        onTap: (i) => setState(() => selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.report_problem), label: 'Complaints'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Reported'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
