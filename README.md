# SliddingIssue
First Commit

I have a UICollectionview which has several custom cells. One of the cells (C1) is used as a 'Menu - with a UICollectionview inside' and hook to its class C1.swift (Subclass of UICollectionCell), another cell(C2) is used to display items. C2 has also a UICollectionview with its own custom cells and hook to C2.swift (Subclass of UICollectionCell).

I created an horizontalBarView to show which cell in C1 was selected:

Inside C1.swift, I have the following code:

   @IBOutlet weak var listingMenuCV: UICollectionView! 

    var profileItemCell: ProfileItemsCell?
      ....
     override func awakeFromNib() {
     super.awakeFromNib()
     setupViews()
     }

     override func setupViews() {

       self.listingMenuCV?.register(UINib(nibName: "C1MenuCell", bundle: nil), forCellWithReuseIdentifier: menuCellID)

      self.layout?.itemSize = CGSize(width: self.frame.width / 3, height: self.frame.height - 5)

      self.layout?.minimumLineSpacing = 0

      setupHorizontalBar()

      }

  //Mark: setup the horizontal bar view to know which cell was selected

    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.rgb(255, green: 0, blue: 128)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)

        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarLeftAnchorConstraint?.identifier = "HorizontalBarConstraint"

        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 2).isActive = true


       }
And inside collection- didSelectItem function I have the following code - to slide the horizontalbarView:

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

       let x = CGFloat(indexPath.item) * frame.width / 3
       horizontalBarLeftAnchorConstraint?.constant = x

        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
          self.layoutIfNeeded()
        }, completion: nil)


      }
Everything works fine. However, I want to make the horizontalBar to slide to the correct cell inside C1 from C2.swift

So in C2.swift I have the following code:

      @IBOutlet weak var profileItemsCV: UICollectionView!

  //Mark: Var to access the other variable from the ListingMenu Cell
    lazy var listingBar: C1MenuCell = {
        let lm = C1MenuCell()
        lm.profileItemCell = self
        return lm
    }()


 //: Mark - Scrolling to make the horizontalBar to slide
      
         func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let xScrollValue = scrollView.contentOffset.x
           listingBar.horizontalBarLeftAnchorConstraint?.constant = xScrollValue / 3
          }
Unfortunately, that doesn't seems to work, as it looks like that listingMenuCV.delegate is nil, each time I start to scroll profileItemsCV in C2 cell.
