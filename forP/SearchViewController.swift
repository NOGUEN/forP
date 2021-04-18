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
    let searchField: UITextField = {
        let searchField = UITextField()
        searchField.translatesAutoresizingMaskIntoConstraints = false
        return searchField
    }()
    
    let cellWidthPadding = 20
    let cellHeightPadding = 10
    let foodPhoto = ["dogFood1", "dogFood2", "dogFood3", "dogFood4"]
    let foodName = ["하이포알러제닉 가수분해 양고기", "하이포알러제닉 가수분해 소고기", "하이포알러제닉 가수분해 오리고기", "하이포알러제닉 가수분해 연어"]
    let foodCost = ["33000", "33000", "33000", "33000"]
    
    
    override func viewDidLoad() {
        let view = UIView()
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        let cellWidth = (Int(viewWidth) - cellWidthPadding * 3) / 2
        let cellHeight = 200
        super.viewDidLoad()
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.sectionInset = UIEdgeInsets(top: CGFloat(cellWidthPadding), left: CGFloat(cellHeightPadding), bottom: CGFloat(cellWidthPadding), right: CGFloat(cellHeightPadding))
        dogFoodCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        dogFoodCollectionView.backgroundColor = UIColor.white
        dogFoodCollectionView.delegate = self
        dogFoodCollectionView.dataSource = self
        dogFoodCollectionView.register(dogFoodCell.self, forCellWithReuseIdentifier: "cell")
        self.view = view
        
        autoLayout()
        view.addSubview(searchField)
        view.addSubview(dogFoodCollectionView)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! dogFoodCell
        cell.foodImage.image = UIImage(named: foodPhoto[indexPath.row])
        cell.foodLabel.text = foodName[indexPath.row]
        cell.costLabel.text = foodCost[indexPath.row]
        cell.kgLabel.text = "(1.5kg)"
        return cell
    }
    
    func autoLayout() {
    }
}

class dogFoodCell: UICollectionViewCell {
    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "imageBackground"), for: .normal)
        button.layer.cornerRadius = 12
        button.imageView?.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let foodImage: UIImageView = {
        let foodImage = UIImageView()
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        return foodImage
    }()
    
    let foodLabel: UILabel = {
        let foodLabel = UILabel()
        foodLabel.lineBreakMode = .byCharWrapping
        foodLabel.numberOfLines = 0
        foodLabel.font = UIFont.boldSystemFont(ofSize: 20)
        foodLabel.translatesAutoresizingMaskIntoConstraints = false
        return foodLabel
    }()
    
    let costLabel: UILabel = {
        let costLabel = UILabel()
        costLabel.font = UIFont.boldSystemFont(ofSize: 20)
        costLabel.textColor = UIColor.orange
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        return costLabel
    }()
    
    let kgLabel: UILabel = {
        let kgLabel = UILabel()
        kgLabel.font = UIFont.systemFont(ofSize: 14)
        kgLabel.textColor = UIColor.lightGray
        kgLabel.translatesAutoresizingMaskIntoConstraints = false
        return kgLabel
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        autoLayout()
    }
    
    func addViews() {
        contentView.addSubview(button)
        contentView.addSubview(foodImage)
        contentView.addSubview(foodLabel)
        contentView.addSubview(costLabel)
        contentView.addSubview(kgLabel)
    }
    
    func autoLayout() {
        button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        button.widthAnchor.constraint(equalToConstant: (button.imageView?.frame.width)!).isActive = true
        button.heightAnchor.constraint(equalToConstant: (button.imageView?.frame.height)!).isActive = true
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.imageView?.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        
        foodImage.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        foodImage.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        
        foodLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 0).isActive = true
        foodLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10).isActive = true
        foodLabel.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 0).isActive = true
        foodLabel.widthAnchor.constraint(equalToConstant: button.frame.width).isActive = true
        foodLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        costLabel.topAnchor.constraint(equalTo: foodLabel.bottomAnchor, constant: 0).isActive = true
        costLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
        kgLabel.centerYAnchor.constraint(equalTo: costLabel.centerYAnchor).isActive = true
        kgLabel.leadingAnchor.constraint(equalTo: costLabel.trailingAnchor, constant: 5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

