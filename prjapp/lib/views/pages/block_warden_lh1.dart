// // file: lib/pages/block_warden_lh1.dart
// import 'package:flutter/material.dart';

// class BlockWardenLH1Page extends StatefulWidget {
//   const BlockWardenLH1Page({super.key});

//   @override
//   State<BlockWardenLH1Page> createState() => _BlockWardenLH1PageState();
// }

// class _BlockWardenLH1PageState extends State<BlockWardenLH1Page> {
//   int selectedIndex = 0;
//   Map<int, bool> expandedMap = <int, bool>{};

//   // same dummy complaints but block set to 'LH1'
//   final List<Map<String, dynamic>> complaints = [
//     {
//       'block': 'LH1',
//       'email': 'student1@vit.edu',
//       'regNo': '22BCE1001',
//       'place': 'LH1 Room 101',
//       'status': 'Pending',
//       'filedDate': '2025-10-20',
//       'description': 'Light not working in the room.'
//     },
//     {
//       'block': 'LH1',
//       'email': 'student2@vit.edu',
//       'regNo': '22BCE1002',
//       'place': 'LH1 Room 102',
//       'status': 'In Progress',
//       'filedDate': '2025-10-21',
//       'description': 'Fan making noise.'
//     },
//   ];

//   final List<Map<String, dynamic>> reported = [
//     {
//       'block': 'LH1',
//       'email': 'student3@vit.edu',
//       'regNo': '22BCE1003',
//       'place': 'LH1 Room 103',
//       'status': 'Reported',
//       'filedDate': '2025-11-01',
//       'description': 'Power socket not working.'
//     },
//   ];

//   Widget _buildTile(Map<String, dynamic> c, int index, {bool isReported = false}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)],
//       ),
//       child: ExpansionTile(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         leading: const Icon(Icons.apartment, color: Colors.orange),
//         onExpansionChanged: (expanded) => setState(() => expandedMap[index] = expanded),
//         title: Text(c['description'], maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text("Place: ${c['place']}"),
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               if (isReported)
//                 const Padding(
//                   padding: EdgeInsets.only(bottom: 6.0),
//                   child: Text("📢 Reported Complaint", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
//                 ),
//               _detailRow("Email", c['email'] ?? '-'),
//               _detailRow("Reg No", c['regNo'] ?? '-'),
//               _detailRow("Status", c['status'] ?? '-'),
//               _detailRow("Filed Date", c['filedDate'] ?? '-'),
//               _detailRow("Description", c['description'] ?? '-'),
//               const SizedBox(height: 6),
//               //Text(c['description'] ?? '-'),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _detailRow(String label, String value) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 2),
//         child: Row(children: [SizedBox(width: 110, child: Text("$label:", style: const TextStyle(fontWeight: FontWeight.bold))), Expanded(child: Text(value))]),
//       );

//   Widget _complaintsPage() {
//     return ListView.builder(
//       padding: const EdgeInsets.only(top: 12, bottom: 12),
//       itemCount: complaints.length,
//       itemBuilder: (context, i) => _buildTile(complaints[i], i),
//     );
//   }

//   Widget _reportedPage() {
//     return ListView.builder(
//       padding: const EdgeInsets.only(top: 12, bottom: 12),
//       itemCount: reported.length,
//       itemBuilder: (context, i) => _buildTile(reported[i], i, isReported: true),
//     );
//   }

//   Widget _settingsPage() => const Center(child: Text("Settings (Coming Soon)"));

//   @override
//   Widget build(BuildContext context) {
//     final pages = [_complaintsPage(), _reportedPage(), _settingsPage()];
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Block Warden - LH1"),
//         centerTitle: true,
//         backgroundColor: Colors.orange,
//         leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
//       ),
//       body: pages[selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.grey,
//         onTap: (i) => setState(() => selectedIndex = i),
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.report_problem), label: 'Complaints'),
//           BottomNavigationBarItem(icon: Icon(Icons.note_add), label: 'Reported'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BlockWardenLH1Page extends StatefulWidget {
  const BlockWardenLH1Page({super.key});

  @override
  State<BlockWardenLH1Page> createState() => _BlockWardenLH1PageState();
}

