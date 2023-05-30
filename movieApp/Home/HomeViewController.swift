//
//  ViewController.swift
//  movieApp
//
//  Created by Fabiana Limma on 29/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Filmes Populares"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var items: [Movie] = [
        Movie(id: 1, title: "Órfã 2: A Origem", releaseDate: "2022-07-27", image: nil, overview: "", voteAverage: 7.2),
        Movie(id: 2, title: "Minions 2: A Origem de Gru", releaseDate: "2022-06-29", image: nil, overview: "", voteAverage: 7.8),
        Movie(id: 3, title: "Thor: Amor e Trovão", releaseDate: "2022-07-06", image: nil, overview: "", voteAverage: 6.8),
        Movie(id: 4, title: "Avatar", releaseDate: "2009-12-18", image: nil, overview: "", voteAverage: 8.8),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.gradientBackground(
            colorOne: .blueMovie,
            colorTwo: .blackMovie
        )
        tableView.backgroundColor = .clear
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        

        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 52).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 42).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = items[indexPath.item].title
        cell.backgroundColor = .clear
        return cell
    }
}
