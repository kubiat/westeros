//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Joaquín Gracia López on 30/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//

import UIKit
class MemberDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aliasLabel: UILabel!
    //MARK: - Properties
    var model: Person
    init(model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
         syncModelWithView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = model.name
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(personDidChange), name: .personDidChangeNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: .houseDidChangeNotification, object: nil)
        syncModelWithView()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func personDidChange(notification: Notification){
        // Obtenemos la info
        guard let info = notification.userInfo, let person = info[Constants.personKey] as? Person
            else { return }
        
        // Actualizamos el modelo
        self.model = person
        
        // Sincronizamos la vista
        syncModelWithView()
    }
    
    @objc func houseDidChange(notification: Notification){
        
         // Obtenemos la info
        guard let info = notification.userInfo, let house = info[Constants.houseKey] as? House
            else { return }
        
        // Actualizamos el modelo
        let houseDetailViewController = HouseDetailViewController(model: house)
        navigationController?.pushViewController(houseDetailViewController, animated: true)
        navigationController?.viewControllers = [houseDetailViewController]
        
        // Sincronizamos la vista
        syncModelWithView()
    }
    
      //MARK: - Sync
    func syncModelWithView(){
        nameLabel.text =  model.name
        aliasLabel.text = model.alias
        self.title = model.name
    }    
}
