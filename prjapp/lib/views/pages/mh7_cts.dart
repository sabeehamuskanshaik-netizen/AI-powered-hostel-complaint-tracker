// import 'package:flutter/material.dart';

// class Mh7Cts extends StatefulWidget {
//   const Mh7Cts({super.key});

//   @override
//   State<Mh7Cts> createState() => _Mh7CtsPage();
// }

// class _Mh7CtsPage extends State<Mh7Cts> {
//   int selectedIndex = 0;

//   // Expanded tiles state
//   Map<int, bool> expandedMap = <int, bool>{};

//   // 🧾 Complaints Data
//   final List<Map<String, dynamic>> complaints = [
//     {
//       'block': 'MH7',
//       'email': 'john@vitstudent.ac.in',
//       'regNo': '22BCE1001',
//       'place': 'MH7 Room 101',
//       'status': 'Pending',
//       'filedDate': '2025-10-20',
//       'description': 'Wifi not connecting.'
//     },
//     {
//       'block': 'MH7',
//       'email': 'mary@vitstudent.ac.in',
//       'regNo': '22BCE1022',
//       'place': 'MH7 Room 203',
//       'status': 'In Progress',
//       'filedDate': '2025-10-21',
//       'description': 'Router malfunctioning.'
//     },
//     {
//       'block': 'MH7',
//       'email': 'rahul@vitstudent.ac.in',
//       'regNo': '22BCE1105',
//       'place': 'MH7 Room 210',
//       'status': 'Pending',
//       'filedDate': '2025-10-22',
//       'description': 'Slow Network.'
//     },
//   ];

//   // 🧾 Reported Data
//   final List<Map<String, dynamic>> reported = [
//     {
//       'block': 'MH7',
//       'email': 'kiran@vitstudent.ac.in',
//       'regNo': '22BCE1111',
//       'place': 'MH7 Room 111',
//       'status': 'Resolved',
//       'filedDate': '2025-10-23',
//       'description': 'Wi-Fi keeps disconnecting..'
//     },
//     {
//       'block': 'MH7',
//       'email': 'vijay@vitstudent.ac.in',
//       'regNo': '22BCE1120',
//       'place': 'MH7 Room 212',
//       'status': 'Resolved',
//       'filedDate': '2025-10-24',
//       'description': 'Slow browsing or buffering.'
//     },
//   ];

//   // Reusable Complaint UI (no filters)
//   Widget _buildComplaintList(List<Map<String, dynamic>> list) {
//     return Column(
//       children: [
//         const SizedBox(height: 10),
//         Expanded(
//           child: ListView.builder(
//             itemCount: list.length,
//             itemBuilder: (context, index) {
//               final c = list[index];
//               final isExpanded = expandedMap[index] ?? false;

//               return Container(
//                 margin:
//                     const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
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
//                   leading: const Icon(Icons.wifi, color: Colors.orange),
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
//                           horizontal: 16, vertical: 0),
//                       alignment: Alignment.centerLeft,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
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

//   // ⚙ Settings Placeholder
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
//       _buildComplaintList(reported),
//       _buildSettings(),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Wifi Complaints-MH7"),
//         backgroundColor: Colors.orange,
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
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.report_problem),
//             label: 'Complaints',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.note_alt_outlined),
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
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Mh7Cts extends StatefulWidget {
  const Mh7Cts({super.key});

  @override
  State<Mh7Cts> createState() => _Mh7CtsPage();
}

class _Mh7CtsPage extends State<Mh7Cts> {
  int selectedIndex = 0;
  Map<int, bool> expandedMap = <int, bool>{};

