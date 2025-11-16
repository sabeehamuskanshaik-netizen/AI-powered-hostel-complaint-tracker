import 'package:flutter/material.dart';

class Lh1Cts extends StatefulWidget {
  const Lh1Cts({super.key});

  @override
  State<Lh1Cts> createState() => _Lh1CtsPage();
}

class _Lh1CtsPage extends State<Lh1Cts> {
  int selectedIndex = 0;

  // Expanded tiles state
  Map<int, bool> expandedMap = <int, bool>{};

  // 🧾 Complaints Data
  final List<Map<String, dynamic>> complaints = [
    {
      'block': 'LH1',
      'email': 'john@vitstudent.ac.in',
      'regNo': '22BCE1001',
      'place': 'LH1 Room 101',
      'status': 'Pending',
      'filedDate': '2025-10-20',
      'description': 'Wifi not connecting.'
    },
    {
      'block': 'LH1',
      'email': 'mary@vitstudent.ac.in',
      'regNo': '22BCE1022',
      'place': 'LH2 Room 203',
      'status': 'In Progress',
      'filedDate': '2025-10-21',
      'description': 'Router malfunctioning.'
    },
    {
      'block': 'LH1',
      'email': 'rahul@vitstudent.ac.in',
      'regNo': '22BCE1105',
      'place': 'MH5 Room 210',
      'status': 'Pending',
      'filedDate': '2025-10-22',
      'description': 'Slow Network.'
    },
  ];

  // 🧾 Reported Data
  final List<Map<String, dynamic>> reported = [
    {
      'block': 'LH1',
      'email': 'kiran@vitstudent.ac.in',
      'regNo': '22BCE1111',
      'place': 'LH3 Room 111',
      'status': 'Resolved',
      'filedDate': '2025-10-23',
      'description': 'Wi-Fi keeps disconnecting..'
    },
    {
      'block': 'LH1',
      'email': 'vijay@vitstudent.ac.in',
      'regNo': '22BCE1120',
      'place': 'MH4 Room 212',
      'status': 'Resolved',
      'filedDate': '2025-10-24',
      'description': 'Slow browsing or buffering.'
    },
  ];

  // Reusable Complaint UI (no filters)
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
                margin:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
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
                          // Text("📢 Reported Complaint",
                          //     style: TextStyle(
                          //         fontSize: 13, color: Colors.red)),
                          // const SizedBox(height: 5),
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
        title: const Text("Wifi Complaints-LH1"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
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