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
    
    let cellWidthPadding = 20
    let cellHeightPadding = 10
    let foodPhoto = ["dogFood1", "dogFood2", "dogFood3", "dogFood4"]
    let foodName = ["하이포알러제닉 가수분해 양고기", "하이포알러제닉 가수분해 소고기", "하이포알러제닉 가수분해 오리고기", "하이포알러제닉 가수분해 연어"]
    let foodCost = ["33000", "33000", "33000", "33000"]
    
    
    override func viewDidLoad() {
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        let cellWidth = (Int(viewWidth) - cellWidthPadding * 2) / 2
        let cellHeight = 210
        let textFieldHeight = 50
        let collectionFrame = CGRect(x: 0, y: 0, width: Int(viewWidth), height: Int(viewHeight) - textFieldHeight)
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.sectionInset = UIEdgeInsets(top: CGFloat(cellWidthPadding), left: CGFloat(cellHeightPadding), bottom: CGFloat(cellWidthPadding), right: CGFloat(cellHeightPadding))
        layout.headerReferenceSize = CGSize(width: viewWidth, height: 150)
        
        dogFoodCollectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: layout)
        dogFoodCollectionView.backgroundColor = UIColor.white
        dogFoodCollectionView.delegate = self
        dogFoodCollectionView.dataSource = self
        dogFoodCollectionView.register(dogFoodCell.self, forCellWithReuseIdentifier: "cell")
        dogFoodCollectionView.register(header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header" )
        view.addSubview(dogFoodCollectionView)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! dogFoodCell
        cell.foodImage.image = UIImage(named: foodPhoto[indexPath.row])
        cell.foodLabel.text = foodName[indexPath.row]
        cell.costLabel.text = "\(foodCost[indexPath.row])원"
        cell.kgLabel.text = "(1.5kg)"
        cell.pikiniLabel.text = "피키니(pikini)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insets = UIEdgeInsets(top: 150, left: 0, bottom: 0, right: 0)
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! header
        header.addViews()
        return header
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
        foodLabel.font = UIFont.boldSystemFont(ofSize: 19)
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
    
    let pikiniLabel: UILabel = {
        let pikiniLabel = UILabel()
        pikiniLabel.font = UIFont.systemFont(ofSize: 14)
        pikiniLabel.textColor = UIColor.lightGray
        pikiniLabel.translatesAutoresizingMaskIntoConstraints = false
        return pikiniLabel
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
        contentView.addSubview(pikiniLabel)
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
        
        pikiniLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 5).isActive = true
        pikiniLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10).isActive = true
        pikiniLabel.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 0).isActive = true
        
        foodLabel.topAnchor.constraint(equalTo: pikiniLabel.bottomAnchor, constant: 0).isActive = true
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

class header: UICollectionReusableView {
    static let identifier = "header"
    
    let searchField: UITextField = {
        let searchField = UITextField()
        let rightImage = UIImageView(frame: CGRect(x: -20, y: 0, width: 23, height: 23))
        rightImage.image = UIImage(named: "search")
        searchField.placeholder = "사료 이름을 검색하세요."
        searchField.layer.cornerRadius = 30
        searchField.layer.masksToBounds = true
        searchField.layer.borderColor = UIColor.orange.cgColor
        searchField.layer.borderWidth = 2
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: searchField.frame.height))
        searchField.leftViewMode = .always
        searchField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        searchField.rightView?.addSubview(rightImage)
        searchField.rightViewMode = .always
        return searchField
    }()
    
    let backButton: UIButton = {
        let backButton = UIButton()
        let image = UIImage(named: "back")
        backButton.setImage(image, for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func addViews() {
        addSubview(searchField)
        addSubview(backButton)
        autoLayout()
    }
    
    func autoLayout() {
        backButton.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 0).isActive = true
        backButton.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: 20).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 36).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        searchField.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 30).isActive = true
        searchField.leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: 30).isActive = true
        searchField.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: 30).isActive = true
        searchField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        searchField.widthAnchor.constraint(equalToConstant: frame.width - 60).isActive = true
    }
}
