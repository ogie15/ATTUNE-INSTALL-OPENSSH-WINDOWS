## **Set-OpenSSHFirewallRule**
> #### **Region for ExecutionPolicy**
> - *The script above first gets the execution policy of the current PowerShell session.*
> 
> - *Then checks if it is set to Unrestricted.*
> 
> - *`If` it is set, then skips and echos a message to the screen.*
>
> - *`Else` it sets the execution policy to Unrestricted.*
> ---
> #### **Region for Firewall Rule**
> 
> - *First checks if there is any existing Firewall rule for ssh.*
> - *`If` there is none then it creates one.*
> - *`Else` it does not create one and then echo a message to the screen.*
> ---
[![SERVERTRIBE](https://www.servertribe.com/wp-content/themes/mars/assets/images/attune_logo.svg)](https://www.servertribe.com/)
***&copy;2021 Powered by ServerTribe***