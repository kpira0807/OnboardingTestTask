import Foundation
import UIKit

class ChatOnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ChatOnboardingCollectionViewCell.self)
    
    private let informationView = Information2View()
    private let rightView = UIView()
    private let leftView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ onboardingCellViewModel: OnboardingCellViewModel) {
        informationView.apply(with: Information2View.Configuration(chatText: onboardingCellViewModel.informationTitle ?? "", backgroundChat: onboardingCellViewModel.chatBackgroundColor ?? .white, informationText: onboardingCellViewModel.informationText ?? "", informationName: onboardingCellViewModel.titleNameText, informationSub: onboardingCellViewModel.titleSubText))
    }
    
    func setupView() {
        addSubview(informationView)
        informationView.accessibilityIdentifier = "informationView"
        informationView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(31.0)
            make.trailing.equalToSuperview().inset(31.0)
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
        
        addSubview(leftView)
        leftView.accessibilityIdentifier = "leftView"
        leftView.backgroundColor = Asset.backgroundViewColor.color.withAlphaComponent(0.24)
        leftView.layer.cornerRadius = 20
        leftView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalTo(informationView.snp.leading).offset(-16.0)
            make.width.equalTo(315.0)
        }
    }
    
}
