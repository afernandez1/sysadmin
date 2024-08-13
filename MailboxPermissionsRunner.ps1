#This script prompts for a mailbox and a user and then removes
#the user's permissions from the mailbox and then re-adds the
#permissions without mapping the mailbox to Outlook

Connect-ExchangeOnline

#Prompt the user to enter email address
$mailbox = Read-Host "Enter mailbox address to be accessed"

#Prompt the user to enter email address
$username = Read-Host "Enter email address of user who needs access"

Remove-MailboxPermission -Identity $mailbox -User $username -AccessRights FullAccess

Add-MailboxPermission -Identity $mailbox -User $username -AccessRights FullAccess -AutoMapping $false

Disconnect-ExchangeOnline -Confirm:$false