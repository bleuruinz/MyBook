//
//  BookListTableViewController.swift
//  MyBook
//
//  Created by ktds 13 on 2017. 8. 17..
//  Copyright © 2017년 CJ Olivenetworks. All rights reserved.
//

import UIKit
import Foundation

class BookListTableViewController: UITableViewController, AddBookDelegate {
    // Book type 의 빈 Array 생성
    var books:[Book] = Array()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let book1 = Book(title: "나미야 잡화점의 기적",
                         writer: "히가시노 게이고",
                         publisher: "현대문학",
                         coverImage: UIImage(named:"book1")!,
                         price: 14800,
                         description: "추리적인 향기와 깊이를 잃지 않는 명작,『나미야 잡화점의 기적』 『나미야 잡화점의 기적』은 2012년 3월 일본에서 출간되어 큰 화제를 불러일으킨, 우리 시대를 대표하는 작가 히가시노 게이고의 최신작이다. 작가가 그동안 일관되게 추구해온 인간 내면에 잠재한 선의에 대한 믿음이 작품 전반에 깔려 있는 이번 이야기에는 그동안 히가시노 게이고 하면 떠올랐던 살인 사건이나 명탐정 캐릭터는 전혀 등장하지 않는다. 그럼에도 불구하고 마치 퍼즐을 맞추어가는 듯한 치밀한 짜임새는 과연 히가시노 게이고의 작품답게 명불허전의 짜릿한 쾌감을 선사하며 감동을 자아내 작가의 고정 독자를 충분히 매료시킨다.",
                         url:"http://www.bandinlunis.com/front/product/detailProduct.do?prodId=3558781")

        
        let book2 = Book(title: "보노보노처럼 살다니 다행이야",
                         writer: "김신회",
                         publisher: "다산북스",
                         coverImage: UIImage(named:"book2")!,
                         price: 16000,
                         description: "<보노보노>는 1986년 출간되어 1988년 고단샤 만화상 수상 후 30년 넘게 연재를 이어오고 있는 네 컷 만화가 원작이다. 2017년 현재 41권까지 출간되는 동안 전 세계를 통틀어 1천만 부가 판매되었으며 우리나라엔 1995년 서울문화사에서 출간된 만화책으로 처음 정식 소개되었다. 그 후 애니메이션과 영화로 각색되어 국내에도 두터운 팬층을 형성하게 됐으며 2016년에는 30주년 기념으로 제작된 리터치 애니메이션이 투니버스에서 방영되어 동시간대 케이블 시청률 1위를 기록했다.",
                         url:"http://www.bandinlunis.com/front/product/detailProduct.do?prodId=4056923")
        
        let book3 = Book(title: "82년생 김지영",
                         writer: "조남주",
                         publisher: "민음사",
                         coverImage: UIImage(named:"book3")!,
                         price: 13000,
                         description: "조남주 장편소설 『82년생 김지영』이 민음사 ‘오늘의 젊은 작가’ 시리즈로 출간되었다. 조남주 작가는 2011년, 지적 장애가 있는 한 소년의 재능이 발견되면서 벌어지는 사건을 통해 삶의 부조리를 현실적이면서도 따뜻하게 그려낸 작품 『귀를 귀울이면』으로 ‘문학동네소설상’을 받으며 데뷔했다. 시사 교양 프로그램에서 10년 동안 일한 방송 작가답게 서민들의 일상에서 발생하는 비극을 사실적이고 공감대 높은 스토리로 표현하는 데 특출 난 재능을 보이는 작가는 신작 『82년생 김지영』에서 30대를 살고 있는 한국 여성들의 보편적인 일상을 완벽하게 재현한다.",
                         url:"http://www.bandinlunis.com/front/product/detailProduct.do?prodId=4002576")
        
        let book4 = Book(title: "iPhone SDK 튜터리얼2",
                         writer: nil,
                         publisher: nil,
                         coverImage: nil,
                         price: nil,
                         description: nil,
                         url: nil)
        
        self.books.append(book1)
        self.books.append(book2)
        self.books.append(book3)
        self.books.append(book4)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if let bookCell = cell as? BookTableViewCell {
            let book = self.books[indexPath.row]
            
            let numFormatter: NumberFormatter = NumberFormatter()
            numFormatter.numberStyle = NumberFormatter.Style.decimal
            if let price = book.price {
                let priceStr = numFormatter.string(from: NSNumber(integerLiteral: price))
                bookCell.bookPriceLabel.text = priceStr //String(book.price)
            } else {
                bookCell.bookPriceLabel.text = ""
            }
            
            bookCell.bookTitleLabel.text = book.title
            bookCell.bookWriterLabel.text = book.writer
            bookCell.bookImageView.image = book.coverImage
            return bookCell
        }

        // Configure the cell...
//        let book = self.books[indexPath.row]
//        cell.textLabel?.text = book.title
//        cell.detailTextLabel?.text = book.writer
//        cell.imageView?.image = book.coverImage
        
        //cell.textLabel?.text = books[indexPath.row]
        
        /*cell.textLabel?.text = "Hello, World"
        cell.detailTextLabel?.text = "Hello, World!"
        //print("Cell Index: \(indexPath.row)")
        
        cell.imageView?.image = UIImage(named: "1")*/
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier  == "addvc" {
            
            if let addVC = segue.destination as? AddBookViewController {
                addVC.delegate = self
            }
            
        } else if segue.identifier == "detailvc" {
            let cell = sender as? UITableViewCell
            let vc = segue.destination as? BookDetailViewController
            
            guard let selectedCell = cell, let detailVC = vc else {
                return
            }
            
            if let idx = self.tableView.indexPath(for: selectedCell) {
                detailVC.book = self.books[idx.row]
            }
            /*        if let selCell = cell {
             let cellIdx = self.tableView.indexPath(for: selCell)
             print(cellIdx?.row)
             }*/
        }
        
    }
    
    func sendNewBook (book:Book) {
        self.books.append(book)
        self.tableView.reloadData()
    }
}






class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookWriterLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundView?.backgroundColor = UIColor.blue
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
