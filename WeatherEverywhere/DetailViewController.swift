//
//  DetailViewController.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 8/4/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit
import RxSwift
import ExpandableCell

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: ExpandableTableView! {
        didSet {
            tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "detailTableCell")
            tableView.register(UINib(nibName: "AnimatedTableViewCell", bundle: nil), forCellReuseIdentifier: "AnimatedTableViewCell")
        }
    }
    @IBOutlet weak var tableviewIndicator: UIActivityIndicatorView!
    
    
    fileprivate let bag = DisposeBag()
    var viewModel : OpenWeatherViewModel!
    
    var mainObject : OWResponse! {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self!.tableView.reloadData()
            }
        }
    }
    
    var detailObject : OWList! {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self!.tableviewIndicator.stopAnimating()
                self!.tableviewIndicator.isHidden = true
                self!.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        getWeatherFromOpenweather()
        tableView.expandableDelegate = self
        tableviewIndicator.style = .gray
    }
    
    private func getWeatherFromOpenweather(){
        
        viewModel.openWeatherResponse.subscribe({ [weak self] event in
            if event.error != nil {
                let alert = UIAlertController(title: "Error", message: "Unfortunately there is no weather information for this area at this moment . Please try again.", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { [weak self] action in
                    self!.navigationController?.popViewController(animated: true)
                })
                alert.addAction(action)
                self?.present(alert, animated: true, completion: nil)
            }
            guard let dataSource = event.element else {
                return
            }
            self!.mainObject = dataSource
        }).disposed(by: bag)
    }
}

extension DetailViewController : ExpandableDelegate {
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        return [500]
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "detailTableCell") as! TableViewCell
        cell.config(object: mainObject.list![indexPath.section])
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return [cell]
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : AnimatedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AnimatedTableViewCell") as! AnimatedTableViewCell
        cell.config(model: mainObject.list![indexPath.section])
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
    
    func numberOfSections(in expandableTableView: ExpandableTableView) -> Int {
        guard let datasource = mainObject else {
            return 0
        }
        return datasource.list!.count
    }
    
    @objc(expandableTableView:didCloseRowAt:) func expandableTableView(_ expandableTableView: UITableView, didCloseRowAt indexPath: IndexPath) {
        let cell = expandableTableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        cell?.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    }
    
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? AnimatedTableViewCell
        cell?.rotateArrow()
    }
    
}
