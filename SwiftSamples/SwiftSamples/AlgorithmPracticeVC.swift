//
//  AlgorithmPracticeVC.swift
//  SwiftSamples
//
//  Created by Hari on 18/06/19.
//  Copyright © 2019 Hari. All rights reserved.
//

import UIKit

class AlgorithmPracticeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("insertation sort \(insertionSort([2,5,78,71,6,1,9]))")
        print("insertation sort \(insertionSortWithoutSwap([2,5,78,71,6,1,9]))")
        // Do any additional setup after loading the view.
    }
    func insertionSort(_ array: [Int]) -> [Int] {
        var a = array             // 1
        for x in 1..<a.count {         // 2
            var y = x
            while y > 0 && a[y] < a[y - 1] { // 3
                a.swapAt(y - 1, y)
                y -= 1
            }
        }
        return a
    }
    
    
    
    func insertionSortWithoutSwap(_ array: [Int]) -> [Int] {
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && temp < a[y - 1] {
                a[y] = a[y - 1]                // 1
                y -= 1
            }
            a[y] = temp                      // 2
        }
        return a
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
