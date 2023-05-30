import Swinject
import UIKit

final class OnboardingAssembly: Assembly {
    
    private let parent: NavigationNode
    
    init(_ parent: NavigationNode) {
        self.parent = parent
    }
    
    func assemble(container: Container) {
        container.register(OnboardingControllerView.self) { _ in
            let model = OnboardingModel()
            let viewModel = OnboardingViewModel(model: model)
            let controller = OnboardingControllerView(viewModel: viewModel)
            
            return controller
        }.inObjectScope(.transient)
    }
    
}
