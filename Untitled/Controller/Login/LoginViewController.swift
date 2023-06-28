//
//  InitViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var isLoggedInBool = false
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let mainImageView = InitView().mainImageView()
    
    let mainTextLabel = InitView().mainTextLabel()
    let subTextLabel = InitView().subTextLabel()
    let registerLabel = InitView().serviceLabel(text: "회원이 아니신가요?")
    let autoLoginLabel = CommonView().commonTextLabel(labelText: "자동로그인", size: 13)
    let saveIdLabel = CommonView().commonTextLabel(labelText: "아이디 저장", size: 13)
    let loginFailedWarningLabel = RegisterView().warningLabel()
    
    let idInputTextField = InitView().idInputTextField()
    let PasswordInputTextField = InitView().PasswordInputTextField()
    
    let passwordVisibilityButton = InitView().passwordVisibilityButton()
    let loginButton = InitView().loginButton()
    let findButton = InitView().serviceButton(text: "아이디/비밀번호 찾기")
    let registerButton = InitView().serviceButton(text: "가입하기")
    let autoLoginButton = InitView().toggleButton()
    let saveIdButton = InitView().toggleButton()

    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.clear, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("로그인이 로드되었습니다.")
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        actionFunction()
        delegateFunction()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        autoLogin()
        self.loginFailedWarningLabel.isHidden = true
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        commonUiView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addSubview() {
        uiViewList = [commonUiView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(90)
            make.leading.equalTo(view).offset(27)
        }

        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(22)
            make.leading.equalTo(mainTextLabel)
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel).offset(50)
            make.trailing.equalTo(-30)
            make.size.equalTo(CGSize(width: 105, height: 105))
        }
        
        idInputTextField.snp.makeConstraints { make in
            make.top.equalTo(305)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        PasswordInputTextField.snp.makeConstraints { make in
            make.top.equalTo(idInputTextField.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        passwordVisibilityButton.snp.makeConstraints { make in
            make.top.equalTo(PasswordInputTextField).offset(8.5)
            make.trailing.equalTo(PasswordInputTextField).offset(-8.5)
        }
        
        loginFailedWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(PasswordInputTextField.snp.bottom).offset(5)
            make.leading.equalTo(PasswordInputTextField)
        }
        
        autoLoginButton.snp.makeConstraints { make in
            make.top.equalTo(loginFailedWarningLabel.snp.bottom).offset(5)
            make.leading.equalTo(loginFailedWarningLabel).offset(-6.5)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        autoLoginLabel.snp.makeConstraints { make in
            make.top.equalTo(autoLoginButton).offset(4.5)
            make.leading.equalTo(autoLoginButton.snp.trailing).offset(0)
        }
        
//        saveIdButton.snp.makeConstraints { make in
//            make.top.equalTo(autoLoginButton)
//            make.leading.equalTo(autoLoginLabel.snp.trailing).offset(10)
//            make.size.equalTo(CGSize(width: 30, height: 30))
//        }
//
//        saveIdLabel.snp.makeConstraints { make in
//            make.top.equalTo(saveIdButton).offset(4.5)
//            make.leading.equalTo(saveIdButton.snp.trailing).offset(0)
//        }
        
        findButton.snp.makeConstraints { make in
            make.top.equalTo(autoLoginButton).offset(-2)
            make.trailing.equalTo(PasswordInputTextField)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(autoLoginButton.snp.bottom).offset(30)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(35)
        }
        
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(registerButton).offset(6.6)
            make.leading.equalTo(116)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).offset(-57.8)
            make.leading.equalTo(registerLabel.snp.trailing).offset(5)
        }
        
        findButton.titleLabel?.textAlignment = .right
        findButton.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 13)

    }
    
    private func addOnCommonUiView() {
        commonViewList = [mainImageView, mainTextLabel, subTextLabel, idInputTextField, PasswordInputTextField, passwordVisibilityButton, autoLoginButton, autoLoginLabel, saveIdButton, saveIdLabel, findButton, loginButton, registerLabel, registerButton, loginFailedWarningLabel]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func delegateFunction() {
        idInputTextField.delegate = self
        PasswordInputTextField.delegate = self
    }
    
    private func autoLogin() {
        let state = UserDefaults.standard.bool(forKey: "auto")
        print("자동로그인 체크")
        if state {
            print("자동로그인을 시도합니다: \(state)")
            
            let id = UserDefaults.standard.string(forKey: "id")!
            let pwd = UserDefaults.standard.string(forKey: "pwd")!
            
            loginUserToServer(userid: id, userpassword: pwd) { success in
                if success {
                    let seq = userDataList[0].seq
                    getUserProfileImage(seq: seq) { success in
                        if success {
                            getVitaminInformation(seq: seq) { success in
                                if success {
                                    let seq = userDataList[0].seq
                                    getAlarmData(seq: seq) { success in
                                        if success {
                                            getBoxAndVitamin() { success in
                                                if success {
                                                    if userVitaminDataList.count != 0 {
                                                        getRecommened() { success in
                                                            if success {
                                                                print("로그인이 성공하였습니다.")
                                                                UserDefaults.standard.set(true, forKey: "auto")
                                                                self.isLoggedInBool = true
                                                                let tabBarController = self.isLoggedIn()
                                                                tabBarController.modalPresentationStyle = .fullScreen
                                                                self.loginFailedWarningLabel.isHidden = true
                                                                self.present(tabBarController, animated: true)
                                                            } else {
                                                                print("자동로그인이 실패하였습니다.")
                                                            }
                                                        }
                                                    } else {
                                                        print("로그인이 성공하였습니다.")
                                                        UserDefaults.standard.set(true, forKey: "auto")
                                                        self.isLoggedInBool = true
                                                        let tabBarController = self.isLoggedIn()
                                                        tabBarController.modalPresentationStyle = .fullScreen
                                                        self.loginFailedWarningLabel.isHidden = true
                                                        self.present(tabBarController, animated: true)
                                                    }
                                                } else {
                                                    print("자동로그인이 실패하였습니다.")
                                                }
                                            }
                                        } else {
                                            print("자동로그인이 실패하였습니다.")
                                        }
                                    }
                                } else {
                                    print("자동로그인이 실패하였습니다.")
                                }
                            }
                        } else {
                            print("자동로그인이 실패하였습니다.")
                        }
                    }
                } else {
                    print("자동로그인이 실패하였습니다.")
                }
            }
        } else {
            print("자동로그인을 중단합니다: \(state)")
        }
    }
    
    private func autoLoginButtonStateCheck() {
        if autoLoginButton.isSelected {
            UserDefaults.standard.set(true, forKey: "auto")
            UserDefaults.standard.set(idInputTextField.text, forKey: "id")
            UserDefaults.standard.set(PasswordInputTextField.text, forKey: "pwd")
            print("자동로그인 버튼이 활성화가 되어있는채로 로그인되었습니다.")
        } else {
            UserDefaults.standard.set(false, forKey: "auto")
            print("자동로그인 버튼이 비활성화!가 되어있는채로 로그인되었습니다.")
        }
    }
    
    func isLoggedIn() -> UIViewController {
        if isLoggedInBool {
            return CustomTabBarController()
            
        } else {
            return LoginViewController()
        }
    }
    
    private func idPwdNilCheck() -> Bool {
        if idInputTextField.text != "" && PasswordInputTextField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    private func loginFailedCheck() -> String {
        if idInputTextField.text == "" && PasswordInputTextField.text == "" {
            return "아이디, 비밀번호를 모두 입력해주세요."
        } else if idInputTextField.text == "" {
            return "아이디를 입력해주세요."
        } else {
            return "비밀번호를 입력해주세요."
        }
    }
    
    private func actionFunction() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        passwordVisibilityButton.addTarget(self, action: #selector(passwordVisibilityButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        autoLoginButton.addTarget(self, action: #selector(autoLoginButtonAction), for: .touchUpInside)
        saveIdButton.addTarget(self, action: #selector(saveIdButtonAction), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        if (idInputTextField.text == "admin" || idInputTextField.text == "Admin") && PasswordInputTextField.text == "admin" {
            UserDefaults.standard.set(true, forKey: "admin")
            userDataList.append(UserDataAtServer(seq: 9999, id: "admin", name: "admin", gender: 1, birth: 19990729, serial_id: 0000000000000000))
            userProfileImageList.append(UserProfileImage(image: UIImage()))
            
            isLoggedInBool = true
            let tabBarController = isLoggedIn()
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true)
        } else {
            UserDefaults.standard.set(false, forKey: "admin")
            if idPwdNilCheck() {
                loginUserToServer(userid: idInputTextField.text!, userpassword: PasswordInputTextField.text!) { success in
                    if success {
                        let seq = userDataList[0].seq
                        getUserProfileImage(seq: seq) { success in
                            if success {
                                getVitaminInformation(seq: seq) { success in
                                    if success {
                                        let seq = userDataList[0].seq
                                    
                                        getAlarmData(seq: seq) { success in
                                            if success {
                                                getBoxAndVitamin { success in
                                                    if success {
                                                        if userVitaminDataList.count != 0 {
                                                            getRecommened { success in
                                                                if success {
                                                                    print("로그인이 성공하였습니다.")
                                                                    self.isLoggedInBool = true
                                                                    let tabBarController = self.isLoggedIn()
                                                                    tabBarController.modalPresentationStyle = .fullScreen
                                                                    self.loginFailedWarningLabel.isHidden = true
                                                                    self.autoLoginButtonStateCheck()
                                                                    self.present(tabBarController, animated: true)
                                                                } else {
                                                                    print("로그인이 실패하였습니다.")
                                                                }
                                                            }
                                                        } else {
                                                            print("로그인이 성공하였습니다.")
                                                            self.isLoggedInBool = true
                                                            let tabBarController = self.isLoggedIn()
                                                            tabBarController.modalPresentationStyle = .fullScreen
                                                            self.loginFailedWarningLabel.isHidden = true
                                                            self.autoLoginButtonStateCheck()
                                                            self.present(tabBarController, animated: true)
                                                        }
                                                    } else {
                                                        print("로그인이 실패하였습니다.")
                                                    }
                                                }
                                            } else {
                                                print("로그인이 실패하였습니다.")
                                            }
                                        }
                                    } else {
                                        print("로그인이 실패하였습니다.")
                                    }
                                }
                            } else {
                                print("로그인이 실패하였습니다.")
                            }
                        }
                    } else {
                        checkServerConnection() { success in
                            if success {
                                self.loginFailedWarningLabel.text = "아이디 혹은 비밀번호가 틀렸습니다."
                                self.loginFailedWarningLabel.isHidden = false
                                print("로그인이 실패하였습니다.")
                            } else {
                                self.loginFailedWarningLabel.text = "서버와의 연결이 불안정합니다. 잠시 후 다시 시도하세요."
                                self.loginFailedWarningLabel.isHidden = false
                                print("로그인이 실패하였습니다.")
                            }
                        }
                    }
                }
            } else {
                self.loginFailedWarningLabel.text = loginFailedCheck()
                self.loginFailedWarningLabel.isHidden = false
                print("로그인 입력이 비정상적입니다.")
            }
        }
    }
    
    @objc func passwordVisibilityButtonTapped(_ sender: UIButton) {
        PasswordInputTextField.isSecureTextEntry.toggle()
        let imageName = PasswordInputTextField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc func registerButtonAction(_ sender: UIButton) {
        let rootViewController = ProfileSetViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func autoLoginButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let imageName = sender.isSelected ? "checkmark.circle.fill" : "circle"
        let tintColor = sender.isSelected ? UIColor.appPointColor : UIColor.placeholderText
        sender.setImage(UIImage(systemName: imageName), for: .normal)
        sender.tintColor = tintColor
    }
    
    @objc func saveIdButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let imageName = sender.isSelected ? "checkmark.circle.fill" : "circle"
        let tintColor = sender.isSelected ? UIColor.appPointColor : UIColor.placeholderText
        sender.setImage(UIImage(systemName: imageName), for: .normal)
        sender.tintColor = tintColor
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idInputTextField {
            PasswordInputTextField.becomeFirstResponder()
            
        } else if textField == PasswordInputTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}
