//
//  AsteroidTableViewController.swift
//  AsteroidChecker
//
//  Created by Owen Barrott on 9/24/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

import UIKit

class AsteroidTableViewController: UITableViewController {

    // MARK: - Outlets
    
    
    // MARK: - Properties
    var asteroids: [Asteroid] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAsteroids()
    }
   
    
    
    
    //MARK: - Helper Methods
    func callAsteroids() {
    AsteroidController.fetchAsteroids { (result) in
            
        DispatchQueue.main.async {
                switch result {
                case .success(let asteroids):
                    self.asteroids = asteroids
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                    print("This has failed horribly!")
                    }
            }
    }
}
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.asteroids.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "asteroidCell", for: indexPath)
            let asteroid = self.asteroids[indexPath.row]
        cell.textLabel?.text = asteroid.name
        cell.detailTextLabel?.text = String(asteroid.estimated_diameter.meters.estimated_diameter_max)
        return cell
    }
}
