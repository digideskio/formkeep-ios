import UIKit

protocol ViewControllerContainer {
    var containerView: UIView! { get }
}

extension ViewControllerContainer where Self: UIViewController {
    func remove(vc: UIViewController) {
        vc.willMoveToParentViewController(.None)
        vc.view.removeFromSuperview()
        vc.removeFromParentViewController()
    }
    
    func show(vc: UIViewController) {
        addChildViewController(vc)
        vc.view.frame = containerView.bounds
        containerView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
    }
}