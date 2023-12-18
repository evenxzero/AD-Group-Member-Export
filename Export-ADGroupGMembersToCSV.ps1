# Get all AD groups
$groups = Get-ADGroup -Filter *

# Prepare an array to hold all results
$results = @()

# Initialize counters
$totalGroups = $groups.Count
$currentGroup = 0
$totalRecords = 0

# Get the directory of the script
$scriptDirectory = $PSScriptRoot
Write-Host "Script Directory: $scriptDirectory"

# Iterate over each group and get members
foreach ($group in $groups) {
    # Update group progress
    $currentGroup++
    Write-Progress -Activity "Processing Groups" -Status "Processing Group $currentGroup of $totalGroups" -PercentComplete (($currentGroup / $totalGroups) * 100)

    # Get members who are users
    $groupMembers = Get-ADGroupMember $group | 
                    Where-Object {$_.objectclass -eq "user"}

    # Iterate over each user and get their department
    foreach ($member in $groupMembers) {
        try {
            $user = Get-ADUser $member -Property Department
            $results += [PSCustomObject]@{
                GroupName = $group.Name
                Department = $user.Department
                'Username' = $user.SamAccountName
                Name = $user.Name
            }
            $totalRecords++
        } catch {
            Write-Warning "Unable to find user for identity: $member"
        }
    }
}

# Construct CSV file path
$csvPath = Join-Path -Path $scriptDirectory -ChildPath "ADGroupG_Members_Departments_StaffIDs.csv"
Write-Host "CSV will be saved at: $csvPath"

# Export results to CSV
try {
    $results | Export-Csv -Path $csvPath -NoTypeInformation
    Write-Host "CSV file saved successfully."
} catch {
    Write-Error "Error in saving CSV file: $_"
}

# Display the final counts
Write-Host "Processing Complete. Total Groups: $totalGroups, Total Records Processed: $totalRecords"
