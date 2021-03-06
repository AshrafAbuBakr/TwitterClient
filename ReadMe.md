# Twitter Client Task
    BY: Ashraf Hussein Mahmoud Abu Bakr
    Written using Swift, Xcode 9.2

### Installation and Dependencies:
    - This project uses cocoapods to handle dependencies, So a "pod install" is needed before running the code.
    - Pods Used: 
        - TwitterKit
	    - XLPagerTabStrip
	    - ObjectMapper
	    - Kingfisher
	    - BFKit-Swift
	    - RealmSwift
	    - ObjectMapper+Realm
	    - ReachabilitySwift
	    - NVActivityIndicatorView

### Git:
    - This project uses the standard gitflow.

### Architecture & Design:
    - The project is follows the MVP design pattern.
    - Each Viewcontroller has a presenter and a service. EX: (FollowersListViewController, FollowersListPresenter, FollowersListService).
    - I chose this pattern as it's more testable than MVC and in the same time it does not consume much time for development.

### Local Caching:
    - Local caching is done using Realm database instead of Coredata as it's a bit faster to do using Realm considering the limited time.

### TODOs:
    - Unit Testing: Unfortunately I did not have the time to do some unit testing for the project, I would like to keep working on it and send it later if possible.
    - I've done some code commenting after I wrote the project, Ideally this should be done during development.
    - Error Handling: Error handling needs some work to handle all the errors retreived from TwitterKit, I would like to keep working on it and send it later if possible.
    - Infinite loading: Unfortunately I did not have much followers so I couldn't test the infinite loading feature,
        I preferred to remove it rather than sending a feture that has never been tested.
    - Use a constants file.
    






