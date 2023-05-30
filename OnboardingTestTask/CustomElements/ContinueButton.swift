import Foundation
import UIKit
import SnapKit

final class ContinueButton: UIButton {
    
    private let nameLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ContinueButton {
    
    private func setupButton() {
        snp.makeConstraints{make in
            make.height.equalTo(56.0)
        }
        layer.cornerRadius = 28.0
        backgroundColor = .white
        
        nameLabel.accessibilityIdentifier = "nameLabel"
        nameLabel.text = L10n.ContinueButton.title
        nameLabel.font = UIFont(name: "SFProText-Medium", size: 17.0)
        nameLabel.textColor = Asset.continueButton.color
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints{make in
            make.center.equalToSuperview()
        }
        
    }
    
}
