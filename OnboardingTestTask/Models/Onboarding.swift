import Foundation
import UIKit

struct OnboardingTitle {
    
    let title: String
    let subtitle: String
    
}

struct InformationDetails {
    
    let backgroundColorView: UIColor?
    let title: String?
    let details: String?
    let image: UIImage?
    
}


struct Onboadring {

    let onboardingTitle: OnboardingTitle
    let informationDetails: InformationDetails
  
}
