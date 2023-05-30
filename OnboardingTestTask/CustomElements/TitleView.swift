import Foundation
import UIKit
import SnapKit

final class TitleView: NiblessView {
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    override init() {
        super.init()
        
        setupView()
    }
    
    func apply(_ informationName: String, _ informationSub: String) {
        titleLabel.text = informationName
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "SFProDisplay-Bold", size: 26.0)
        
        subtitleLabel.text = informationSub
        subtitleLabel.textColor = Asset.textWhite.color
        subtitleLabel.font = UIFont(name: "SFProDisplay-Regular", size: 17.0)
        subtitleLabel.textAlignment = .center
    }
    
}

extension TitleView {
    
    private func setupView() {
        addSubview(titleLabel)
        titleLabel.accessibilityIdentifier = "titleLabel"
        titleLabel.numberOfLines = 0
        titleLabel.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
//            make.height.equalTo(55.0)
        }
        
        addSubview(subtitleLabel)
        subtitleLabel.accessibilityIdentifier = "subtitleLabel"
        subtitleLabel.numberOfLines = 0
        subtitleLabel.snp.makeConstraints{make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
//            make.height.equalTo(39.0)
            make.bottom.equalToSuperview()
        }
        
    }
    
}
