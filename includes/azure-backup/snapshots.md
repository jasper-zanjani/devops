Various types of [snapshot consistency](https://learn.microsoft.com/en-us/azure/backup/backup-azure-vms-introduction#snapshot-consistency):

-   **Application-consistent**: capture memory content and pending I/O operations.
-   **Filesystem-consistent**: capture all files at the same time
-   **Crash-consistent**: captures only data that exists on the disk, not in read/write cache