class _BlockWardenLH1PageState extends State<BlockWardenLH1Page> {
  int selectedIndex = 0;
  bool isLoading = true;
  //final storage = const FlutterSecureStorage();

  List<Map<String, dynamic>> complaints = [];
  List<Map<String, dynamic>> reported = [];

  /// 🧾 Fetch complaints for Block Warden - LH1
  Future<void> fetchComplaints() async {
  setState(() => isLoading = true);

  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // ✅ use the same key as login

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Authentication token missing")),
      );
      return;
    }

    // ⚙️ Use emulator or device IP
    const String url = 'http://10.36.184.102:5000/api/complaints';
    // Example for real Android device:
    // const String url = 'http://192.168.x.x:5000/api/complaints';

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

      // ✅ handle both array and object response shapes
      final List allComplaints = (data is List)
          ? List<Map<String, dynamic>>.from(data)
          : List<Map<String, dynamic>>.from(data['complaints'] ?? []);

      // ✅ normalize block name (handles lowercase / spaces)
      final blockComplaints = allComplaints
          .where((c) =>
              (c['block'] ?? '').toString().trim().toUpperCase() == 'LH1')
          .toList();

      // ✅ separate reported vs non-reported
      final pending =
          blockComplaints.where((c) => c['reported'] != true).toList();
      final reportedList =
          blockComplaints.where((c) => c['reported'] == true).toList();

      setState(() {
        complaints = List<Map<String, dynamic>>.from(pending);
        reported = List<Map<String, dynamic>>.from(reportedList);
      });

      debugPrint("✅ Loaded ${complaints.length} LH1 complaints");
      debugPrint("✅ Loaded ${reported.length} reported complaints");
    } else {
      debugPrint('Error fetching complaints: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('❌ Error fetching complaints: $e');
  } finally {
    setState(() => isLoading = false);
  }
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
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)
        ],
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: const Icon(Icons.apartment, color: Colors.orange),
        title: Text(
          c['title'] ?? c['description'] ?? 'No title',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Place: ${c['place'] ?? '-'}"),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isReported)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      "📢 Reported Complaint",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.redAccent),
                    ),
                  ),
                _detailRow("Email", c['user']?['email'] ?? c['email'] ?? '-'),
                _detailRow("Reg No", c['regNo'] ?? '-'),
                _detailRow("Status", c['status'] ?? '-'),
                _detailRow("Filed Date",
                    (c['createdAt'] ?? c['filedDate'] ?? '-').toString().substring(0, 10)),
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
            SizedBox(
              width: 110,
              child: Text("$label:",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(child: Text(value)),
          ],
        ),
      );

  Widget _complaintsPage() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (complaints.isEmpty) {
      return const Center(child: Text("No complaints found for LH1 block."));
    }
    return RefreshIndicator(
      onRefresh: fetchComplaints,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: complaints.length,
        itemBuilder: (context, i) => _buildTile(complaints[i], i),
      ),
    );
  }

  Widget _reportedPage() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (reported.isEmpty) {
      return const Center(child: Text("No reported complaints for LH1 block."));
    }
    return RefreshIndicator(
      onRefresh: fetchComplaints,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: reported.length,
        itemBuilder: (context, i) =>
            _buildTile(reported[i], i, isReported: true),
      ),
    );
  }

  Widget _settingsPage() =>
      const Center(child: Text("Settings (Coming Soon)"));

  @override
  Widget build(BuildContext context) {
    final pages = [_complaintsPage(), _reportedPage(), _settingsPage()];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Block Warden - LH1"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => selectedIndex = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.report_problem), label: 'Complaints'),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_add), label: 'Reported'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
