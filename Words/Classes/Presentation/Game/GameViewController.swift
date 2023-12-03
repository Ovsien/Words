//
//  GameViewController.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {

    private struct Constants {
        static let gameBoardSidePadding: CGFloat = 16
        static let gameBoardTopOffset: CGFloat = 81
    }

    var viewModel: GameViewModeling!

    private lazy var customNavigationBar: CustomNavigationBar = {
        CustomNavigationBar(
            title: NSLocalizedString(
                "gameScreen.title",
                comment: ""
            ),
            target: self,
            action: #selector(backButtonTapped)
        )
    }()

    private lazy var gameBoard: GameBoard = {
        GameBoard(viewModel: viewModel)
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let firstEmptyTextField = gameBoard.textFields.flatMap({ $0 }).first(where: { $0.text?.isEmpty ?? true }) {
            firstEmptyTextField.isEnabled = true
            firstEmptyTextField.becomeFirstResponder()
        }
    }

    @objc func backButtonTapped() {
        viewModel.backButtonTapped()
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height + 40

            gameBoard.snp.updateConstraints { make in
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-keyboardHeight)
            }

            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

extension GameViewController: ViewConfigurable {

    func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(resource: .primaryBackground)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    func setupLayout() {
        view.addSubview(customNavigationBar)
        customNavigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }

        view.addSubview(gameBoard)
        gameBoard.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.gameBoardSidePadding)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.gameBoardTopOffset + customNavigationBar.frame.height)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
        }
    }

    func updateUI() { }

    func setupBehaviour() { }
}
