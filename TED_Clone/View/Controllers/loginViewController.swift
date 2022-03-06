//
//  loginViewController.swift
//  TED_Clone
//
//  Created by 소범석 on 2022/03/05.
//

import UIKit

final class loginViewController: UIViewController {
    // MARK: - 로그인 가이드
    private lazy var loginGuideLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in to TED"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private lazy var loginGuideInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Get a personalized TED experience across all your devices, from Web to apps to TV"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 0
        
        let attrString = NSMutableAttributedString(string: label.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        label.attributedText = attrString
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - 로그인 API
    private lazy var loginButton1: UIButton = {
        let bt = UIButton()
        bt.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bt.layer.cornerRadius = 5
        bt.clipsToBounds = true
        return bt
    }()
    
    private lazy var loginButton2: UIButton = {
        let bt = UIButton()
        bt.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bt.layer.cornerRadius = 5
        bt.clipsToBounds = true
        return bt
    }()
    
    private lazy var loginButton3: UIButton = {
        let bt = UIButton()
        bt.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bt.layer.cornerRadius = 5
        bt.clipsToBounds = true
        return bt
    }()
    
    private lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [loginButton1, loginButton2, loginButton3])
        st.spacing = 25
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    // MARK: - 로그인
    private lazy var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Or use your email"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email address"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        return label
    }()
    
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        // tf.addTarget(self, action: #selector(), for: .editingChanged)
        return tf
    }()
    
    private let loginButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        bt.layer.cornerRadius = 5
        bt.clipsToBounds = true
        bt.setTitle("Continue", for: .normal)
        bt.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        bt.isEnabled = false
        // bt.addTarget(self, action: #selector(), for: .touchUpInside)
        return bt
    }()
    
    // MARK: - 뷰
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = UIColor.backgroundColor
        
        view.addSubview(loginGuideLabel)
        view.addSubview(loginGuideInfoLabel)
        view.addSubview(stackView)
        view.addSubview(emailInfoLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextFieldView)
        view.addSubview(loginButton)

        loginGuideLabel.translatesAutoresizingMaskIntoConstraints = false
        loginGuideInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            loginGuideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginGuideLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
           
            loginGuideInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginGuideInfoLabel.topAnchor.constraint(equalTo: loginGuideLabel.topAnchor, constant: 60),
            loginGuideInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginGuideInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            stackView.topAnchor.constraint(equalTo: loginGuideInfoLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            
            
            
            emailTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextFieldView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            emailTextFieldView.heightAnchor.constraint(equalToConstant: 60),
            
            
            
        ])
        
                
    }
        
    
}

// MARK: - 확장


    


