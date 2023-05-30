import Foundation
import UIKit
import SnapKit

final class Information2View: NiblessView {
    
    struct Configuration {
        
        let chatText: String
        let backgroundChat: UIColor
        let informationText: String
        let informationName: String
        let informationSub: String
        
    }
    
    private let illustration2View = Illustration2View()
    private let titleView = TitleView()
    
    override init() {
        super.init()
        
        setupView()
    }
    
    func apply(with configuration: Configuration) {
        illustration2View.apply(configuration.chatText, configuration.backgroundChat, configuration.informationText)
        titleView.apply(configuration.informationName, configuration.informationSub)
    }
    
    
}

extension Information2View {
    
    private func setupView() {
        backgroundColor = Asset.backgroundViewColor.color.withAlphaComponent(0.24)
        layer.cornerRadius = 20
        
        addSubview(illustration2View)
        illustration2View.accessibilityIdentifier = "illustration2View"
        illustration2View.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(49.0)
            make.leading.equalToSuperview().offset(24.0)
            make.trailing.equalToSuperview().inset(24.0)
        }        
        
        addSubview(titleView)
        titleView.accessibilityIdentifier = "titleView"
        titleView.snp.makeConstraints{make in
            make.top.equalTo(illustration2View.snp.bottom).offset(24.0)
            make.height.equalTo(120.0)
            make.leading.equalToSuperview().offset(24.0)
            make.trailing.equalToSuperview().inset(24.0)
            make.bottom.equalToSuperview().inset(100.0)
        }
    }
    
}
