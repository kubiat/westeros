//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Joaquín Gracia López on 30/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//

import UIKit

protocol EpisodeListViewControllerDelegate: class {
    func episodeListViewController(_ vc:EpisodeListViewController)
}

class EpisodeListViewController: UIViewController {
   // @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    // Mark: - Properties
    var model: [Episode]
    weak var delegate: EpisodeListViewControllerDelegate?
    
    // Mark: - Initialization
    init(model: [Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange), name: Notification.Name(Constants.seasonDidChangeNotificationName), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func seasonDidChange(notification: Notification) {        
        guard let info = notification.userInfo else {
            return
        }
        let season = info[Constants.seasonKey] as? Season
        
        // Actualizar el modelo
        guard let model = season?.sortedEpisodes else { return }
        self.model = model
        
        // Sincronizar la vista
        tableView.reloadData()
    }
}

extension EpisodeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "EpsidodeCell"
        
        // Descubrir la persona que tenemos que mostrar
        let episode = model[indexPath.row]
        
        // Preguntar por una celda (a una cache) o Crearla
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // Sicronizar celda y persona
        cell.textLabel?.text = "\(episode.name) => \(episode.releaseDateString)"
        
        // Devolver la celda
        return cell
    }
}

extension EpisodeListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        let episodeDetailViewController = EpisodeDetailViewController(model: episode)
        navigationController?.pushViewController(episodeDetailViewController, animated: true)
        
        delegate?.episodeListViewController(self)
    }
}
