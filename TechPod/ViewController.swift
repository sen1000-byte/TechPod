//
//  ViewController.swift
//  TechPod
//
//  Created by Chihiro Nishiwaki on 2021/02/07.
//

import UIKit
//音楽を使う時にimportする
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //tableviewの宣言
    @IBOutlet var table: UITableView!
    
    //曲名の配列
    var songNameArray = [String]()
    //局のファイル名を入れるための配列
    var fileNameArray = [String]()
    //音楽家の画像の配列
    var imageNameArray = [String]()
    //音楽を再生するための変数
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //tableviewのデータソースをviewcontrollerクラスに書く
        table.dataSource = self
        //曲のファイルを追加　拡張子は自然につくため、省く
        fileNameArray = ["cannon","elise","aria"]
        //画像を追加
        imageNameArray = ["Beethoven.jpg","Pachelbel.jpg","Bach.jpg"]
        //tableviewをviewcontrollerで行うよ〜っていう意味
        table.delegate = self
        
        //曲を追加
        songNameArray = ["カノン","エリーゼの為に","G線上のアリア"]
        
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    //なんかstorybordで高さが調節できなかったので、コードで調節
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
    
    //セルの取得、セル属性のラベルにテストと表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        //indexPathは0から始まるみたい。
        cell?.textLabel?.text = songNameArray[indexPath.row]
        //cellに画像を表示
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])

        return cell!
    }
    
    //cellが押された時に呼び出されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //曲を流す
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        //再生
        audioPlayer.play()
    }
}

