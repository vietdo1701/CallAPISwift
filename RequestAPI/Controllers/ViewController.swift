//
//  ViewController.swift
//  RequestAPI
//
//  Created by leo asula on 31/08/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tbvDataList: UITableView!
    
    var universities = [University]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tbvDataList.dataSource = self
        tbvDataList.delegate = self
        
        let service = Service(baseUrl: "http://universities.hipolabs.com/search?country=United+States")
        service.getAllUniversities()
        service.completionHandle { universities, state, mess in
            if state {
                //guard let self = self else {return}
                guard let _universities = universities else {return}
                self.universities = _universities
                self.tbvDataList.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (universities.count > 20 ? 20 : universities.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvDataList.dequeueReusableCell(withIdentifier: "cellForData") as! cellForData
        let university = universities[indexPath.row]
        
        cell.lbNameUni.text = university.name
        cell.lbCountryUni.text = university.country
        cell.lbAlphaCodeUni.text = university.alpha_two_code
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

