//
//  AIRecommededViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import KDCircularProgress

class AiRecommendedViewController: UIViewController {
    
    var leftTabBool: Bool = true
    var rightTabBool: Bool = false

    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    var contentViewList: [UIView] = []

    let userProfileButton = CommonView().roundingButton()
    let userInterfaceStyleToggleButton = CommonView().userInterfaceStyleToggleButton()
    let titleTextButton = CommonView().titleTextButton(titleText: "맞춤추천")
    let analyzationButton = CommonView().commonTitleButton(text: "AI분석")
    let recommendationButton = CommonView().commonTitleButton(text: "맞춤추천")
    
    let subTextLabel = CommonView().commonTextLabel(labelText: "늘 효과적인 해답", size: 14)
    let mainTextLabel = CommonView().commonTextLabel(labelText: "AI 분석을 통한\n최적의 솔루션", size: 25)
    let myHealthGrade = CommonView().commonTextLabel(labelText: "내 건강점수는?", size: 25)
    let grade = CommonView().commonTextLabel(labelText: "", size: 25)
    let tableView = UITableView()

    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 30)
//    let scrollView = UIScrollView()
//    let contentView = UIView()
    let leftTabView = UIView()
    let rightTabView = UIView()
    let leftDivideView = UIView()
    let rightDivideView = UIView()

    let progress = KDCircularProgress()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("AI추천화면이 로드되었습니다.")
        addOnView()
        viewLayout()
        addOnCommonUiView()
        commonUiViewLayout()
        actionFunction()
        tableViewLayout()
