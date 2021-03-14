//
//  ViewController.swift
//  NASA-Images
//
//  Created by Iyin Raphael on 3/13/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    // MARK: - Properties
    private var collectionView: UICollectionView!
    
    private let reuseIdentifier = "cell"
    private var items = [ItemAsset]()
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "NASA Images"
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 24, left: 12, bottom: 24, right: 12)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.items.bind { [weak self] items in
            guard let items = items else { return }
            self?.items = items
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        let item = items[indexPath.row]
        let url = URL(string: item.links[0].href)
        cell.assetImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVc = DetailViewController()
        let item = items[indexPath.row]
        detailVc.viewModel.item = item
        navigationController?.pushViewController(detailVc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let count = 1
        if indexPath.row == items.count - 1 {
            viewModel.paginate(count: count)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = 12
        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacing)
        let itemSize = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        
        return CGSize(width: itemSize, height: itemSize)
    }
}
