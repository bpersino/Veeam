# This script sets the RetainDays value for all jobs to 180 days.
#
# Author: Byron Persino
# Date: 2023-05-19
#
# Summary: This script Display the Retention Policy for Deleted Items

# Import the Veeam PowerShell snap-in
Import-Module VeeamPSSnapin

# Connect to the Veeam Backup & Replication server
Connect-VBRServer -Server "localhost"

# Get a list of all jobs
$jobs = Get-VBRJob

# Loop through the jobs
foreach($job in $jobs) {

        # Get the current RetainDays value
        $currentRetainDays = $job.GetOptions().BackupStorageOptions.RetainDays

        # Write the current RetainDays value to the console
        Write-Host "$($job.Name) -  Retention Policy for Deleted Items: $($currentRetainDays)"

    }

# Disconnect from the Veeam Backup & Replication server
Disconnect-VBRServer
