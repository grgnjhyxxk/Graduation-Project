//
//  MainViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class VitaminViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let AppIconImageView = HomeView().AppIconImageView()
    
    let titleTextButton = CommonView().titleTextButton(titleText: "영양관리")
    let userProfileButton = CommonView().roundingButton()
    let userInterfaceStyleToggleButton = CommonView().userInterfaceStyleToggleButton()
    let plusButton = AlarmView().plusButton()
    
    let subTextLabel = CommonView().commonTextLabel(labelText: "한눈에 보는 나의 영양제", size: 14)
    let mainTextLabel = CommonView().commonTextLabel(labelText: "영양관리로\n쉽고 편하게 관리하세요.", size: 25)

    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 30)
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("홈화면이 로드되었습니다.")
        addSubview()
        addOnCommonUiView()
        viewLayout()
        commonUiViewLayout()
        tableViewLayout()
        actionFunction()
        NotificationCenter.default.addObserver(self, selector: #selector(handleVitaminAddedNotification), name: NSNotification.Name(rawValue: "VitaminAddedNotification"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleVitaminDeleteNotification), name: NSNotification.Name(rawValue: "VitaminDeletedNotification"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let image = userProfileImageList[0].image
        userProfileButton.setImage(image, for: .normal)
    }
    
    @objc func handleVitaminAddedNotification(_ noti: Notification) {
        OperationQueue.main.addOperation {
            print("영양제가 정상적으로 등록되었습니다.")
            self.tableView.reloadData()
        }
    }
    
    @objc func handleVitaminDeleteNotification(_ noti: Notification) {
        OperationQueue.main.addOperation {
            print("영양제가 정상적으로 삭제되었습니다.")
            self.tableView.reloadData()
        }
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appSubBackgroundColor
        
        userProfileButton.snp.makeConstraints { make in
//            make.top.equalTo(view).offset(63)
            make.top.equalTo(58.5)
            make.trailing.equalTo(view).offset(-15)
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
        
        userInterfaceStyleToggleButton.snp.makeConstraints { make in
//            make.top.equalTo(userProfileButton.snp.top).offset(5.5)
            make.top.equalTo(userProfileButton)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 36))
        }

        titleTextButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton).offset(-5)
            make.leading.equalTo(view).offset(15)
            make.size.equalTo(CGSize(width: 122, height: 44))
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(userInterfaceStyleToggleButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view)
        }

        userProfileButton.backgroundColor = UIColor.appMainBackgroundColor
        userProfileButton.layer.cornerRadius = 18
        userProfileButton.clipsToBounds = true
        commonUiView.shadowLayer()
    }
    
    private func addSubview() {
        uiViewList = [titleTextButton, userProfileButton, userInterfaceStyleToggleButton, commonUiView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUiViewLayout() {
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(commonUiView).offset(10)
            make.leading.equalTo(20)
        }
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(subTextLabel.snp.bottom).offset(0)
            make.leading.equalTo(19)
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(-34)
            make.trailing.equalTo(commonUiView).offset(-20)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(20)
            make.bottom.equalTo(commonUiView).offset(-83)
            make.leading.equalTo(commonUiView).offset(10)
            make.trailing.equalTo(commonUiView).offset(-10)
        }
        
        mainTextLabel.attributedLabel(text: "영양관리")
        subTextLabel.textColor = UIColor.subTextColor
    }
    
    private func addOnCommonUiView() {
        commonViewList = [subTextLabel, mainTextLabel, plusButton, tableView]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func tableViewLayout() {
        tableView.register(VitaminViewTableCell.self, forCellReuseIdentifier: "VitaminViewTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = 93
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tableView.layer.cornerRadius = 15
    }
    
    private func actionFunction() {
        userInterfaceStyleToggleButton.addTarget(self, action: #selector(toggleTheme), for: .touchUpInside)
        userProfileButton.addTarget(self, action: #selector(roundingButtonAction), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
    }
    
    @objc func plusButtonAction(_: UIButton) {
        let rootViewController = VitaminAddViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        vitaminBasicDataListInit()
        ingredientsCellDataListInit()
        vitaminImageDataListInit()
        present(navigationController, animated: true, completion: nil)
    }
    
//    @objc func plusButtonAction(_: UIButton) {
//        let rootViewController = VitaminCaptureViewController()
//        let nvigationController = UINavigationController(rootViewController: rootViewController)
//        vitaminImageDataListInit()
//        present(nvigationController, animated: true)
//    }
    
    @objc func toggleTheme(_ sender: UIButton) {
        if #available(iOS 15.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if windowScene.windows.first?.traitCollection.userInterfaceStyle == .dark {
                    windowScene.windows.forEach { window in
                        window.overrideUserInterfaceStyle = .light
                        sender.setImage(UIImage(systemName: "sun.max.circle.fill"), for: .normal)
                    }
                } else {
                    windowScene.windows.forEach { window in
                        window.overrideUserInterfaceStyle = .dark
                        sender.setImage(UIImage(systemName: "moon.circle.fill"), for: .normal)
                    }
                }
            }
        } else {
            if self.traitCollection.userInterfaceStyle == .dark {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .light
                    sender.setImage(UIImage(systemName: "sun.max.circle.fill"), for: .normal)
                }
            } else {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .dark
                    sender.setImage(UIImage(systemName: "moon.circle.fill"), for: .normal)
                }
            }
        }
    }
    
    @objc func roundingButtonAction(_ sender: UIButton) {
        let rootViewController = UserViewContoller()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.modalPresentationStyle = .fullScreen
        
        present(navigationController, animated: true)
    }
}

