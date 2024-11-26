//
//  ViewController.swift
//  CollectionViewProject5
//
//  Created by Srikanth Kyatham on 11/25/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var verticalCollectionView: UICollectionView!
    private let categories = ["Property for Rent", "Property for Sale", "Off-Plan Properties", "Rooms for Rent", "Motors", "Jobs", "Classifieds", "Furniture & Garden", "Community"]
    private var horizontalCollectionView: HorizontalCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupSearchBar()
        setupVerticalCollectionView()
        setupHorizontalCollectionView()
    }
    
    private func setupSearchBar() {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for property for rent"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupVerticalCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.width - 40) / 3, height: 120)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        verticalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        verticalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        verticalCollectionView.delegate = self
        verticalCollectionView.dataSource = self
        verticalCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        verticalCollectionView.backgroundColor = .white
        
        view.addSubview(verticalCollectionView)
        
        NSLayoutConstraint.activate([
            verticalCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            verticalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            verticalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            verticalCollectionView.heightAnchor.constraint(equalToConstant: 400) // Adjust height as needed
        ])
    }
    
    private func setupHorizontalCollectionView() {
        horizontalCollectionView = HorizontalCollectionView()
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontalCollectionView)
        
        NSLayoutConstraint.activate([
            horizontalCollectionView.topAnchor.constraint(equalTo: verticalCollectionView.bottomAnchor, constant: 20),
            horizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 200) // Adjust height as needed
        ])
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.configure(with: categories[indexPath.row])
        return cell
    }
}

// Custom UICollectionViewCell for Vertical Collection View
class CategoryCell: UICollectionViewCell {
    private let label = UILabel()
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "house.fill")
        imageView.tintColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        label.text = text
    }
}

