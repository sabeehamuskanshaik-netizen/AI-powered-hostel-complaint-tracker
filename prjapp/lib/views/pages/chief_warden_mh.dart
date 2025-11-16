import 'package:flutter/material.dart';

class ChiefWardenMHPage extends StatefulWidget {
  const ChiefWardenMHPage({super.key});

  @override
  State<ChiefWardenMHPage> createState() => _ChiefWardenMHPageState();
}

class _ChiefWardenMHPageState extends State<ChiefWardenMHPage> {
  int selectedIndex = 0;
  String selectedBlock = 'All';
  Map<int, bool> expandedMap = <int, bool>{};

  final List<Map<String, dynamic>> complaints = [
    {
      'block': 'MH1',
      'email': 'raj@vitstudent.ac.in',
      'regNo': '22BCE2001',
      'place': 'MH1 Room 101',
      'status': 'Pending',
      'filedDate': '2025-10-20',
      'description': 'Tube light not working properly.'
    },
    {
      'block': 'MH4',
      'email': 'arun@vitstudent.ac.in',
      'regNo': '22BCE2022',
      'place': 'MH4 Room 203',
      'status': 'In Progress',
      'filedDate': '2025-10-21',
      'description': 'Fan not running at full speed.'
    },
    {
      'block': 'MH7',
      'email': 'suresh@vitstudent.ac.in',
      'regNo': '22BCE2105',
      'place': 'MH7 Room 210',
      'status': 'Pending',
      'filedDate': '2025-10-22',
      'description': 'Socket sparking near study table.'
    },
  ];

  final List<Map<String, dynamic>> reported = [
    {
      'block': 'MH2',
      'email': 'rohit@vitstudent.ac.in',
      'regNo': '22BCE2110',
      'place': 'MH2 Room 205',
      'status': 'Reported',
      'filedDate': '2025-10-25',
      'description': 'Reported issue of AC leakage.'
    },
  ];

  List<Map<String, dynamic>> filterByBlock(List<Map<String, dynamic>> list) {
    if (selectedBlock == 'All') return list;
    return list.where((c) => c['block'] == selectedBlock).toList();
  }

  Widget _buildComplaintList(List<Map<String, dynamic>> list) {
    final filtered = filterByBlock(list);
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Filter by Block:  ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: selectedBlock,
              items: [
                'All',
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
                  leading:
                      const Icon(Icons.apartment_rounded, color: Colors.orange),
                  title: Text(c['description'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Text("Block: ${c['block']}"),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow("Reg No", c['regNo']),
                          _buildDetailRow("Place", c['place']),
                          _buildDetailRow("Status", c['status']),
                          _buildDetailRow("Filed Date", c['filedDate']),
                          _buildDetailRow("Description", c['description']),
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

  Widget _buildDetailRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            SizedBox(
                width: 110,
                child: Text("$label:",
                    style: const TextStyle(fontWeight: FontWeight.bold))),
            Expanded(child: Text(value)),
          ],
        ),
      );

  Widget _buildSettings() => const Center(
        child: Text("Settings (Coming Soon)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
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
        title: const Text("Chief Warden - MH Blocks"),
        centerTitle: true,
        backgroundColor: Colors.orange,
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
              icon: Icon(Icons.report_problem), label: "Complaints"),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_outlined), label: "Reported"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
