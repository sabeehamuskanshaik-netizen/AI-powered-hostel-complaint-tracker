// import 'package:flutter/material.dart';

// class ChiefWardenLHPage extends StatefulWidget {
//   const ChiefWardenLHPage({super.key});

//   @override
//   State<ChiefWardenLHPage> createState() => _ChiefWardenLHPageState();
// }

// class _ChiefWardenLHPageState extends State<ChiefWardenLHPage> {
//   int selectedIndex = 0;
//   String selectedBlock = 'All';
//   Map<int, bool> expandedMap = <int, bool>{};

//   // 🧾 LH Complaints Data
//   final List<Map<String, dynamic>> complaints = [
//     {
//       'block': 'LH1',
//       'email': 'john@vitstudent.ac.in',
//       'regNo': '22BCE1001',
//       'place': 'LH1 Room 101',
//       'status': 'Pending',
//       'filedDate': '2025-10-20',
//       'description': 'Light not working in the room.'
//     },
//     {
//       'block': 'LH2',
//       'email': 'mary@vitstudent.ac.in',
//       'regNo': '22BCE1022',
//       'place': 'LH2 Room 203',
//       'status': 'In Progress',
//       'filedDate': '2025-10-21',
//       'description': 'Fan making noise while running.'
//     },
//     {
//       'block': 'LH3',
//       'email': 'kiran@vitstudent.ac.in',
//       'regNo': '22BCE1111',
//       'place': 'LH3 Room 111',
//       'status': 'Pending',
//       'filedDate': '2025-10-23',
//       'description': 'Switchboard broken near bed.'
//     },
//   ];

//   // 🧾 Reported Data
//   final List<Map<String, dynamic>> reported = [
//     {
//       'block': 'LH1',
//       'email': 'meena@vitstudent.ac.in',
//       'regNo': '22BCE1205',
//       'place': 'LH1 Room 102',
//       'status': 'Reported',
//       'filedDate': '2025-10-25',
//       'description': 'Reported light fuse issue.'
//     },
//   ];

//   // Filter function
//   List<Map<String, dynamic>> filterByBlock(List<Map<String, dynamic>> list) {
//     if (selectedBlock == 'All') return list;
//     return list.where((c) => c['block'] == selectedBlock).toList();
//   }

//   Widget _buildComplaintList(List<Map<String, dynamic>> list) {
//     final filtered = filterByBlock(list);
//     return Column(
//       children: [
//         const SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("Filter by Block:  ",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             DropdownButton<String>(
//               value: selectedBlock,
//               items: ['All', 'LH1', 'LH2', 'LH3']
//                   .map((b) => DropdownMenuItem(value: b, child: Text(b)))
//                   .toList(),
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
//                   leading: const Icon(Icons.apartment, color: Colors.orange),
//                   title: Text(c['description'],
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16)),
//                   subtitle: Text("Block: ${c['block']}"),
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _buildDetailRow("Reg No", c['regNo']),
//                           _buildDetailRow("Place", c['place']),
//                           _buildDetailRow("Status", c['status']),
//                           _buildDetailRow("Filed Date", c['filedDate']),
//                           _buildDetailRow("Description", c['description']),
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

//   Widget _buildDetailRow(String label, String value) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 3),
//         child: Row(
//           children: [
//             SizedBox(
//                 width: 110,
//                 child: Text("$label:",
//                     style: const TextStyle(fontWeight: FontWeight.bold))),
//             Expanded(child: Text(value)),
//           ],
//         ),
//       );

//   Widget _buildSettings() => const Center(
//         child: Text("Settings (Coming Soon)",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//       );

//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       _buildComplaintList(complaints),
//       _buildComplaintList(reported),
//       _buildSettings(),
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Chief Warden - LH Blocks"),
//         centerTitle: true,
//         backgroundColor: Colors.orange,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: pages[selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         onTap: (index) => setState(() => selectedIndex = index),
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.report_problem), label: "Complaints"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.note_alt_outlined), label: "Reported"),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
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

class ChiefWardenLHPage extends StatefulWidget {
  const ChiefWardenLHPage({super.key});

  @override
  State<ChiefWardenLHPage> createState() => _ChiefWardenLHPageState();
}

class _ChiefWardenLHPageState extends State<ChiefWardenLHPage> {
  int selectedIndex = 0;
  String selectedBlock = 'All';
  bool isLoading = true;
  final storage = const FlutterSecureStorage();

  List<Map<String, dynamic>> complaints = [];
  List<Map<String, dynamic>> reported = [];

  /// 🧾 Fetch complaints from backend (Chief Warden - LH)
  Future<void> fetchComplaints() async {
    setState(() => isLoading = true);

    try {
      final token = await storage.read(key: 'jwt_token');
      if (token == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Authentication token missing")),
        );
        return;
      }

      // 👉 Replace with your actual backend URL
      const String url = 'https://10.0.2.2:5000/api/complaints';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List all = List<Map<String, dynamic>>.from(data['complaints']);

        // Separate reported vs normal complaints
        final pendingComplaints = all.where((c) => c['reported'] != true).toList();
        final reportedComplaints = all.where((c) => c['reported'] == true).toList();

        setState(() {
          complaints = List<Map<String, dynamic>>.from(pendingComplaints);
          reported = List<Map<String, dynamic>>.from(reportedComplaints);
        });
      } else {
        debugPrint('Error fetching complaints: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching complaints: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchComplaints();
  }

  /// Filter by block
  List<Map<String, dynamic>> filterByBlock(List<Map<String, dynamic>> list) {
    if (selectedBlock == 'All') return list;
    return list.where((c) => c['block'] == selectedBlock).toList();
  }

  Widget _buildComplaintList(List<Map<String, dynamic>> list) {
    final filtered = filterByBlock(list);

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (filtered.isEmpty) {
      return const Center(
        child: Text("No complaints found.",
            style: TextStyle(fontSize: 16, color: Colors.grey)),
      );
    }

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Filter by Block:  ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedBlock,
              items: ['All', 'LH1', 'LH2', 'LH3']
                  .map((b) => DropdownMenuItem(value: b, child: Text(b)))
                  .toList(),
              onChanged: (value) => setState(() => selectedBlock = value!),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: RefreshIndicator(
            onRefresh: fetchComplaints,
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final c = filtered[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ExpansionTile(
                    leading: const Icon(Icons.apartment, color: Colors.orange),
                    title: Text(
                      c['title'] ?? 'No title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text("Block: ${c['block'] ?? 'N/A'}"),
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDetailRow("Student", c['user']?['fullName'] ?? 'N/A'),
                            _buildDetailRow("Email", c['user']?['email'] ?? 'N/A'),
                            _buildDetailRow("Reg No", c['regNo'] ?? 'N/A'),
                            _buildDetailRow("Place", c['place'] ?? 'N/A'),
                            _buildDetailRow("Status", c['status'] ?? 'N/A'),
                            _buildDetailRow("Filed Date",
                                (c['createdAt'] ?? '').toString().substring(0, 10)),
                            _buildDetailRow("Description", c['description'] ?? 'N/A'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            SizedBox(
              width: 110,
              child: Text(
                "$label:",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: Text(value)),
          ],
        ),
      );

  Widget _buildSettings() => const Center(
        child: Text(
          "Settings (Coming Soon)",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildComplaintList(complaints),
      _buildComplaintList(reported),
      _buildSettings(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chief Warden - LH Blocks"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.report_problem), label: "Complaints"),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_outlined), label: "Reported"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
