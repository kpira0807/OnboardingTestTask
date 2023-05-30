import Foundation
import UIKit
import SnapKit

class OnboardingControllerView: NiblessViewController {
    
    private let infoView = UIView()
    private let continueButton = ContinueButton()
    private let pageControllerView = UIView()
    private let pageController = UIPageControl()
    private let textView = UITextView()
    
    private let viewModel: OnboardingViewModel
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        return collectionView
    }()
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupCollectionView()
        layoutCollectionView()
        setupTextView()
        
        continueButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        if currentPage == viewModel.cellViewModels.count - 1 {
            pageController.isHidden = true
            textView.isHidden = false
        } else if currentPage == viewModel.cellViewModels.count - 2{
            currentPage += 1
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(
                at: IndexPath(item: currentPage, section: 0),
                at: .centeredHorizontally,
                animated: true
            )
            collectionView.isPagingEnabled = true
            pageController.currentPage = currentPage
            pageController.isHidden = true
            textView.isHidden = false
        } else {
            currentPage += 1
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(
                at: IndexPath(item: currentPage, section: 0),
                at: .centeredHorizontally,
                animated: true
            )
            collectionView.isPagingEnabled = true
            pageController.currentPage = currentPage
            pageController.isHidden = false
            textView.isHidden = true
        }
    }
    
}

extension OnboardingControllerView {
    
    private func setupViews() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        view.addSubview(infoView)
        infoView.backgroundColor = .clear
        infoView.accessibilityIdentifier = "infoView"
        infoView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(100.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        view.addSubview(continueButton)
        continueButton.tag = 0
        continueButton.accessibilityIdentifier = "continueButton"
        continueButton.snp.makeConstraints{make in
            make.top.equalTo(infoView.snp.bottom).offset(28.0)
            make.leading.equalToSuperview().inset(31.0)
            make.trailing.equalToSuperview().inset(31.0)
        }
        
        view.addSubview(pageControllerView)
        pageControllerView.accessibilityIdentifier = "pageControllerView"
        pageControllerView.snp.makeConstraints{make in
            make.top.equalTo(continueButton.snp.bottom).offset(24.0)
            make.leading.equalToSuperview().inset(31.0)
            make.trailing.equalToSuperview().inset(31.0)
            make.bottom.equalToSuperview().inset(24.0)
            make.height.equalTo(34.0)
        }
        
        pageControllerView.addSubview(textView)
        textView.isHidden = false
        textView.accessibilityIdentifier = "textView"
        textView.snp.makeConstraints{make in
            make.size.equalToSuperview()
        }
        
        pageControllerView.addSubview(pageController)
        pageController.isHidden = true
        pageController.accessibilityIdentifier = "pageController"
        pageController.numberOfPages = viewModel.cellViewModels.count
        pageController.snp.makeConstraints{make in
            make.size.equalToSuperview()
            make.center.equalToSuperview()
        }
        
    }
    
    private func setupCollectionView() {
        collectionView.register(FirstOnboardingCollectionViewCell.self, forCellWithReuseIdentifier: FirstOnboardingCollectionViewCell.identifier)
        collectionView.register(LastOnboardingCollectionViewCell.self, forCellWithReuseIdentifier: LastOnboardingCollectionViewCell.identifier)
        collectionView.register(ChatOnboardingCollectionViewCell.self, forCellWithReuseIdentifier: ChatOnboardingCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        infoView.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.accessibilityIdentifier = "collectionView"
        collectionView.snp.makeConstraints{make in
            make.size.equalToSuperview()
        }
    }
    
    private func layoutCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
}

extension OnboardingControllerView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstOnboardingCollectionViewCell.identifier, for: indexPath) as! FirstOnboardingCollectionViewCell
            cell.setup(viewModel.cellViewModels[indexPath.row])
            return cell
        } else if indexPath.row == viewModel.cellViewModels.count-1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LastOnboardingCollectionViewCell.identifier, for: indexPath) as! LastOnboardingCollectionViewCell
            cell.setup(viewModel.cellViewModels[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatOnboardingCollectionViewCell.identifier, for: indexPath) as! ChatOnboardingCollectionViewCell
            cell.setup(viewModel.cellViewModels[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageController.currentPage = currentPage
    }
    
}

extension OnboardingControllerView: UITextViewDelegate {
    
    private func setupTextView() {
        let attributedString = NSMutableAttributedString(string: """
By continuing you accept our:
Terms of Use, Privacy Policy and Subscription Terms
""")
        
        attributedString.addAttribute(.link, value: "https://www.google.com", range: (attributedString.string as NSString).range(of: "Terms of Use"))
        attributedString.addAttribute(.link, value: "https://www.google.com", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        attributedString.addAttribute(.link, value: "https://www.google.com", range: (attributedString.string as NSString).range(of: "Subscription Terms"))
        
        textView.linkTextAttributes = [ NSAttributedString.Key.foregroundColor: Asset.textLink.color]
        
        textView.font = UIFont(name: "SFProText-Regular", size: 10.0)
        
        textView.backgroundColor = .clear
        textView.textColor = Asset.textGrey.color
        
        textView.attributedText = attributedString
        textView.delegate = self
        textView.isSelectable = true
        textView.isEditable = false
        textView.delaysContentTouches = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
    }
    
}
