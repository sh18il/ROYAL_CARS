import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('About')),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: const [
            Column(
              children: [
                Text('''Vehicle Management:
    
    Add new vehicles to the storage database.
    View detailed information about each vehicle, including make, model, year, mileage, VIN, and more.

    Edit and Update:
    
    Modify existing vehicle details such as mileage, ownership status, maintenance records, etc.
    Update information dynamically, ensuring accuracy and relevance.

    Delete Functionality:
    
    Remove vehicles from the database as needed.
    Confirm deletion to prevent accidental removal of data.

    Search and Filter:
    
    Search for specific vehicles based on make, model, year, or other criteria.
    Apply filters to quickly find vehicles that meet specific requirements.

    User Authentication:
    
    Secure user authentication to ensure only authorized users can access and manage vehicle data.
    Implement login/logout functionality to protect sensitive information.

    Data Storage with Hive Database:
    
    Utilize Hive for efficient data storage and retrieval.
    Benefit from fast querying and indexing capabilities, optimizing performance.

    Backup and Restore:
    
    Implement backup and restore features to prevent data loss.
    Enable users to restore previous versions of vehicle information if needed.

    User-Friendly Interface:
    
    Intuitive interface design for easy navigation and usage.
    Clearly labeled buttons and controls for adding, editing, and deleting vehicle information.

    Benefits:
    
    Efficient storage and management of vehicle data using the lightweight Hive database.
    Quick access to vehicle information, facilitating better organization and decision-making.
    Secure user authentication ensures data privacy and integrity.
    Streamlined editing, updating, and deletion of vehicle details, enhancing user experience.
    Backup and restore functionality for data protection and peace of mind.

    Conclusion:
    
    Our Careg Vehicle Storage App offers a robust solution for storing and managing vehicle information using the Hive database. With features for adding, editing, deleting, and updating vehicle details, along with user authentication and backup capabilities, our app provides a comprehensive solution for individuals or businesses needing to organize and maintain vehicle records efficiently.''')
              ],
            )
          ],
        ),
      ),
    );
  }
}
