# servCheck

A utility for testing and getting specs of servers automatically.  Includes an example script for printing the output to a remote printer and saving the output on a remote machine.

To run the script without user interaction, you will need:
* sudoers set to run dmidecode without a password

To run the entire system without user interaction, you will need:
* SSH keys set up between the drive and the print server
* Automatic login enabled (there's likely a workaround for now, but for this application, this is sufficient)
