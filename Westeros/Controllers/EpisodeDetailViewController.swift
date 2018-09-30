//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Joaquín Gracia López on 30/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var digestText: UITextView!
    var model: Episode

    //MARK: - Initialization
    
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelEpisodeDetail()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Sync
    func syncModelEpisodeDetail(){
        nameLabel.text = model.name
        dateLabel.text = model.releaseDateString
        digestText.text = model.digest
    }
    
}

extension EpisodeDetailViewController: EpisodeListViewControllerDelegate{
    func episodeListViewController(_ vc: EpisodeListViewController) {
        navigationController?.pushViewController(self, animated: true)
    }
}

