
import UIKit

class HomeScreenViewController: UIViewController  {
  
    @IBOutlet weak var HomeScreen: UICollectionView!
    @IBOutlet weak var SubHomeScreen: UICollectionView!
    
    var HomeScreenImage = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeScreenViewController :
    
    UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == SubHomeScreen {
            return HomeScreenImage.SubHomeDataCount
            
        }else{
            
            return HomeScreenImage.HomeDataCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = HomeScreen.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
        cell.HomeImageOutlet.image = UIImage(named:HomeScreenImage.HeaderCollectionVIewData(ind:indexPath.row))
        
        
        if collectionView == SubHomeScreen{
            let cell1 = SubHomeScreen.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! SubHomeCollectionViewCell
            cell1.SubHomeImageOutlet.image = UIImage(named:HomeScreenImage.SubHomeCollectionVewData(ind: indexPath.row))
            return cell1
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == SubHomeScreen{
            
            return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
        }
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}


