//
//  NavView.swift
//  SDKSample
//
//  Created by Running Raccoon on 2021/02/09.
//

import UIKit

class NavView: UIView {
    
    static let instance = NavView()
    
    @IBOutlet var containerview: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("NavView", owner: self, options: nil)
        containerview.frame = self.bounds
        containerview.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(containerview)
        
        self.subButton.isHidden = true
    }
}
