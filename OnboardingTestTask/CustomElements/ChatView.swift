import Foundation
import UIKit
import SnapKit

final class ChatView: NiblessView {
    
    private let iconImageView = UIImageView()
    private let iconView = UIView()
    private let textLabel = UILabel()
    
    override init() {
        super.init()
        
        setupView()
    }
    
    func apply(_ chatText: String, _ backgroundChat: UIColor) {
        textLabel.text = chatText
        textLabel.textColor = .white
        textLabel.font = UIFont(name: "SFProText-Bold", size: 15.0)
        
        backgroundColor = backgroundChat
    }
    
}

extension ChatView {
    
    private func setupView() {
        // backgroundColor = Asset.chatBlue.color
        layer.cornerRadius = 15.2
        layer.shadowColor = Asset.chatBlue.color.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 17.1
        
        addSubview(iconView)
        iconView.accessibilityIdentifier = "iconView"
        iconView.layer.cornerRadius = 16.8
        iconView.backgroundColor = .white.withAlphaComponent(0.1)
        iconView.snp.makeConstraints{ make in
            make.height.equalTo(33.61)
            make.width.equalTo(33.61)
            make.top.equalToSuperview().offset(10.57)
            make.leading.equalToSuperview().inset(10.57)
        }
        
        iconView.addSubview(iconImageView)
        iconImageView.accessibilityIdentifier = "iconImageView"
        iconImageView.image = UIImage(named: "person.crop.circle")
        iconView.tintColor = .orange
        iconImageView.snp.makeConstraints{ make in
            make.height.equalTo(19.0)
            make.width.equalTo(19.0)
            make.center.equalToSuperview()
        }
        
        addSubview(textLabel)
        textLabel.accessibilityIdentifier = "textLabel"
        textLabel.numberOfLines = 0
        textLabel.snp.makeConstraints{make in
            make.top.equalTo(iconView.snp.bottom).offset(9.12)
            make.leading.equalToSuperview().offset(10.57)
            make.trailing.equalToSuperview().inset(10.57)
            make.bottom.equalToSuperview().inset(10.57)
            
        }
    }
    
}
