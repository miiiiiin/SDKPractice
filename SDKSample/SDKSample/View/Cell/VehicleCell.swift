//
//  VehicleCell.swift
//  SDKSample
//
//  Created by Running Raccoon on 2021/02/09.
//

import UIKit

class VehicleCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var vehicleNameLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var detailCollection: UICollectionView!
    
    
    var vehicleInfoItem: [String] = []
    
    lazy var detailCollectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.detailCollection.delegate = self
        self.detailCollection.dataSource = self
        self.detailCollection.collectionViewLayout = self.detailCollectionLayout
        self.detailCollection.showsHorizontalScrollIndicator = false
        self.detailCollection.reloadData()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.containerView.layer.cornerRadius = 6
    }
    
    func bind(info: [String]) {
        self.vehicleInfoItem = info
        self.detailCollection.reloadData()
    }
}

extension VehicleCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.vehicleInfoItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleInfoItemCell", for: indexPath as IndexPath) as! VehicleInfoItemCell
        let itemData = self.vehicleInfoItem[indexPath.row]
        
        cell.containerView.layer.cornerRadius = 4
        
        if (self.vehicleInfoItem.count > 0) {
            for index in 0..<self.vehicleInfoItem.count {
                cell.lbl.text = "\(itemData)"

//                if (itemData == .connectedCar) {
//                    cell.containerView.backgroundColor = UIColor.main.withAlphaComponent(0.1)
//                    cell.lbl.textColor = .main
//                } else {
//                    cell.containerView.backgroundColor = UIColor(red: 246.0 / 255.0, green: 247.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
//                    cell.lbl.textColor = .blueGrey
//                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleInfoItemCell", for: indexPath) as? VehicleInfoItemCell else { return CGSize.zero }
        
        let item = self.vehicleInfoItem[indexPath.row]
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let width = UILabel.textWidth(font: UIFont.systemFont(ofSize: 15), text: item)

        if (width > 64) {
            return CGSize(width: width + (width/3), height: size.height)
        } else {
            return CGSize(width: width * 2, height: size.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
