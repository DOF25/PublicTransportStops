//
//  DetailController.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import UIKit

final class DetailController: UIViewController, DetailViewInput {
    private var detailView: DetailView {
        return self.view as! DetailView
    }
    private let roughtCellID = "DetailCell"
    var stopDetails: StopDetails?
    
    var output: DetailViewOutput!

    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        self.view = DetailView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output.requestStopDetails()
        self.detailView.tableView.delegate = self
        self.detailView.tableView.dataSource = self
        self.detailView.tableView.register(RoughtCell.self, forCellReuseIdentifier: self.roughtCellID)
        configureNameLabel()
    }
    //MARK: - DetailViewInput
    func reloadData() {
        self.detailView.tableView.reloadData()
    }
    func configureNameLabel() {
        self.detailView.nameLabel.text = self.output.getStopName()
    }
}
//MARK: - UITableViewDataSource
extension DetailController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let stopDetails = stopDetails else { return 0 }
        return stopDetails.routePath.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.detailView.tableView.dequeueReusableCell(withIdentifier: self.roughtCellID, for: indexPath) as? RoughtCell else { return UITableViewCell() }
        guard let stopDetails = stopDetails else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(stopDetails.routePath[indexPath.row])
        return cell
    }


}
//MARK: - UITableViewDelegate
extension DetailController: UITableViewDelegate {}
