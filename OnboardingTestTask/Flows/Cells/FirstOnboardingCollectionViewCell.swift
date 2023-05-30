import Foundation
import UIKit

class FirstOnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: FirstOnboardingCollectionViewCell.self)
    
    private let informationView = InformationView()
    private let rightView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ onboardingCellViewModel: OnboardingCellViewModel) {
        informationView.apply(with: InformationView.Configuration(introductionName: onboardingCellViewModel.informationTitle ?? "", introductionText: onboardingCellViewModel.informationText ?? "", informationName: onboardingCellViewModel.titleNameText, informationSub: onboardingCellViewModel.titleSubText))
    }
    
    func setupView() {
        addSubview(informationView)
        informationView.accessibilityIdentifier = "informationView"
        informationView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(31.0)
            make.centerX.equalToSuperview()
        }
        
        addSubview(rightView)
        rightView.accessibilityIdentifier = "rightView"
        rightView.backgroundColor = Asset.backgroundViewColor.color.withAlphaComponent(0.24)
        rightView.layer.cornerRadius = 20
        rightView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(informationView.snp.trailing).offset(16.0)
            make.width.equalTo(315.0)
        }
    }
    
}