//        sumAllOfValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let image = userProfileImageList[0].image
        userProfileButton.setImage(image, for: .normal)
        tableView.reloadData()
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
        
        commonUiView.shadowLayer()
    }
    
    private func addOnView() {
        uiViewList = [commonUiView, userProfileButton, userInterfaceStyleToggleButton, titleTextButton]
        
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
        
        progress.startAngle = -90
        progress.progressThickness = 0.5
        progress.trackThickness = 0.3
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = false
        progress.glowMode = .noGlow
        progress.glowAmount = 0.9
        progress.trackColor = UIColor.appSubBackgroundColor!
        progress.set(colors: UIColor.appPointColor!, UIColor.appPointColor!)
        progress.progress = 0.5

//        myHealthGrade.snp.makeConstraints { make in
//            make.top.equalTo(mainTextLabel.snp.bottom).offset(10)
//            make.leading.equalTo(19)
//        }

//        progress.snp.makeConstraints { make in
//            make.leading.equalTo(0)
//            make.top.equalTo(mainTextLabel.snp.bottom).offset(10)
//            make.size.equalTo(CGSize(width: 170, height: 170))
//        }
//
//        grade.snp.makeConstraints { make in
//            make.centerX.equalTo(progress)
//            make.centerY.equalTo(progress)
//        }
        
        myHealthGrade.font = UIFont(name: "NotoSansKR-Bold", size: 25)
        grade.font = UIFont(name: "NotoSansKR-Bold", size: 50)
        grade.text = "70"
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(20)
            make.bottom.equalTo(commonUiView).offset(-83)
            make.leading.equalTo(commonUiView).offset(10)
            make.trailing.equalTo(commonUiView).offset(-10)
        }
            
        mainTextLabel.attributedLabel(text: "AI 분석")
        subTextLabel.textColor = UIColor.subTextColor
    }
    
    private func addOnCommonUiView() {
        commonViewList = [subTextLabel, mainTextLabel, leftTabView, rightTabView, leftDivideView, analyzationButton, recommendationButton, rightDivideView, myHealthGrade, progress, grade, tableView]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func tableViewLayout() {
        tableView.register(RecommendCell.self, forCellReuseIdentifier: "RecommendCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = 93
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tableView.layer.cornerRadius = 15
//        tableView.backgroundColor = UIColor.red
    }
    
    private func actionFunction() {
        userProfileButton.addTarget(self, action: #selector(roundingButtonAction), for: .touchUpInside)
        userInterfaceStyleToggleButton.addTarget(self, action: #selector(toggleTheme), for: .touchUpInside)
    }
    
    @objc func roundingButtonAction(_ sender: UIButton) {
        let rootViewController = UserViewContoller()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.modalPresentationStyle = .fullScreen

        present(navigationController, animated: true)
    }
    
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

}

extension AiRecommendedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aiVitaminSearchDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendCell", for: indexPath) as! RecommendCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear
        cell.layer.cornerRadius = 15
        
        let prod_name = aiVitaminSearchDataList[indexPath.row].prod_name

        cell.vitaminNameLabel.text = prod_name
        
        if aiVitaminNames[indexPath.row].count == 3 {
            let ingredients_1 = aiVitaminNames[indexPath.row][0]
            let ingredients_2 = aiVitaminNames[indexPath.row][1]
            let ingredients_3 = aiVitaminNames[indexPath.row][2]

            cell.firstIngredientsLabelButton.setTitle(ingredients_1, for: .normal)
            cell.secondIngredientsLabelButton.setTitle(ingredients_2, for: .normal)
            cell.thirdIngredientsLabelButton.setTitle(ingredients_3, for: .normal)
        } else if aiVitaminNames[indexPath.row].count == 2 {
            let ingredients_1 = aiVitaminNames[indexPath.row][0]
            let ingredients_2 = aiVitaminNames[indexPath.row][1]

            cell.firstIngredientsLabelButton.setTitle(ingredients_1, for: .normal)
            cell.secondIngredientsLabelButton.setTitle(ingredients_2, for: .normal)
            
            cell.thirdIngredientsLabelButton.isHidden = true
        } else if aiVitaminNames[indexPath.row].count == 1 {
            let ingredients_1 = aiVitaminNames[indexPath.row][0]

            cell.firstIngredientsLabelButton.setTitle(ingredients_1, for: .normal)
            
            cell.secondIngredientsLabelButton.isHidden = true
            cell.thirdIngredientsLabelButton.isHidden = true
        }
        
        if aiVitaminNames[indexPath.row].count > 3 {
            let count = aiVitaminNames[indexPath.row].count - 3
            cell.overCountLabel.text = "+ \(count)"
            cell.overCountLabel.attributedLabel(text: "\(count)")
            cell.overCountLabel.font = UIFont(name: "NotoSansKR-Bold", size: 17)
        } else {
            cell.overCountLabel.isHidden = true
        }
        
        cell.overCountLabel.snp.makeConstraints { make in
            if !cell.thirdIngredientsLabelButton.isHidden {
                make.top.equalTo(cell.thirdIngredientsLabelButton).offset(-1)
                make.leading.equalTo(cell.thirdIngredientsLabelButton.snp.trailing).offset(5)
            } else if !cell.secondIngredientsLabelButton.isHidden {
                make.top.equalTo(cell.secondIngredientsLabelButton).offset(-1)
                make.leading.equalTo(cell.secondIngredientsLabelButton.snp.trailing).offset(5)
            } else {
                make.top.equalTo(cell.firstIngredientsLabelButton).offset(-1)
                make.leading.equalTo(cell.firstIngredientsLabelButton.snp.trailing).offset(5)
            }
            
            make.width.equalTo(cell.overCountLabel.intrinsicContentSize.width)
            make.height.equalTo(20)
        }
        
        
        cell.firstIngredientsLabelButton_2.setTitle("33333", for: .normal)
        cell.secondIngredientsLabelButton_2.setTitle("44444", for: .normal)
        cell.thirdIngredientsLabelButton_2.setTitle("2222", for: .normal)
        //

        if aiVitaminValues[indexPath.row].count >= 3 {
            let ingredients_1 = aiVitaminValues[indexPath.row][0]
            let ingredients_2 = aiVitaminValues[indexPath.row][1]
            let ingredients_3 = aiVitaminValues[indexPath.row][2]

            cell.firstIngredientsLabelButton_2.setTitle("\(ingredients_1)mg", for: .normal)
            cell.secondIngredientsLabelButton_2.setTitle("\(ingredients_2)mg", for: .normal)
            cell.thirdIngredientsLabelButton_2.setTitle("\(ingredients_3)mg", for: .normal)
            cell.firstIngredientsLabelButton_2.isHidden = false
            cell.secondIngredientsLabelButton_2.isHidden = false
            cell.thirdIngredientsLabelButton_2.isHidden = false
        } else if aiVitaminValues[indexPath.row].count == 2 {
            let ingredients_1 = aiVitaminValues[indexPath.row][0]
            let ingredients_2 = aiVitaminValues[indexPath.row][1]

            cell.firstIngredientsLabelButton_2.setTitle("\(ingredients_1)", for: .normal)
            cell.secondIngredientsLabelButton_2.setTitle("\(ingredients_2)", for: .normal)
            cell.firstIngredientsLabelButton_2.isHidden = false
            cell.secondIngredientsLabelButton_2.isHidden = false
            cell.thirdIngredientsLabelButton_2.isHidden = true
        } else if aiVitaminValues[indexPath.row].count == 1 {
            let ingredients_1 = aiVitaminValues[indexPath.row][0]

            cell.firstIngredientsLabelButton_2.setTitle("\(ingredients_1)", for: .normal)
            cell.firstIngredientsLabelButton_2.isHidden = false
            cell.secondIngredientsLabelButton_2.isHidden = true
            cell.thirdIngredientsLabelButton_2.isHidden = true
        } else {
            cell.firstIngredientsLabelButton_2.isHidden = true
            cell.secondIngredientsLabelButton_2.isHidden = true
            cell.thirdIngredientsLabelButton_2.isHidden = true
        }

        if aiVitaminValues[indexPath.row].count > 3 {
            let count = aiVitaminValues[indexPath.row].count - 3
            cell.overCountLabel_2.text = "+ \(count)"
            cell.overCountLabel_2.attributedLabel(text: "\(count)")
            cell.overCountLabel_2.font = UIFont(name: "NotoSansKR-Bold", size: 17)
        } else {
            cell.overCountLabel_2.isHidden = true
        }
//
//        cell.overCountLabel_2.snp.makeConstraints { make in
//            if !cell.thirdIngredientsLabelButton_2.isHidden {
//                make.top.equalTo(cell.thirdIngredientsLabelButton_2).offset(-1)
//                make.leading.equalTo(cell.thirdIngredientsLabelButton_2.snp.trailing).offset(5)
//            } else if !cell.secondIngredientsLabelButton_2.isHidden {
//                make.top.equalTo(cell.secondIngredientsLabelButton_2).offset(-1)
//                make.leading.equalTo(cell.secondIngredientsLabelButton_2.snp.trailing).offset(5)
//            } else {
//                make.top.equalTo(cell.firstIngredientsLabelButton_2).offset(-1)
//                make.leading.equalTo(cell.firstIngredientsLabelButton_2.snp.trailing).offset(5)
//            }
//
//            make.width.equalTo(cell.overCountLabel_2.intrinsicContentSize.width)
//            make.height.equalTo(20)
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let editAlarmViewController = AIRecommendIngredientsViewController()
        let navigationController = UINavigationController(rootViewController: editAlarmViewController)
        
        editAlarmViewController.vitaminIndex = indexPath.row
            
        show(navigationController, sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
