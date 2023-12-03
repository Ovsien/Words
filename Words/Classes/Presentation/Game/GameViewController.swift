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

    private lazy var gameBoard: GameBoard = {
        GameBoard(viewModel: viewModel)
    }()

// MARK: - Vuew Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
}

extension GameViewController: ViewConfigurable {

    func setupUI() {
        view.backgroundColor = UIColor(resource: .primaryBackground)
    }

    func setupLayout() { 
        view.addSubview(gameBoard)
        gameBoard.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(81)
        }
    }

    func updateUI() { }

    func setupBehaviour() { }
}
