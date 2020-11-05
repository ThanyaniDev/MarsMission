//
//  DetailsViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/03.
//

import UIKit

class DetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	private var collectionView: UICollectionView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = keys.navigationTitle.detailsViewtitle
		
		collectionView?.backgroundColor = UIColor.systemRed
		let layout = UICollectionViewLayout()
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
		guard let collectionView = collectionView else {
			return  }
		
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
		collectionView.delegate = self
		collectionView.dataSource = self
		view.addSubview(collectionView)
		collectionView.frame = view.bounds
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
		cell.contentView.backgroundColor = .systemPink
		return cell
	}
}

