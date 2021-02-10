//
//  NoticeListViewController.swift
//  SDKSample
//
//  Created by Running Raccoon on 2021/02/09.
//

import Foundation
import UIKit

public class NoticeListViewController: UIViewController {
    
    @IBOutlet weak var nav: NavView!
    @IBOutlet weak var table: UITableView!
    
    var noticeItemList : [NoticeItem] = []
    private var start = 0
    private var count = 10
    private var isReachedToLast: Bool = false
    var isFirst: Bool = true
    
    
    private var completionHandler: ((Bool) -> Void)
    
    // MARK: Initializers
    

    public init(noticeItemList: [NoticeItem], completion: @escaping (Bool) -> ()) {

        print("noticeitemlist check: \(noticeItemList)")

        self.completionHandler = completion


        super.init(nibName: "NoticeListViewController", bundle: Bundle(for: NoticeListViewController.self))
        
        self.commonInit()
        self.setUpLayout()
        self.noticeItemList = noticeItemList
        self.table.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }
    
   private func commonInit() {
//        Bundle.main.loadNibNamed("NoticeListViewController", owner: self, options: nil)
    }
    
    private func setUpLayout() {
        
        self.table.showsVerticalScrollIndicator = false
        self.table.register(UINib(nibName: "NoticeCell", bundle: nil), forCellReuseIdentifier: "NoticeCell")
        
        self.table.reloadData()
    }
}


extension NoticeListViewController: UITableViewDelegate, UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.noticeItemList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "NoticeCell", for: indexPath) as! NoticeCell
        
        if (self.noticeItemList.count > 0) {
            let noticeList = self.noticeItemList[indexPath.row]
            cell.noticeTitleLabel.text = noticeList.title
            
            if let createdDate = noticeList.created_at.toDate() {
                let date = createdDate.toString(dateFormat: "yyyy.MM.dd")
                cell.dateLabel.text = date
            }
        }
        
        if (indexPath.row == self.noticeItemList.count - 1) {
            if (self.noticeItemList.count >= 10) && !(self.isReachedToLast) {
                start += count
//                self.getNoticeList()
            }
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let controller = UIStoryboard.storyboard(.notice).instantiateViewController(withIdentifier: "NoticeDetailViewController") as! NoticeDetailViewController
//        controller.idx = noticeItemList[indexPath.row].idx
//        self.navigationController?.pushViewController(controller, animated: true)
//    }
}

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
}

extension Date {
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
