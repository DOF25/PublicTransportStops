//
//  DetailView.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import UIKit

final class DetailView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        return tableView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private Methods
    private func setConstraints() {
        self.addSubview(tableView)
        self.addSubview(nameLabel)
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 25),
            self.nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 6),
            self.nameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -6),
            self.tableView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 6),
            self.tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            self.tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            self.tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0)
        ])
    }
}
