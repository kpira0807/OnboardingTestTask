import Foundation
import UIKit

final class OnboardingCellViewModel {

    let chatBackgroundColor: UIColor?
    let informationTitle: String?
    let informationText: String?
    let titleNameText: String
    let titleSubText: String
    let informationImage: UIImage?
    
    init(
        chatBackgroundColor: UIColor?,
        informationTitle: String?,
        informationText: String?,
        titleNameText: String,
        titleSubText: String,
        informationImage: UIImage?
    ) {
        self.chatBackgroundColor = chatBackgroundColor
        self.informationTitle = informationTitle
        self.informationText = informationText
        self.titleNameText = titleNameText
        self.titleSubText = titleSubText
        self.informationImage = informationImage
    }
    
}
