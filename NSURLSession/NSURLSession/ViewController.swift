//
//  ViewController.swift
//  NSURLSession
//
//  Created by Marcello Chuahy on 15/11/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var paises: [Pais] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    // MARK: - Methods
    func loadData() {
        
        if let url = URL(string: "https://applause.codes/api/v1/paisesecapitais") {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        
                        self.paises = try JSONDecoder().decode([Pais].self, from: data)
                        
                        /*
                         print("Países encontrados: \(self.paises.count)")
                         
                         for pais in self.paises {
                         print("País: \(pais.pais) | Capital: \(pais.capital)")
                         }
                         */
                        
                        DispatchQueue.main.async { [weak self] in
                            self?.tableView.reloadData()
                        }
                        
                    } catch let error {
                        print(error)
                    }
                    
                }
            }.resume()
            
        }
        
    }
    
    // Mark: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = paises[indexPath.row].pais
        cell.detailTextLabel?.text = paises[indexPath.row].capital
        return cell
    }
    
    // Mark: - Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(paises[indexPath.row])
    }
    
}
