
import UIKit

enum ProfileDataType: String {
    case firstName = "FirstName"
    case lastName = "lastName"
    case email = "Email"
    case phoneNO = "PhoneNO"
    case gender = "Gender"
    
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    var profileDataArray : [ProfileDataType] = [.firstName,.lastName,.email,.phoneNO,.gender]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
            }
    
    @IBAction func btnLogout(_ sender: UIButton) {
        showAlertWithDistructiveButton()
        
        
        
    }
    
    func showAlertWithDistructiveButton() {
        let alert = UIAlertController(title: "Sign out?", message: "You can always access your content by signing back in", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
                //Cancel Action
            print("cancle")
            }))
            alert.addAction(UIAlertAction(title: "Sign out",
              style: UIAlertAction.Style.destructive,handler: {(_: UIAlertAction!) in
             //Sign out action
                self.sceneDelegate?.logout()
            }))
            self.present(alert, animated: true, completion: nil)
        }
      
}
//    func showError(error : String){
//        print("All fields mandtry!")
//        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }


extension ProfileViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileData = profileDataArray[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell" ) as? ProfileTableViewCell
        else{
            return UITableViewCell()
        }
        let user = AuthManager.shared.user
        switch profileData{
            
        case .firstName:
            cell.setupCell(text: user?.first_name ?? "" )
            return cell
        case .lastName:cell.setupCell(text: user?.last_name ?? "")
            return cell
        case .email:cell.setupCell(text: user?.email ?? "")
            return cell
        case .phoneNO:cell.setupCell(text: user?.phone_no ?? "")
            return cell
        case .gender:cell.setupCell(text: user?.gender ?? "")
            return cell
            
        default : break
            
        }
        
        return UITableViewCell()
        
        
    }
    
    
}
