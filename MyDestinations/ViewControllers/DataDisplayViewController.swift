//
//  DataDisplayViewController.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 19/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit

class DataDisplayViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    private let cellReuseID: String = "displayCell"
    private var destinations: [Destination] = []
    private var selectedDestination: Destination?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Moje destinacije"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadDestinationsFromUserDefaults()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let dataEntryVC = segue.destination as? DataEntryViewController {
            dataEntryVC.delegate = self
        } else if let detailsVC = segue.destination as? DestinationDetailsViewController {
            detailsVC.destination = selectedDestination
        }
    }
}

// MARK: - Load/Store data to NSUserDefaults
extension DataDisplayViewController {
    private func loadDestinationsFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: Destination.userDefaultsKey) {
            let decoder = JSONDecoder()
            do {
                destinations = try decoder.decode([Destination].self, from: data)
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    private func saveDestinationsToUserDefaults() {
        let encoder = JSONEncoder()
        do {
            let data: Data = try encoder.encode(destinations)
            UserDefaults.standard.set(data, forKey: Destination.userDefaultsKey)
            UserDefaults.standard.synchronize()
        } catch {
            print(error)
        }
    }
}

// MARK: - DataEntryViewControllerDelegate
extension DataDisplayViewController: DataEntryViewControllerDelegate {
    func created(newDestination: Destination) {
        
        destinations.append(newDestination)
        tableView.reloadData()
        
        saveDestinationsToUserDefaults()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DataDisplayViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as! DestinationTableViewCell
        
        let destination = destinations[indexPath.row]
        
        cell.config(with: destination.title, subtitle: destination.description, imageUrl: destination.url)
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Brisanje destinacije", message: "Želite li obrisati destinaciju?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Obriši", style: .destructive) {_ in
            self.destinations.remove(at: indexPath.row)
            self.tableView.reloadData()
            self.saveDestinationsToUserDefaults()
        }
        let cancelAction = UIAlertAction(title: "Odustani", style: .cancel, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDestination = destinations[indexPath.row]
        performSegue(withIdentifier: "detailsSegue", sender: self)
    }
}
