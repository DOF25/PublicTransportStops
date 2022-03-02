//
//  RoughtCell.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import UIKit

final class RoughtCell: UITableViewCell {
    //MARK: - Properties
    private let transportImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .yellow
        return imageView
    }()
    private let roughtNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.text = "879"
        return label
    }()
    private let arrivalTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.text = "25 min"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private Methods
    private func setConstraints() {
        self.contentView.addSubview(transportImageView)
        self.contentView.addSubview(roughtNumberLabel)
        self.contentView.addSubview(arrivalTimeLabel)
        let stackView = UIStackView(arrangedSubviews: [self.transportImageView, self.roughtNumberLabel, self.arrivalTimeLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(stackView)
        let safeArea = self.contentView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 4),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -4),
            stackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            self.transportImageView.heightAnchor.constraint(equalToConstant: 30),
            self.transportImageView.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    //MARK: - Public Methods
    public func configure(_ stopDetails: RoutePath) {
        self.transportImageView.image = UIImage(named: "Bus")
        self.roughtNumberLabel.text = "№ \(stopDetails.number)"
        let arrivalTime = stopDetails.timeArrival.first
        self.arrivalTimeLabel.text = "\(arrivalTime ?? "")"
    }

}
