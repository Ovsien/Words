//
//  StartViewController.swift
//  Words
//
//  Created by Alexandr Ovsienko on 29.11.2023.
//

import UIKit
import SnapKit

final class StartViewController: UIViewController {
    var viewModel: StartViewModeling!

    // MARK: - Views
    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = Spacing.px18
        return stack
    }()

    private lazy var startButton: PrimaryButton = {
        PrimaryButton(
            title: NSLocalizedString(
                "startGame.button.title",
                comment: ""
            ),
            action: #selector(startGame),
            target: self
        )
    }()

    private lazy var continueButton: PrimaryButton = {
        PrimaryButton(
            title: NSLocalizedString(
                "continueGame.button.title",
                comment: ""
            ),
            action: #selector(continueGame),
            target: self
        )
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViewController()
    }

    // MARK: - Functions
    @objc private func startGame() {
        viewModel.transitionToNewGame()
    }

    @objc private func continueGame() {
        viewModel.transitionToContinueGame()
    }
}

// MARK: - View Configurable
extension StartViewController: ViewConfigurable {
    func setupUI() {
        view.backgroundColor = UIColor(resource: .primaryBackground)
    }

    func setupLayout() {
        view.addSubview(buttonStack)
        buttonStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(EdgesInset.px40)
        }

        if viewModel.isGameInProgress() {
            buttonStack.addArrangedSubview(continueButton)
            continueButton.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(Height.px56)
            }
        }
        
        buttonStack.addArrangedSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Height.px56)
        }
    }

    func updateUI() { }

    func setupBehaviour() { }
}
