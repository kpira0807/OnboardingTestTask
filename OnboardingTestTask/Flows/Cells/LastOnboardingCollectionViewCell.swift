import Foundation
import UIKit

class LastOnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: LastOnboardingCollectionViewCell.self)
    
    private let information3View = Information3View()
    private let leftView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ onboardingCellViewModel: OnboardingCellViewModel) {
        information3View.apply(with: Information3View.Configuration(
            image: onboardingCellViewModel.informationImage!,
            informationName: onboardingCellViewModel.titleNameText,
            informationSub: onboardingCellViewModel.titleSubText))
    }
    
    func setupView() {
        addSubview(information3View)
        information3View.accessibilityIdentifier = "information3View"
        information3View.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(31.0)
            make.centerX.equalToSuperview()
        }

        addSubview(leftView)
        leftView.accessibilityIdentifier = "leftView"
        leftView.backgroundColor = Asset.backgroundViewColor.color.withAlphaComponent(0.24)
        leftView.layer.cornerRadius = 20
        leftView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalTo(information3View.snp.leading).offset(-16.0)
            make.width.equalTo(315.0)
        }
    }
    
}
