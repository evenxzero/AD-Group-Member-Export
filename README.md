# Active Directory All Groups Member Exporter

This PowerShell script is designed for comprehensive extraction of member information from all Active Directory (AD) groups. It efficiently retrieves details such as department names, usernames, and full names of the group members, exporting this aggregated data into a CSV file.

## Features
- **Comprehensive Group Processing**: Extracts member information from all AD groups, providing a complete overview.
- **Detailed Member Insights**: Gathers essential details like department, username, and full name for each group member.
- **Progress Display**: Includes a progress bar to track the script's execution, enhancing the user experience.
- **CSV Output**: The data is exported into a CSV file named `ADGroupG_Members_Departments_StaffIDs.csv`, suitable for various administrative and auditing needs.

## Use Case
This script is ideal for IT administrators, system auditors, and support staff who require an exhaustive list of group memberships across the entire Active Directory. It simplifies data gathering for audits, reporting, or administrative tasks in environments with multiple AD groups.

## How to Use
1. Ensure you have the necessary AD module loaded and appropriate permissions in your PowerShell session.
2. Run the script.
3. The output CSV file will be saved in the script's directory, named `ADGroupG_Members_Departments_StaffIDs.csv`.