extension VitaminViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userVitaminDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VitaminViewTableCell", for: indexPath) as! VitaminViewTableCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear
        cell.layer.cornerRadius = 10
        
//        var image = UIImage()
//
//        if vitaminImageDataList.count != 0 {
//            image = vitaminImageDataList[indexPath.row].image
//        } else {
//            image = UIImage()
//        }
        
        let image = UIImage(data: userVitaminDataList[indexPath.row].image)
        let prod_name = userVitaminDataList[indexPath.row].prod_name
        let taken = userVitaminDataList[indexPath.row].taken
        
//        cell.vitaminImage.image = image
        cell.vitaminImage.image = image
        cell.vitaminNameLabel.text = prod_name
        
        if taken == 1 {
            cell.checkButton.tintColor = UIColor.appPointColor
        } else if taken == 2 {
            cell.checkButton.tintColor = UIColor.systemRed
        }
        
        if vitaminNames[indexPath.row].count == 3 {
            let ingredients_1 = vitaminNames[indexPath.row][0]
            let ingredients_2 = vitaminNames[indexPath.row][1]
            let ingredients_3 = vitaminNames[indexPath.row][2]

            cell.firstIngredientsLabelButton.setTitle(ingredients_1, for: .normal)
            cell.secondIngredientsLabelButton.setTitle(ingredients_2, for: .normal)
            cell.thirdIngredientsLabelButton.setTitle(ingredients_3, for: .normal)
        } else if vitaminNames[indexPath.row].count == 2 {
            let ingredients_1 = vitaminNames[indexPath.row][0]
            let ingredients_2 = vitaminNames[indexPath.row][1]

            cell.firstIngredientsLabelButton.setTitle(ingredients_1, for: .normal)
            cell.secondIngredientsLabelButton.setTitle(ingredients_2, for: .normal)
            
            cell.thirdIngredientsLabelButton.isHidden = true
        } else if vitaminNames[indexPath.row].count == 1 {
            let ingredients_1 = vitaminNames[indexPath.row][0]

            cell.firstIngredientsLabelButton.setTitle(ingredients_1, for: .normal)
            
            cell.secondIngredientsLabelButton.isHidden = true
            cell.thirdIngredientsLabelButton.isHidden = true
        }
        
        if vitaminNames[indexPath.row].count > 3 {
            let count = vitaminNames[indexPath.row].count - 3
            cell.overCountLabel.text = "+ \(count)"
            cell.overCountLabel.attributedLabel(text: "\(count)")
            cell.overCountLabel.font = UIFont(name: "NotoSansKR-Regular", size: 10)
        } else {
            cell.overCountLabel.isHidden = true
        }
        
        cell.overCountLabel.snp.makeConstraints { make in
            if !cell.thirdIngredientsLabelButton.isHidden {
                make.top.equalTo(cell.thirdIngredientsLabelButton)
                make.leading.equalTo(cell.thirdIngredientsLabelButton.snp.trailing).offset(5)
            } else if !cell.secondIngredientsLabelButton.isHidden {
                make.top.equalTo(cell.secondIngredientsLabelButton)
                make.leading.equalTo(cell.secondIngredientsLabelButton.snp.trailing).offset(5)
            } else {
                make.top.equalTo(cell.firstIngredientsLabelButton)
                make.leading.equalTo(cell.firstIngredientsLabelButton.snp.trailing).offset(5)
            }
            
            make.width.equalTo(cell.overCountLabel.intrinsicContentSize.width)
            make.height.equalTo(20)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let editAlarmViewController = VitaminEditViewController()
        let navigationController = UINavigationController(rootViewController: editAlarmViewController)
        
        editAlarmViewController.vitaminIndex = indexPath.row
        
        present(navigationController, animated: true, completion: nil)
    }
}
