import Foundation
import UIKit
import SnapKit

final class Illustration2View: NiblessView {
    
    private let chatView = ChatView()
    private let detailInfoView = DetailinfoView()

    override init() {
        super.init()
        
        setupView()
    }
    
    func apply(_ chatText: String, _ backgroundChat: UIColor, _ detailInfo: String) {
        chatView.apply(chatText, backgroundChat)
        detailInfoView.apply(detailInfo)
    }
    
}

extension Illustration2View {
    
    private func setupView() {
        addSubview(chatView)
        chatView.accessibilityIdentifier = "chatView"
        
        chatView.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview().inset(16.57)
            make.top.equalToSuperview().offset(15.23)
        }
        
        addSubview(detailInfoView)
        detailInfoView.accessibilityIdentifier = "detailInfoView"
        
        detailInfoView.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(27.77)
            make.trailing.equalToSuperview().inset(28.58)
            make.top.equalTo(chatView.snp.bottom).offset(9.32)
            make.bottom.equalToSuperview()
        }
        
        let gradientView = GradientView()
        addSubview(gradientView)
        gradientView.snp.makeConstraints{make in
            make.size.equalToSuperview()
        }
    }
    
}
