//
//  ViewController.swift
//  Interview
//
//  Created by Brenda on 2022/4/25.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = LotteryViewModel()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }

    private func setupCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        let itemSizeWidth = (view.frame.size.width - 30 - 40)/5//left and right=>30
        print("size is \(itemSizeWidth)")
        layout.itemSize = CGSize(width: itemSizeWidth, height: 39)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = .zero
        
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        let nib = UINib(nibName: "\(CollectionViewCell.self)", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.backgroundColor = .collection_deepBlue
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.lotteryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.configure(viewModel: viewModel.lotteryArray[indexPath.row])
        return cell
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.cellSelected(index: indexPath.row)
        DispatchQueue.main.async {
            collectionView.reloadItems(at: [indexPath])
        }
    }
}
