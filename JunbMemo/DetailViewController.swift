//
//  DetailViewController.swift
//  JunbMemo
//
//  Created by USER on 2021/01/03.
//  Copyright © 2021 junb. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // View Controller가 초기화 되는 시점에는 값이 존재하지 않기 때문에 옵셔널로 선언
    // 이전화면에서 전달한 메모가 저장된다.
    var memo: Memo?
    
    @IBOutlet weak var memoTableView: UITableView!
    
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        
        return f
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? ComposeViewController {
            vc.editTarget = memo
        }
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        token = NotificationCenter.default.addObserver(
            forName: ComposeViewController.memoDidChange,
            object: nil,
            queue: OperationQueue.main,
            using: {[weak self] (noti) in self?.memoTableView.reloadData()}
        )
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITableViewDataSource {
    // table view가 표시할 cell 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // table view가 어떤 cell을 표시할 지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            
            cell.textLabel?.text = memo?.content
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            
            return cell
        default:
            fatalError()
        }
    }
    
    
}
