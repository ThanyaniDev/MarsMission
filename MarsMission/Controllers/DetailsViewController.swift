//
//  DetailsViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/03.
//

import UIKit

class DetailsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = keys.navigationTitle.detailsViewTitle
		collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: keys.Identifier.cellID)
	}
	
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 10.0, left: 1.0, bottom: 10, right: 1.0)
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: keys.Identifier.cellID, for: indexPath) as! SearchViewCell
		cell.layer.cornerRadius = 10
		cell.backgroundColor = .blue
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: view.frame.width - 10, height: 200)
	}
}




