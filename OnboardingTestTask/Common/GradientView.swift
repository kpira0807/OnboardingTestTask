import Foundation
import UIKit

final class GradientView: NiblessView {

  public override class var layerClass: AnyClass {
    CAGradientLayer.self
  }

  public override init() {
    super.init()

    setupView()
  }

  private func setupView() {
    guard let gradientLayer = layer as? CAGradientLayer else {
      return
    }
    gradientLayer.colors = [
        Asset.gradientColor.color.withAlphaComponent(0).cgColor,
        Asset.gradientColor.color.withAlphaComponent(0.2).cgColor,
        Asset.gradientColor.color.withAlphaComponent(0.7785).cgColor,
        Asset.gradientColor.color.withAlphaComponent(1).cgColor
    ]
    gradientLayer.locations = [0, 0.46, 0.84, 1]
  }
  
}
