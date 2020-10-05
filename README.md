# iOS Base Project Lite v1.0

## About
A simple yet opinionated base project for iOS apps. I made this so that I could get an extra 2 hours of sleep during 24 hour hackathons. This bad boy also comes with `.xcschemes` and `.xconfig` files for development, staging, & production environments.

Pods used:
- Moya/RxSwift
- KeychainSwift
- IQKeyboardManager
- Kingfisher (4.10.0)
- PopupDialog
- RxCocoa
- SnapKit

## Requirements

- Xcode 11 or above

- CocoaPods

- A bit of knowledge when it comes to Schemes and Configurations

## Installation

1. Quit Xcode

2. Paste and run this on your terminal:

	```
	cd ~/Downloads
	git clone https://github.com/markrufino/ios-base-ios-project-lite.git
	cd ios-base-ios-project-lite
	sh ./install.sh
	cd ..
	rm -rf ios-base-project-lite
	```

## Usage

1. When creating a new project, scroll down to the "Project Templates" during template selection and select "iOS Base Project Lite".

2. On your Xcode:

	```
	1. Navigate to Project > Info > Configurations
	
	2. Replace the default configurations (Debug and Release) with the following:
		- Staging (based on Debug)
		- Development (based on Debug)
		- Production (based on Release)
	
	3. Clicking on the "No Configurations Set", apply the appropriate configurations.
	
	4. Update your Schemes to match the new configurations
	
	5. Run "Pod Install" and update the outdated base files if necessary.
	
	```

3. Run "pod install"

4. Delete ".gitkeep" files

5. Edit the schemes on the upper right corner, just change their build configurations to the correct one. (You'll initially find either "Debug" or "Relase")

6. Set the "Launch Screen File" to LaunchScreen.xib

## ToDo

1. Add bitrise perhaps.

1. Add a UIView+.swift file!


## Changelogs

**• 08-29-2020 - 1.0**

 - Trimmed internal references and moved to GitHub

 
## License

• MIT

## References

**Guide To Organizing Your iOS Debug, Development, and Release States With .xcconfig Files** - https://hackernoon.com/a-cleaner-way-to-organize-your-ios-debug-development-and-release-distributions-6b5eb6a48356
