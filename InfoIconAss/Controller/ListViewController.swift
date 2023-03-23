//
//  ListViewController.swift
//  InfoIconAss
//
//  Created by APPLE on 20/03/23.
//

import UIKit

class ListViewController: UIViewController {
    
    
    @IBOutlet var tblList: UITableView!
    private var viewModel:ListViewModel!
    var listValues:[ListModel] = []
    
    @IBAction func btnAddProduct(_ sender: UIBarButtonItem) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController)!
    
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceCall()
        tblList.register(UINib(nibName: "ListnewTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ListnewTableViewCell")
    }
    
    func serviceCall(){
        let httpUility = HttpUtility()
        self.viewModel = ListViewModel(httpUility: httpUility)
        self.viewModel.callFuncToGetProductList()
        viewModel.bindListViewToController = {
            DispatchQueue.main.async {
                self.tblList.reloadData()
            }
        }
        viewModel.bindErrorViewModelToController = {
            DispatchQueue.main.async {
                UIAlertController.showAlertError(
                    message: self.viewModel.error.localizedDescription, view: self)
            }
        }
    }
    
    
}

extension
ListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listData = viewModel.listdata else{
            return 0
        }
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListnewTableViewCell", for: indexPath) as? ListnewTableViewCell else {
           
            return UITableViewCell()
            
        }
        cell.Delegate = self
        cell.Detailnext.tag = indexPath.row
        cell.setUPCell(productList: viewModel.listdata[indexPath.row])
        cell.Detailnext.tag = indexPath.row
        cell.Detailnext.addTarget(self, action: #selector(toDetailScreen(sender:)), for: .touchUpInside)
        return cell
    }
    }
extension ListViewController:cellDelegate{
    
    @objc func toDetailScreen(sender: UIButton){
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController)!
        vc.productID = "\(viewModel.listdata[sender.tag].id)" 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func cellbtntapped(tag: Int) {
//        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController)!
//        
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
    

