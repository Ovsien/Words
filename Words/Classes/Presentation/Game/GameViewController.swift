//
//  GameViewController.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {
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

    @objc func backButtonTapped() {
        viewModel.backButtonTapped()
    }
}

extension GameViewController: ViewConfigurable {

    func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(resource: .primaryBackground)
    }

    func setupLayout() {
        let gameBoardSidePadding: CGFloat = 16
        let gameBoardTopOffset: CGFloat = 81


        view.addSubview(customNavigationBar)
        customNavigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }

        view.addSubview(gameBoard)
        gameBoard.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(gameBoardSidePadding)
            make.top.equalTo(customNavigationBar.snp.bottom).offset(gameBoardTopOffset)
        }
    }

    func updateUI() { }

    func setupBehaviour() { }
}
