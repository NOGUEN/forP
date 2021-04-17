//
//  ViewController.swift
//  forP
//
//  Created by 노근(hnoh) on 2021/04/18.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var dogFoodCollectionView: UICollectionView!
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let cellWidthPadding = 10
    let cellHeightPadding = 10
    
    override func viewDidLoad() {
        let viewWidth = view.frame.width
        let viewHeight = view.frame.height
        let cellWidth = (Int(viewWidth) - cellWidthPadding * 3) / 2
        let cellHeight = (Int(viewHeight) / 3)
        super.viewDidLoad()
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        dogFoodCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        dogFoodCollectionView.delegate = self
        dogFoodCollectionView.dataSource = self
        dogFoodCollectionView.register(dogFoodCell.self, forCellWithReuseIdentifier: "cell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! dogFoodCell
        return cell
    }
}

class dogFoodCell: UICollectionViewCell {
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

