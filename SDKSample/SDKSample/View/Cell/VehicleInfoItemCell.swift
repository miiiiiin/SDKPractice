//
//  VehicleInfoItemCell.swift
//  SDKSample
//
//  Created by Running Raccoon on 2021/02/09.
//

import UIKit

class VehicleInfoItemCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lbl: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.containerView.layer.cornerRadius = 4
    }
}
