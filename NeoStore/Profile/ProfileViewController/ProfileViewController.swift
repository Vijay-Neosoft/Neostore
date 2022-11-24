
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    var profileDataArray : [ProfileDataType] = [.firstName,.lastName,.email,.phoneNO,.gender]
    var profileViewModel = ProfileViewModel()
    var userData : IncomingData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.bind()
    }
    // #MARK -> Binding profileViewModel Data save in userData.
    func bind() {
        profileViewModel.getProfileData { responseData in
            guard let data = responseData  else{
                return
            }
            self.userData = data
            self.tableView.reloadData()
        }
         errorBlock: { errorData in
            self.showError(error: errorData)
        }
    }
    
    // #MARK ->  LOGOUT BUTTON
    @IBAction func buttonLogout(_ sender: UIButton) {
        showAlertWithDistructiveButton()
       
    }
    // #MARK ->  CREATE LOGOUT BUTTON Function
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
// #MARK -> Extension for insert data inside TableViewController the cell.
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
       
        switch profileData{
            
        case .firstName:
            cell.setupCell(text: userData?.first_name ?? "" )
            return cell
        case .lastName:cell.setupCell(text: userData?.last_name ?? "")
            return cell
        case .email:cell.setupCell(text: userData?.email ?? "")
            return cell
        case .phoneNO:cell.setupCell(text: userData?.phone_no ?? "")
            return cell
        case .gender:cell.setupCell(text: userData?.gender ?? "")
            return cell
        }
    }
}
