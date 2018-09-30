//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Joaquín Gracia López on 18/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//
import UIKit

class MemberListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var model: [Person]
    
    // MARK: - Initialization
    init(model: [Person]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // FUNDAMENTAL!!!!! No olvidarse de contar al tableview quienes son sus ayudantes (datasource y delegate)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: .houseDidChangeNotification, object: nil) // Object es el que manda la notificacion
    }
    
    
    @objc func houseDidChange(notification: Notification){
        
        // Sacar la info
        guard let info = notification.userInfo, let house = info[Constants.houseKey] as? House
            else { return } // Por ser opcional
        
        
        // Actualizar el modelo
        self.model = house.sortedMembers
        title = house.name
        self.tableView.reloadData()
        
    }
    
}

extension MemberListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellid = "PersonCell"
        
        // Descubrimos la person que hay que mostrar
        let person = model[indexPath.row]
        
        // Creamos la celda (o nos la dan de cache)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        
        // Sincronizar modelo y vista (Person-cell)
        cell?.textLabel?.text = person.name
        cell?.detailTextLabel?.text = person.alias
        return cell!
    }
    
   
}

extension MemberListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thePerson = person(at: indexPath.row)
        let personDetailVC = MemberDetailViewController(model: thePerson)
        navigationController?.pushViewController(personDetailVC, animated: true)
    }
}

extension MemberListViewController {
    func person(at index: Int) -> Person {
        return model[index]
    }
}
