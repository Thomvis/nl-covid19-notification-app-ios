//
//  StatusCardView.swift
//  EN
//
//  Created by Thomas Visser on 14/06/2020.
//

import Foundation
import UIKit

final class StatusCardView: View {
    private let container = UIStackView()
    private let header = UIStackView()

    private let headerIconView = StatusIconView()
    private let headerTitleLabel = Label()

    private let descriptionLabel = Label()
    private let button = Button()

    override func build() {
        super.build()

        backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layer.cornerRadius = 12

        // container
        container.axis = .vertical
        container.spacing = 16

        //  header
        header.axis = .horizontal
        header.spacing = 16
        header.alignment = .center

        //   headerIconView
        header.addArrangedSubview(headerIconView)

        //   headerTitleLabel
        headerTitleLabel.numberOfLines = 0
        headerTitleLabel.preferredMaxLayoutWidth = 1000
        header.addArrangedSubview(headerTitleLabel)

        container.addArrangedSubview(header)

        //  descriptionLabel
        descriptionLabel.numberOfLines = 0
        container.addArrangedSubview(descriptionLabel)

        //  button
        button.layer.cornerRadius = 8
        container.addArrangedSubview(button)

        addSubview(container)
    }

    override func setupConstraints() {
        super.setupConstraints()

        container.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            container.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            container.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),

            headerIconView.widthAnchor.constraint(equalToConstant: 48),
            headerIconView.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    func update(with viewModel: StatusCardViewModel) {
        headerIconView.update(with: viewModel.icon)
        headerTitleLabel.attributedText = viewModel.title
        descriptionLabel.attributedText = viewModel.description

        button.setTitle(viewModel.button.title, for: .normal)
        button.style = viewModel.button.style
    }
}
