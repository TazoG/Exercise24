//
//  MoviesListDataSource.swift
//  Exercise24
//
//  Created by Mariam Joglidze on 26.02.23.
//

import UIKit

class MoviesListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
        
    private let tableView: UITableView
    private let viewModel: MoviesListViewModel
    private var movies = [MovieViewModel]()
    private let navigation: UINavigationController

    
    init(
        tableView: UITableView,
        viewModel: MoviesListViewModel,
        navigation: UINavigationController
    ){
        self.tableView = tableView
        self.viewModel = viewModel
        self.navigation = navigation
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "MoviesListCell", bundle: nil), forCellReuseIdentifier: "MoviesListCell")
        
        viewModel.fetchMovies()
        viewModel.onReceivedMovies = { movies in
            self.movies = movies
            self.tableView.reloadData()
        }

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListCell", for: indexPath) as! MoviesListCell
        cell.configure(with: movies[indexPath.row])
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let movie = movies[indexPath.row]
        detailVC.movie = movie
        navigation.pushViewController(detailVC, animated: true)
    }
    
}
