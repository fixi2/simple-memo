//
//  ComposeViewController.swift
//  JunbMemo
//
//  Created by USER on 2020/12/29.
//  Copyright © 2020 junb. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        // code에서 textview에 접근하기 위해 outlet사용
        guard let memo = memoTextView.text,
            memo.count > 0 else {
                alert(message: "Please check memo: content is empty")
            return
        }
        
        let newMemo = Memo(content: memo)
        Memo.dummyMemoList.append(newMemo)
        
        // Notification
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

// Notification
extension ComposeViewController {
    
    // Notification 선언
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
}
