# PhoneNumberFormatting
## For ensuring that all numbers start with +61 so that we can use Twilio and Amazon Connect. 

### Current Install URL for this Package:
https://login.salesforce.com/packaging/installPackage.apexp?p0=04tDn000000yrGZIAY

1. Browse to the above URL.
2. Log in to the Org that needs the Phone Number Formatting installed.
3. Follow the prompts
4. Enjoy your formatted phone numbers.



### Instructions on how to modify this code and create a new package with install URL

#### Note on why this package cannot be created using the "Package Manager" in Setup in the Salesforce UI:

The code in this package has dependencies on custom objects provided by Non Profit Service Pack (NPSP). You can use the Package Manager to create the package, and it will include the NPSP as a dependency. However, installation will fail if the version of NPSP installed does not match the version that this package was created against. I was unable to figure out how to create a flexible version dependency on NPSP for this package. Therefore, I resorted to using the "--orgdependent" flag, which is only available in the Salesforce CLI. This flag tells the package creation to ignore dependencies. This means that if you were to attempt to install this package against an Org without NPSP installed, it will fail with an error message saying that specific custom sObjects are missing. If the package were created without the "--orgdependent" flag, then the error message would list the specific sub-packages of NPSP that are missing.

#### Pre-requisites:

	This code is set up to be installed as an Unlocked Package. If you are unfamiliar with Unlocked Packages in Salesforce, completing this Trailhead Module would be a good introduction: https://trailhead.salesforce.com/content/learn/modules/unlocked-packages-for-customers/build-your-first-unlocked-package
	
	This package must be created using the Salesforce CLI, and it is best (and easiest) if you use Git to clone this code to your local computer.  If you are unfamiliar with Git and how to run SFDX commands from the terminal, this Trailmix is a good place to start: https://trailhead.salesforce.com/content/learn/trails/set-up-your-workspace-and-install-developer-tools

	You will need an Org with "Dev Hub" and "Unlocked Packages" enabled. This can be either a Developer Edition Org or a Trailhead Playground
		- Go to Setup->Dev Hub
		- Click the slider to the right of "Enable Dev Hub".
		- Scroll down and click the slider to the right of "Enable Unlocked Packages and Second-Generation Managed Packages".
		
	Your org will also need to have the Non Profit Service Pack (NPSP) installed. Instructions for that can be found in this Trailhead Module: https://trailhead.salesforce.com/content/learn/projects/install-nonprofit-success-pack-into-a-trailhead-playground


#### Steps
	Use Git to clone this repository to your local machine. 
		- If you are planning to make code changes that will then need to be merged back into main, fork this repository and clone that. You can make a pull request later
	 
    Make your desired changes to the code (if any) in your local repository.
	
    Create the Package. Run the following SFDX commands from your terminal window at the root of your cloned repo:
    ```
    sfdx force:package:create --name "Phone Number Formatting"--description "Apex classes and triggers to auto format Australian phone numbers for use with 3rd party tools." --packagetype Unlocked --path force-app --nonamespace  --orgdependent --targetdevhubusername <REPLACE_WITH_YOUR_USERNAME_OR_ORG_ALIAS>
    ```

    Create the Package Version.  Note that the last version number will be in the file sfdx-project.json in the root of your cloned repo:
    ```
    sfdx force:package:version:create -p PhoneNumberFormatting@<REPLACE_WITH_LAST_VERSION_NUMBER> -d force-app --wait 10 -x -v <REPLACE_WITH_YOUR_USERNAME_OR_ORG_ALIAS>
    ```
    Note the line in the output terminal that says:
    ``` 
    Package Installation URL: https://login.salesforce.com/packaging/installPackage.apexp?p0=XXXXXXXXXXXXXXXXXX"
	```
    Replace the URL at the top of the page with this URL. This is the install URL of the package you just created.
	
    Promote the Package Version. Without this command, you will not be able to install this package into actual production orgs.
    ```
    sfdx force:package:version:promote -p PhoneNumberFormatting@<REPLACE_WITH_LAST_VERSION_NUMBER>  -v <REPLACE_WITH_YOUR_USERNAME_OR_ORG_ALIAS>
	```

	If you made it this far, pat yourself on the back! Nice work!