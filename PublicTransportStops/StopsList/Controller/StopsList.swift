//
//  StopsList.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 27.02.2022.
//

import UIKit

final class StopsList: UIViewController, StopsListInput {

    private var stopsListView: StopsListView {
        return self.view as! StopsListView
    }
    var stops = [Stop]()
    private let reuseID = "cellID"

    var output: StopsListOutput!
    //MARK: - Life cycle
    override func loadView() {
        super.loadView()
        self.view = StopsListView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Список остановок"
        self.stopsListView.tableView.delegate = self
        self.stopsListView.tableView.dataSource = self
        self.stopsListView.tableView.register(StopCell.self, forCellReuseIdentifier: self.reuseID)
        self.output.requestStopsList()
    }
    //MARK: - StopsListInput
    func reloadData() {
        DispatchQueue.main.async {
            self.stopsListView.tableView.reloadData()
        }
    }
}
//MARK: - UITableViewDelegate
extension StopsList: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stop = stops[indexPath.row]
        self.output.didSelectStop(stop)
    }
}
//MARK: - UITableViewDataSource
extension StopsList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stops.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.stopsListView.tableView.dequeueReusableCell(withIdentifier: self.reuseID,
                                                                          for: indexPath) as?
                StopCell else { return UITableViewCell() }
        cell.configure(stop: stops[indexPath.row])
        return cell
    }


}

