## **Install-OpenSSH**
> #### **Region for ExecutionPolicy**
> - *The script above first gets the execution policy of the current PowerShell session.*
> 
> - *Then checks if it is set to Unrestricted.*
> 
> - *`If` it is set, then skips and echos a message to the screen.*
>
> - *`Else` it sets the execution policy to Unrestricted.*
> ---
> #### **Region for Installing OpenSSH**
> 
> - *First gets a version of OpenSSH from Microsoft's GitHub repository and saves it in TEMP folder on the Target Node.*
> - *Then unzips it to ProgramFiles Folder.*
> - *Next OpenSSH is installed.*
> - *Finally the file downloaded from the GitHub Repo in the TEMP folder is deleted.*
> ---
[![SERVERTRIBE](https://www.servertribe.com/wp-content/themes/mars/assets/images/attune_logo.svg)](https://www.servertribe.com/)
***&copy;2021 Powered by ServerTribe***