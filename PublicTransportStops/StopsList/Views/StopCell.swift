//
//  StopCell.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 27.02.2022.
//

import UIKit

final class StopCell: UITableViewCell {

    //MARK: - Properties
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private Methods
    private func setConstraints() {
        self.contentView.addSubview(self.label)
        let safeArea = self.contentView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.label.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 6),
            self.label.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -6),
            self.label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
    }
    //MARK: - Public Methods
    public func configure(stop: Stop) {
        self.label.text = stop.name
    }
}
