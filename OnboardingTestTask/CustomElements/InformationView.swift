import Foundation
import UIKit
import SnapKit

final class InformationView: NiblessView {
    
    struct Configuration {
        
        let introductionName: String
        let introductionText: String
        let informationName: String
        let informationSub: String
        
    }
    
    private let illustration1View = Illustration1View()
    private let titleView = TitleView()
    
    override init() {
        super.init()
        
        setupView()
    }
    
    func apply(with configuration: Configuration) {
        illustration1View.apply(configuration.introductionName, configuration.introductionText)
        titleView.apply(configuration.informationName, configuration.informationSub)
    }
    
}

extension InformationView {
    
    private func setupView() {
        backgroundColor = Asset.backgroundViewColor.color.withAlphaComponent(0.24)
        layer.cornerRadius = 20
        
        addSubview(illustration1View)
        illustration1View.accessibilityIdentifier = "illustration1View"
        illustration1View.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(49.0)
            make.leading.equalToSuperview().offset(24.0)
            make.trailing.equalToSuperview().inset(24.0)
        }
        
        addSubview(titleView)
        titleView.accessibilityIdentifier = "titleView"
        titleView.snp.makeConstraints{make in
            make.top.equalTo(illustration1View.snp.bottom).offset(24.0)
            make.leading.equalToSuperview().offset(24.0)
            make.trailing.equalToSuperview().inset(24.0)
            make.height.equalTo(116.0).priority(.low)
            make.bottom.equalToSuperview().inset(100.0)
        }
    }
    
}
