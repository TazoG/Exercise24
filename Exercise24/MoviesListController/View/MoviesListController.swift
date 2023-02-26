//
//  MoviesListController.swift
//  Exercise24
//
//  Created by Mariam Joglidze on 26.02.23.
//

import UIKit

class MoviesListController: UIViewController {
   
    

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: MoviesListViewModel!
    private var dataSource: MoviesListDataSource!
    private var moviesService: MoviesService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureViewModel()
    }
    
    private func configureViewModel() {
        moviesService = MoviesService(webServiceManager: WebServiceManager())
        viewModel = MoviesListViewModel(moviesService: moviesService)
        dataSource = MoviesListDataSource(tableView: tableView, viewModel: viewModel, navigation: navigationController!)
        
    }

    
   
   

}
