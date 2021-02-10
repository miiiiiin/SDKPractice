////
////  VehicleListViewController.swift
////  SDKSample
////
////  Created by Running Raccoon on 2021/02/09.
////
//
//import Foundation
//import UIKit
//
//enum EmptyStatus: Int, CaseIterable {
//    case empty, notEmpty
//}
//
//class VehicleListView: UIView {
//
//    @IBOutlet weak var nav: NavView!
//    @IBOutlet weak var tablevw: UITableView!
//    //    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
////    @IBOutlet weak var nav: NavView!
////    @IBOutlet weak var tablevw: UITableView!
////    @IBOutlet weak var emptyImgView: UIImageView!
//
//    var addView: AddView!
//    var vehicleInfoList : [VehicleInfo] = []
////    let disposeBag = DisposeBag()
//
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        self.setUpLayout()
////        self.setActions()
////    }
//
//
//
//    private func setUpLayout() {
//        self.tablevw.separatorStyle = .none
//        self.tablevw.showsVerticalScrollIndicator = false
//        self.tablevw.showsHorizontalScrollIndicator = false
//
//        //MARK: - TableView ContentSize Observing -
////        self.tablevw.rx.observe(CGSize.self, "contentSize")
////            .compactMap { $0?.height }
////            .bind(to: self.tableViewHeightConstraint.rx.constant)
////            .disposed(by: disposeBag)
//
//        self.addView = AddView(frame: CGRect(x: 0, y: 0, width: self.tablevw.frame.width, height: 104))
//        self.tablevw.tableFooterView = self.addView
//    }
//
//    private func setActions() {
////        self.nav.backButton.rx.tap.subscribe(onNext: { [weak self] in
////            guard let `self` = self else { return }
////            self.navigationController?.popViewController(animated: true)
////            NotificationCenter.default.post(name :    NSNotification.Name(rawValue: "updateInfo"), object: ["vehicleInfo" : self.vehicleInfoList])
////        }).disposed(by: disposeBag)
////
////        self.addView.addBtn.rx.tap.subscribe(onNext: { [weak self] in
////            guard let `self` = self else { return }
////            let controller = UIStoryboard.storyboard(.vehicle).instantiateViewController(withIdentifier: "ChooseRegisterVehicleController") as! ChooseRegisterVehicleController
////            controller.registerType = .isFromMenu
////            //            controller.userinfo = self.userinfo //fixme userinfo is nil
////            self.navigationController?.pushViewController(controller, animated: true)
////        }).disposed(by: disposeBag)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.getVehicleList()
////        // [custom_event_track_swift]
////        AnalyticsUtil.shared.sendAnalyticsPage(vc: "\(self)", page: AnalyticsUtil.PAGE.VEHICLE.getValue(), viewType: nil)
////        //
//    }
//
//    private func isTableViewItemEmpty(for status: EmptyStatus) {
//        switch status {
//        case .empty:
//            self.emptyImgView.isHidden = false
//
//        case .notEmpty:
//            self.emptyImgView.isHidden = true
//        }
//    }
//
//    private func isEmpty(count: Int) {
//        if (count == 0) {
//            self.isTableViewItemEmpty(for: .empty)
//        } else {
//            self.isTableViewItemEmpty(for: .notEmpty)
//        }
//    }
//
//    private func getVehicleList() {
////        self.showLoading()
////        UserAPI.getVehicleList() { response, bool, err in
////            if (bool) {
////                self.vehicleInfoList = response?.getVehicleInfoList() ?? []
////                self.isEmpty(count: self.vehicleInfoList.count)
////
////                print("getvehiclelist: \(self.vehicleInfoList.toJSON())")
////
//////                print("tableviewheight: \(self.tablevw.contentSize.height)")
////                //                self.tablevw.contentSize = CGSize(width: self.tablevw.frame.width, height: self.tablevw.contentSize.height * 1.5)
////
////                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
////                    self.tablevw.reloadData()
////                }
//////                print("tableviewheight22222: \(self.tablevw.contentSize.height)")
////            } else {
////                if let err = err?.toInt() {
////                    if (NetworkError(rawValue: err) == NetworkError.ERR_DB_NODATA) {
////                        self.vehicleInfoList = []
////                        self.isEmpty(count: self.vehicleInfoList.count)
////                    } else {
////                        Toast(text: .failedToGetData).show()
////                    }
////                }
////            }
////
////            DispatchQueue.main.async {
////                self.stopLoading()
////            }
////        }
//    }
//
//    private func removeVehicle(isDefault: Bool, vehicleId: String) {
////        let request = GetRemoveVehicleRequest()
////        request.isDefault = isDefault
////        request.vehicleId = vehicleId
////
////        UserAPI.removeVehicle(request: request) { response, bool, err in
////            if !(bool) {
////                if let errCode = err?.toInt(), let error = VehicleError(rawValue: errCode) {
////                    switch error {
////                    case .ERR_VEHICLE_REMOVE_NOT_POSSIBLE:
////                        CommonAlert.instance.showSingleAlert(title: error.localizedDescription) {
////                            CommonAlert.instance.dismiss(animated: true)
////                        }
////                    }
////                }
////                Toast(text: .tryAgainMessage).show()
////            } else {
////                self.getVehicleList()
////                Toast(text: .deleteVehicleDone).show()
////            }
////            self.stopLoading()
////        }
//    }
//
//    private func termsReject(vehicleId: Int) {
////        self.showLoading()
////        let request = SetConnectedCarTermsRejectRequest()
////        request.vehicleId = vehicleId.stringValue
////
////        UserAPI.connectedCarTermsReject(request: request) { (response, bool, err) in
////            if !(bool) {
////                Toast(text: .tryAgainMessage).show()
////            } else {
////                self.getVehicleList()
////            }
////            self.stopLoading()
////        }
//    }
//}
//
//extension VehicleListViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.vehicleInfoList.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 114
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////
////        let cell = self.tablevw.dequeueReusableCell(withIdentifier: "VehicleListCell", for: indexPath) as! VehicleListCell
////        let vehicleInfo = self.vehicleInfoList[indexPath.row]
////        cell.selectionStyle = .none
////
////        cell.linkOffConnectedCarBtn.rx.tap
////            .asDriver()
////            .drive(onNext: { [weak self] in
////                guard let `self` = self else { return }
////                let request = GetUserConnectedVehicleListRequest()
////                request.vehicleId = vehicleInfo.vehicle_id.stringValue
////
////                UserAPI.getUserConnectedVehicle(request: request) { (response, bool, err) in
////                    if (bool) {
////                        guard let data = response?.getConnectedVehicleList() else { return }
////                        ModalView.instance.linkOffConnectedCarDialog(list: data, completion: {
////                            data.forEach { info in
////                                self.termsReject(vehicleId: info.vehicle_id)
////                            }
////                            ModalView.instance.dismiss(animated: true)
////                        }) {
////                            ModalView.instance.dismiss(animated: true)
////                        }
////                    }
////                }
////            }).disposed(by: cell.disposeBag)
////
////        cell.vehicleDeleteBtn.rx.tap
////            .asDriver()
////            .drive(onNext: { [weak self] in
////                guard let `self` = self else { return }
////                CommonAlert.instance.alertLbl.textAlignment = .left
////                CommonAlert.instance.showAlert(title: .deleteVehicle, onClick: .yes, cancel: .no, completion: {
////                    self.showLoading()
////                    CommonAlert.instance.dismiss(animated: true)
////                    guard let isDefault: Bool = Bool(vehicleInfo.is_default) else { return }
////                    self.removeVehicle(isDefault: isDefault, vehicleId: vehicleInfo.vehicle_id.stringValue)
////                }) {
////                    CommonAlert.instance.dismiss(animated: true)
////                }
////            }).disposed(by: cell.disposeBag)
////
////        cell.vehicleReviseBtn.rx.tap
////            .asDriver()
////            .drive(onNext: { [weak self] in
////                guard let `self` = self else { return }
////                let controller = UIStoryboard.storyboard(.vehicle).instantiateViewController(withIdentifier: "RegisterVehicleViewController") as! RegisterVehicleViewController
////                controller.registerType = .isFromEdit
////                controller.vehicleInfo = vehicleInfo
////                self.navigationController?.pushViewController(controller, animated: true)
////            }).disposed(by: cell.disposeBag)
////
////        if (self.vehicleInfoList.count > 0) {
////            DispatchQueue.main.async {
////                var infoArray: [String] = []
////                if let _ = vehicleInfo.connected_car_id {
////                    cell.linkOffConnectedCarBtn.isHidden = false
////                    infoArray.append(.connectedCar)
////                } else {
////                    cell.linkOffConnectedCarBtn.isHidden = true
////                }
////
////                infoArray.append(contentsOf: [vehicleInfo.vehicle_no, vehicleInfo.getVehicleColor(), vehicleInfo.getVehicleGearString(), vehicleInfo.getVehicleTypeString()])
////
////                cell.vehicleName.text = "\(vehicleInfo.vehicle_name)"
////                cell.bind(info: infoArray)
////                cell.collection.reloadData()
////            }
////        }
////        return cell
//    }
//}
//
