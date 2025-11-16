import 'package:flutter/material.dart';

class CtsPage extends StatefulWidget {
  const CtsPage({super.key});

  @override
  State<CtsPage> createState() => _CtsPage();
}

class _CtsPage extends State<CtsPage> {
  int selectedIndex = 0;
  String selectedBlock = 'All';

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
      'block': 'LH2',
      'email': 'mary@vitstudent.ac.in',
      'regNo': '22BCE1022',
      'place': 'LH2 Room 203',
      'status': 'In Progress',
      'filedDate': '2025-10-21',
      'description': 'Router malfunctioning.'
    },
    {
      'block': 'MH5',
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
      'block': 'LH3',
      'email': 'kiran@vitstudent.ac.in',
      'regNo': '22BCE1111',
      'place': 'LH3 Room 111',
      'status': 'Resolved',
      'filedDate': '2025-10-23',
      'description': 'Wi-Fi keeps disconnecting..'
    },
    {
      'block': 'MH4',
      'email': 'vijay@vitstudent.ac.in',
      'regNo': '22BCE1120',
      'place': 'MH4 Room 212',
      'status': 'Resolved',
      'filedDate': '2025-10-24',
      'description': 'Slow browsing or buffering.'
    },
  ];

  // Filter function
  List<Map<String, dynamic>> filterByBlock(List<Map<String, dynamic>> list) {
    if (selectedBlock == 'All') return list;
    return list.where((c) => c['block'] == selectedBlock).toList();
  }

  // Reusable Complaint UI
  Widget _buildComplaintList(List<Map<String, dynamic>> list) {
    final filtered = filterByBlock(list);
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Filter by Block: ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedBlock,
              items: [
                'All',
                'LH1', 'LH2', 'LH3',
                'MH1', 'MH2', 'MH3', 'MH4', 'MH5', 'MH6', 'MH7'
              ].map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
              onChanged: (value) {
                setState(() => selectedBlock = value!);
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final c = filtered[index];
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
                  tilePadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
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
                          // Icon(
                          //   Icons.campaign, color: Colors.red[400],
                          // ),
                          Text("📢 Reported Complaint",
                              style: TextStyle(
                                  fontSize: 13,
                                  
                                   color: Colors.red)),
                                   SizedBox(height: 5),
                          //_buildDetailRow("Email", c['email']),
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
        title: const Text("Wifi Complaints"),
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