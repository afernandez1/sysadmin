#Use this script to delegate access to a mailbox without
#mapping the mailbox to Outlook.

#Connect to Exchange Online
Connect-ExchangeOnline

#Prompt the user for the mailbox address that will be accessed
$mailbox = Read-Host "Enter mailbox address that will be accessed:"

#Prompt the user for the email address of the user who needs access the mailbox
$username = Read-Host "Enter email address of the user who needs access:"

#Unmap the mailbox from Outlook by removing Full Access
Remove-MailboxPermission -Identity $mailbox -User $username -AccessRights FullAccess

#Delegate full access to the mailbox without mapping the mailbox to Outlook
Add-MailboxPermission -Identity $mailbox -User $username -AccessRights FullAccess -AutoMapping $false

#Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
