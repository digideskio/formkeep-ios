import UIKit

class ApplicationViewController: UIViewController {    
    var activeViewController = UIViewController() {
        willSet { remove(activeViewController) }
        didSet { show(activeViewController) }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showInitialViewController()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

private extension ApplicationViewController {
    var mainFlow: UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle:  .None)
        return storyboard.instantiateInitialViewController()!
    }
    
    var authenticationFlow: UIViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: .None)
        return storyboard.instantiateInitialViewController()!
    }
}

private extension ApplicationViewController {
    func showInitialViewController() {
        activeViewController = currentlyAuthenticated()
            ? mainFlow
            : authenticationFlow
    }
}

extension ApplicationViewController: ViewControllerContainer {
    var containerView: UIView! {
        return view
    }
}