//
//  ComposeViewController.swift
//  JunbMemo
//
//  Created by USER on 2020/12/29.
//  Copyright © 2020 junb. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var editTarget: Memo?
    var originalMemoContent: String?
    
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
        
//        let newMemo = Memo(content: memo)
//        Memo.dummyMemoList.append(newMemo)
        
        if let target = editTarget {
            target.content = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
        } else {
            DataManager.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        }
        
        // Notification
        
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let memo = editTarget {
            navigationItem.title = "메모 편집"
            memoTextView.text = memo.content
            originalMemoContent = memo.content
        } else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }
        
        // ViewController를 TextView의 delegate로 지정한다
        memoTextView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.presentationController?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.presentationController?.delegate = nil
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

extension ComposeViewController: UITextViewDelegate {
    // textView에서 text를 변경할 때 마다, 반복적으로 호출된다.
    func textViewDidChange(_ textView: UITextView) {
        /*
            모달 방식으로 동작해야 하는지 결정하는 플래그
            true로 세팅 될 경우 시트가 모달 방식으로 동작하며, pull down될 때 delegate 메서드를 실행한다.
            ios13에서 새롭게 추가된 속성이기 때문에 이전 버전에서는 사용할 수 없다.
            따라서 ios13에서만 사용이 가능하도록 availablity 컨디션을 추가
         */
        if let original = originalMemoContent, let edited = textView.text {
            if #available(iOS 13.0, *) {
                isModalInPresentation = original != edited
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
}

extension ComposeViewController : UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        let alert = UIAlertController(title: "알림", message: "편집한 내용을 저장하시겠습니까?", preferredStyle: .alert)
        
        // 처리할 버튼
        let okAction = UIAlertAction(title: "확인", style: .default) {
            [weak self] (action) in
            self?.save(action)
        }
        
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) {
            [weak self] (action) in
            self?.close(action)
        }
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

// Notification
extension ComposeViewController {
    
    // Notification 선언
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
}
