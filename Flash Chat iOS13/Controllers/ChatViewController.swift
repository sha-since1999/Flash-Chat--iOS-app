
import UIKit
import Firebase
class ChatViewController: UIViewController{
    
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
     
    let db = Firestore.firestore()
    var meessageBox : [Msg] = []

    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        title = K.appName
        LoadMessage()
        
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text , let messageSender  = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data:[
                K.FStore.senderField : messageSender,
                K.FStore.bodyField : messageBody,
                K.FStore.dateField : Date().timeIntervalSince1970
            ]) { (error) in
                if let e  = error{
                 print("There was an issue saving data to firestore, \(e)")
                } else {
                        print("Successfully saved data.")
                        DispatchQueue.main.async {
                            self.messageTextfield.text = ""
                            }
                        }
                    }
                }
            }

    func LoadMessage()
    {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
                
                self.meessageBox = []
    
                if let e = error {
                    print("There was an issue retrieving data from Firestore. \(e)")
                }
                
                else {  for document in querySnapshot!.documents
                        {
                            let data = document.data()
                        
                            if let msgSender = data[K.FStore.senderField] as? String ,
                                let msgBody = data[K.FStore.bodyField] as? String
                            {
                                let newMsg = Msg(sender: msgSender, body: msgBody )
                                self.meessageBox.append(newMsg)
                                DispatchQueue.main.async
                                    {   self.tableView.reloadData()
                                        let indexPath = IndexPath(row: self.meessageBox.count - 1, section: 0)
                                        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                    }
                            
                            }
                        }
                    }
                }
            }
    

    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
          let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                    navigationController?.popToRootViewController(animated: true)
                } catch let signOutError as NSError {
                  print ("Error signing out: %@", signOutError)
                }
                  
        }
            
}
//MARK: - UITableDataSource
extension ChatViewController : UITableViewDataSource
{
   // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meessageBox.count
    }

    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier , for: indexPath) as! MessageCell
        
       // Configure the cell’s contents.
        let messsageBody = meessageBox[indexPath.row].body
        let messageSender = meessageBox[indexPath.row].sender
        
        
        
        if messageSender == Auth.auth().currentUser?.email
        {   cell.leftImageView.isHidden = true
            cell.imageViewField.isHidden = false
            cell.messageBubble.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
    
            
        }
        else{
            cell.imageViewField.isHidden = true
            cell.leftImageView.isHidden = false
            cell.messageBubble.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 0.4944616866)
        }
    
        
        cell.label.text = messsageBody

        return cell
    }
    
}


