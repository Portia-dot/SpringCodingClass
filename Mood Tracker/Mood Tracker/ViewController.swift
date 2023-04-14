//
//  ViewController.swift
//  Mood Tracker
//
//  Created by Oluwayomi M on 2023-04-13.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let emojiPoints: [String: Int] = [
        "😄 (happy)": 50,
        "🤔 (confused)": 10,
        "😞 (sad)": -20,
        "😐 (neutral)": 0,
        "😠 (angry)": -40,
        "😮 (surprised)": 20
    ]
    
    struct moodPoint: Codable{
        let emoji: String
        let point: Int
    }
    
    var moodPoints: [moodPoint] = []
    
    //Total Point
    
    var cumulativePoints :[Int] = []
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moodPoints.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moodCell", for: indexPath)
        let moodPoint = moodPoints[indexPath.row]
        
        let cumulativePoint: Int
        if indexPath.row < cumulativePoints.count {
            cumulativePoint = cumulativePoints[indexPath.row]
        } else {
            cumulativePoint = 0
        }
        cell.textLabel?.text = "\(moodPoint.emoji) (\(moodPoint.point)) Cumulative Points: \(cumulativePoint) "
        return cell
    }
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateLoader()
        loadMoodPoints()
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func moodInputer(_ sender: UIButton) {
        print(sender.currentTitle!)
        
        if let emoji = sender.currentTitle{
            let point = emojiPoints[emoji] ?? 0
            let moodPoint = moodPoint(emoji: emoji, point: point)
            moodPoints.append(moodPoint)
            cumulativePoints.append((cumulativePoints.last ?? 0) + point)
            print(cumulativePoints)
            tableView.reloadData()
        } else {
            print("Emoji not found")
        }
    }
    
    func dateLoader(){
        let dateFormatter =  DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        dateLabel.text = "\(currentDate)"
    }
    
    //Table View
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray
        
        let screenWidth = UIScreen.main.bounds.width
        
        let moodLabel = UILabel()
        moodLabel.text = "Mood"
        moodLabel.frame = CGRect(x: 16, y: 8, width: 100, height: 20)
        headerView.addSubview(moodLabel)
        
        let pointsLabel = UILabel()
        pointsLabel.text = "Points"
        pointsLabel.frame = CGRect(x: screenWidth / 2 - 50, y: 8, width: 100, height: 20)
        headerView.addSubview(pointsLabel)
        
        let pointsTotalLabel = UILabel()
        pointsTotalLabel.text = "Points Total"
        pointsTotalLabel.frame = CGRect(x: screenWidth - 116, y: 8, width: 100, height: 20)
        headerView.addSubview(pointsTotalLabel)
        
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    
    //Save Button
    
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        //Implementing the save functionality
        savingMood()
    }
    
    //Saving Func
    
    func savingMood(){
        let encoder = JSONEncoder()
        if let encoder = try? encoder.encode(moodPoints){
            UserDefaults.standard.set(encoder, forKey: "moodPoints")
        }
        if let data = try? JSONEncoder().encode(cumulativePoints) {
                UserDefaults.standard.set(data, forKey: "cumulativePoints")
            }
    }
    
    //Load Saved Mood OnStart
    
    func loadMoodPoints() {
        if let data = UserDefaults.standard.data(forKey: "moodPoints"),
           let savingMood = try? JSONDecoder().decode([moodPoint].self, from: data) {
            moodPoints = savingMood
        }
        if let data = UserDefaults.standard.data(forKey: "cumulativePoints"),
               let loadedCumulativePoints = try? JSONDecoder().decode([Int].self, from: data) {
                cumulativePoints = loadedCumulativePoints
            }
    }
    
    /// Clear
    ///

    @IBAction func clearMood(_ sender: UIButton) {
        moodPoints.removeAll()
        cumulativePoints.removeAll()
        savingMood()
        tableView.reloadData()
    }
}

