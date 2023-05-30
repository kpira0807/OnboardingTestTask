import Foundation

final class OnboardingViewModel {
    
    var cellViewModels: [OnboardingCellViewModel] = []
    
    private let model: OnboardingModel
    
    init(model: OnboardingModel) {
        self.model = model
        
        buildCellViewModels()
    }
    
    private func buildCellViewModels() {
        cellViewModels = model.onboardingDetails.map  { detail in
            OnboardingCellViewModel(
                chatBackgroundColor: detail.informationDetails.backgroundColorView,
                informationTitle: detail.informationDetails.title,
                informationText: detail.informationDetails.details,
                titleNameText: detail.onboardingTitle.title,
                titleSubText: detail.onboardingTitle.subtitle,
                informationImage: detail.informationDetails.image
            )
        }
    }
    
}