  // 🧾 Complaints Data
  final List<Map<String, dynamic>> complaints = [
    {
      'block': 'MH7',
      'email': 'john@vitstudent.ac.in',
      'regNo': '22BCE1001',
      'place': 'MH7 Room 101',
      'status': 'Pending',
      'filedDate': '2025-10-20',
      'description': 'Wifi not connecting.'
    },
    {
      'block': 'MH7',
      'email': 'mary@vitstudent.ac.in',
      'regNo': '22BCE1022',
      'place': 'MH7 Room 203',
      'status': 'In Progress',
      'filedDate': '2025-10-21',
      'description': 'Router malfunctioning.'
    },
    {
      'block': 'MH7',
      'email': 'rahul@vitstudent.ac.in',
      'regNo': '22BCE1105',
      'place': 'MH7 Room 210',
      'status': 'Pending',
      'filedDate': '2025-10-22',
      'description': 'Slow Network.'
    },
  ];

  // 🧾 Reported Data
  final List<Map<String, dynamic>> reported = [
    {
      'block': 'MH7',
      'email': 'kiran@vitstudent.ac.in',
      'regNo': '22BCE1111',
      'place': 'MH7 Room 111',
      'status': 'Resolved',
      'filedDate': '2025-10-23',
      'description': 'Wi-Fi keeps disconnecting..'
    },
    {
      'block': 'MH7',
      'email': 'vijay@vitstudent.ac.in',
      'regNo': '22BCE1120',
      'place': 'MH7 Room 212',
      'status': 'Resolved',
      'filedDate': '2025-10-24',
      'description': 'Slow browsing or buffering.'
    },
  ];

  // 🧩 Download complaints as PDF
  Future<void> _downloadComplaintsAsPdf() async {
    // Step 1: Ask for storage permission
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission denied')),
      );
      return;
    }

    // Step 2: Create PDF
    final pdf = pw.Document();
    final data = selectedIndex == 0 ? complaints : reported;

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Wifi Complaints - MH7',
                style: pw.TextStyle(
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              ...data.map((c) => pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 8),
                    padding: const pw.EdgeInsets.all(8),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(width: 0.5),
                      borderRadius: pw.BorderRadius.circular(5),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Reg No: ${c['regNo']}"),
                        pw.Text("Block: ${c['block']}"),
                        pw.Text("Place: ${c['place']}"),
                        pw.Text("Status: ${c['status']}"),
                        pw.Text("Filed Date: ${c['filedDate']}"),
                        pw.Text("Description: ${c['description']}"),
                      ],
                    ),
                  ))
            ],
          );
        },
      ),
    );

    // Step 3: Save to Downloads folder
    Directory? downloadsDir;
    if (Platform.isAndroid) {
      downloadsDir = Directory('/storage/emulated/0/Download');
    } else {
      downloadsDir = await getApplicationDocumentsDirectory();
    }

    final file = File(
      "${downloadsDir.path}/Wifi_Complaints_MH7_${DateTime.now().millisecondsSinceEpoch}.pdf",
    );

    await file.writeAsBytes(await pdf.save());

    // Step 4: Notify user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF saved to ${file.path}')),
    );
  }

  // 📋 Complaint List UI
  Widget _buildComplaintList(List<Map<String, dynamic>> list) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final c = list[index];
              final isExpanded = expandedMap[index] ?? false;

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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  tilePadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  onExpansionChanged: (expanded) {
                    setState(() => expandedMap[index] = expanded);
                  },
                  leading: const Icon(Icons.wifi, color: Colors.orange),
                  title: Text(
                    c['description'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text("Block: ${c['block']}"),
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow("Reg No          ", c['regNo']),
                          _buildDetailRow("Place             ", c['place']),
                          _buildDetailRow("Status            ", c['status']),
                          _buildDetailRow("Filed Date      ", c['filedDate']),
                          _buildDetailRow("Description    ", c['description']),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
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
  }

  // ⚙ Settings Placeholder
  Widget _buildSettings() {
    return const Center(
      child: Text(
        "Settings (Coming Soon)",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildComplaintList(complaints),
      _buildComplaintList(reported),
      _buildSettings(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wifi Complaints-MH7"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.white),
            tooltip: 'Download as PDF',
            onPressed: _downloadComplaintsAsPdf,
          ),
        ],
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.report_problem),
            label: 'Complaints',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: 'Reported',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}