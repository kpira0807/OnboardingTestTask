import UIKit
import Swinject

final class OnboardingCoordinator: NavigationNode {
    
    private weak var viewController: UIViewController?
    private var container: Container!
    
    override init(parent: NavigationNode?) {
        super.init(parent: parent)
        
        registerFlow()
        addHandlers()
    }
    
    private func registerFlow() {
        container = Container()
        
        OnboardingAssembly(self).assemble(container: container)
    }
    
    private func addHandlers() {
        // add Settings flow event handlers
    }
    
}

extension OnboardingCoordinator: Coordinator {
    
    func createFlow() -> UIViewController {
        let uiViewController = container.resolve(OnboardingControllerView.self)
        viewController = uiViewController
        
        
        return uiViewController!
    }
    
}
