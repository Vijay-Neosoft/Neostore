
import UIKit

class HomeScreenViewController: UIViewController  {
    
    var sliderImage:[String] = ["slider_img1","slider_img2","slider_img3","slider_img4"]
    var secondImage:[String] = ["chairsicon","cupboardicon 1","cupboardicon","sofaicon"]
   
    @IBOutlet weak var HomeScreen: UICollectionView!
    
    @IBOutlet weak var CollectionView2: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
}

extension HomeScreenViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == CollectionView2 {
            return secondImage.count
            
        }else{
            
            return sliderImage.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = HomeScreen.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
        cell.HomeImageOutlet.image = UIImage(named: sliderImage[indexPath.row])
       
        
        if collectionView == CollectionView2{
            let cell1 = CollectionView2.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
            cell1.ItemImage.image = UIImage(named: secondImage[indexPath.row])
            return cell1
            
        }
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 200)
        }
    }
    
