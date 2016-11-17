//
//  ViewController.swift
//  iOS-AddressList-swift
//
//  Created by pxh on 2016/11/11.
//  Copyright © 2016年 pxh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height
    
    
    
    var naviTitle : String?
    
    var indexArray : NSMutableArray? = NSMutableArray()
    
    var letterResultArray : NSMutableArray? = NSMutableArray()
    
    var sectionTitleView : UILabel?
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
        setUpNavi()
        loadListData()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    func setUpNavi(){
        self.navigationItem.title = naviTitle
    }
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView.init()
       
    }
    func loadListData(){
        
        sectionTitleView = UILabel.init(frame: CGRect.init(x: (kScreenWidth - 100) * 0.5, y: (kScreenHeight - 100) * 0.5, width: 100, height: 100))
        sectionTitleView?.textAlignment = NSTextAlignment.center
        sectionTitleView?.font = UIFont.boldSystemFont(ofSize: 60)
        sectionTitleView?.textColor = UIColor.blue
        sectionTitleView?.backgroundColor = UIColor.white
        sectionTitleView?.layer.cornerRadius = 6
        sectionTitleView?.layer.borderWidth = 0.3 * UIScreen.main.scale
        sectionTitleView?.layer.borderColor = UIColor.lightGray.cgColor
        sectionTitleView?.isHidden = true
        
        self.navigationController?.view.addSubview(sectionTitleView!)
        
        let cellContents = ["A","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","爱时尚的小姑娘","爱吃糖的甜甜猪","爱提问的波波","巴拉拉小魔仙","不夜城"]
        indexArray = ChineseString.indexArray(cellContents)
        letterResultArray = ChineseString.letterSortArray(cellContents)
    }
    //MARK:- tableview delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    //MARK:- tableview dataSource
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return (indexArray! as NSArray) as? [String]
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return indexArray?.object(at: section) as? String
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return (indexArray?.count)!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (letterResultArray![section] as AnyObject).count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier : String = "tableviewCell\(indexPath.row)"
         tableView.register(UINib.init(nibName: "WondSubDetailTableCell", bundle: Bundle.main), forCellReuseIdentifier: identifier)
        let cell : WondSubDetailTableCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! WondSubDetailTableCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        let sectionTitles : NSArray = letterResultArray?.object(at: indexPath.section) as! NSArray
        cell.cellTitle.text = sectionTitles.object(at: indexPath.row) as? String
//        if indexPath.row == 0{
//            cell.isPlay = true
//        }
        return cell
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        showSectionTitle(title)
        return index
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 20))
        view.backgroundColor = UIColor.groupTableViewBackground
        let label = UILabel.init(frame: CGRect.init(x: 40, y: 0, width: kScreenWidth - 50, height: 20))
        label.backgroundColor = UIColor.groupTableViewBackground
        label.text = indexArray?[section] as? String
        label.textColor = UIColor.black
        view.addSubview(label)
        return view
    }
    //private mothed
    func showSectionTitle(_ sender : String){
        sectionTitleView?.text = sender
        sectionTitleView?.isHidden = false
        sectionTitleView?.alpha = 1.0
        timer?.invalidate()
        timer = nil
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSelector), userInfo: nil, repeats: false)
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
    }
    func timerSelector(_ timer : Timer){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.sectionTitleView?.alpha = 0
                }, completion: { (finished) in
                    self.sectionTitleView?.isHidden = true
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

