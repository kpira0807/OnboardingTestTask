import Foundation
import UIKit
import SnapKit

final class Illustration1View: NiblessView {
    
    private let contentView = UIView()
    private let iconImageView = UIImageView()
    private let iconView = UIView()
    private let nameLabel = UILabel()
    private let introductionTextLabel = UILabel()
    
    override init() {
        super.init()
        
        setupView()
    }
    
    func apply(_ introductionName: String, _ introductionText: String) {
        nameLabel.text = introductionName
        nameLabel.font = UIFont.systemFont(ofSize: 20.0)
        nameLabel.font = UIFont(name: "SFProDisplay-Medium", size: 17.0)
        nameLabel.textColor = .white
        
        introductionTextLabel.text = introductionText
        introductionTextLabel.textColor = .white
        introductionTextLabel.font = UIFont(name: "SFProText-Regular", size: 14.0)
    }
}

extension Illustration1View {
    
    private func setupView() {
        addSubview(contentView)
        contentView.accessibilityIdentifier = "contentView"
        contentView.backgroundColor = Asset.backgroundViewColor.color.withAlphaComponent(0.24)
        contentView.layer.cornerRadius = 20
        contentView.addLeftBorder(with: (Asset.borderColor.color).withAlphaComponent(0.4), andWidth: 3.0)
        
        contentView.snp.makeConstraints{make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(12.0)
            make.bottom.equalToSuperview().inset(10.24)
        }
        
        contentView.addSubview(iconView)
        iconView.accessibilityIdentifier = "iconView"
        iconView.layer.cornerRadius = 17.01
        iconView.backgroundColor = .white.withAlphaComponent(0.1)
        iconView.snp.makeConstraints{ make in
            make.height.equalTo(34.02)
            make.width.equalTo(34.02)
            make.top.equalToSuperview().offset(18.7)
            make.leading.equalToSuperview().inset(26.7)
        }
        
        iconView.addSubview(iconImageView)
        iconImageView.accessibilityIdentifier = "iconImageView"
        iconImageView.image = UIImage(named: "timelapse")
        
        iconImageView.snp.makeConstraints{ make in
            make.height.equalTo(21.39)
            make.width.equalTo(21.39)
            make.center.equalToSuperview()
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.accessibilityIdentifier = "nameLabel"
        nameLabel.numberOfLines = 1
        nameLabel.snp.makeConstraints{ make in
            make.leading.equalTo(iconView.snp.trailing).offset(27.0)
            make.trailing.equalToSuperview().inset(26.7)
            make.centerY.equalTo(iconView.snp.centerY)
        }
        
        contentView.addSubview(introductionTextLabel)
        introductionTextLabel.accessibilityIdentifier = "introductionTextLabel"
        introductionTextLabel.numberOfLines = 0
        introductionTextLabel.snp.makeConstraints{make in
            make.top.equalTo(iconImageView.snp.bottom).offset(9.35)
            make.leading.equalToSuperview().offset(26.7)
            make.trailing.equalToSuperview().inset(26.7)
            make.bottom.equalToSuperview().inset(18.7)
        }
    }
    
}

extension UIView {
    
    func addLeftBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        addSubview(border)
    }
    
}
