import Foundation
import UIKit
import SnapKit

final class Information3View: NiblessView {
    
    struct Configuration {
        
        let image: UIImage
        let informationName: String
        let informationSub: String
        
    }
    
    private let imageView = UIImageView()
    private let titleView = TitleView()
    
    override init() {
        super.init()
        
        setupView()
    }
    
    func apply(with configuration: Configuration) {
        imageView.image = configuration.image
        titleView.apply(configuration.informationName, configuration.informationSub)
    }
    
    
}

extension Information3View {
    
    private func setupView() {
        backgroundColor = Asset.backgroundViewColor.color.withAlphaComponent(0.24)
        layer.cornerRadius = 20
        
        addSubview(imageView)
        imageView.accessibilityIdentifier = "imageView"
        imageView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(49.0)
            make.leading.equalToSuperview().offset(24.0)
            make.trailing.equalToSuperview().inset(24.0)
        }
        
        addSubview(titleView)
        titleView.accessibilityIdentifier = "titleView"
        titleView.snp.makeConstraints{make in
            make.top.equalTo(imageView.snp.bottom).offset(24.0)
            make.leading.equalToSuperview().offset(24.0)
            make.trailing.equalToSuperview().inset(24.0)
            make.bottom.equalToSuperview().inset(100.0)
        }
    }
    
}
