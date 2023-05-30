import Foundation
import UIKit
import SnapKit

final class DetailinfoView: NiblessView {
    
    private let iconImageView = UIImageView()
    private let iconView = UIView()
    private let informationLabel = UILabel()
    
    override init() {
        super.init()
        
        setupView()
    }
    
    func apply(_ informationText: String) {
        informationLabel.text = informationText
        informationLabel.textColor = .white
        informationLabel.font = UIFont(name: "SFProText-Bold", size: 15.0)
    }
    
}

extension DetailinfoView {
    
    private func setupView() {
        addSubview(iconView)
        iconView.accessibilityIdentifier = "iconView"
        iconView.layer.cornerRadius = 17.01
        iconView.backgroundColor = .white.withAlphaComponent(0.1)
        iconView.snp.makeConstraints{ make in
            make.height.equalTo(33.26)
            make.width.equalTo(33.26)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        iconView.addSubview(iconImageView)
        iconImageView.accessibilityIdentifier = "iconImageView"
        iconImageView.image = UIImage(named: "timelapse")
        iconImageView.snp.makeConstraints{ make in
            make.height.equalTo(20.91)
            make.width.equalTo(20.91)
            make.center.equalToSuperview()
        }
        
        addSubview(informationLabel)
        informationLabel.accessibilityIdentifier = "informationLabel"
        informationLabel.numberOfLines = 0
        informationLabel.lineBreakMode = .byWordWrapping
        informationLabel.snp.makeConstraints{make in
            make.top.equalTo(iconView.snp.bottom).offset(5.23)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
