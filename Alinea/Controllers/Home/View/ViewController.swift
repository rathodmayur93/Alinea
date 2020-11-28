//
//  ViewController.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Variable & Propeties
    private var dataSourceDelegate = BottomCollectionViewDelegate()
    private var themeDataSourceDelegate = ThemeCollectionViewLayoutDelegate()
    private var pagerDataSourceDelegate = PagerCollectionViewLayoutDelegate()

    //Creating Instance of the HomeViewModel
    private lazy var bottomVM : BottomViewModel = {
        var vm = BottomViewModel(delegate: dataSourceDelegate)
        return vm
    }()
    
    //Creating the instance of the BottomBarCollectionModel
    private lazy var bottomBarModel : BottomBarCollectionModel = {
        let model = BottomBarCollectionModel()
        return model
    }()
    
    //Creating Instance of the PagerViewModel
    private lazy var pagerVM : PagerViewModel = {
        var vm = PagerViewModel(collectionViewDelegate: pagerDataSourceDelegate)
        vm.pagerDelegate = self
        return vm
    }()
    
    //Creating the instance of the ThemeViewModel
    private lazy var themeViewModel : ThemesViewModel = {
        var vm = ThemesViewModel(delegate: themeDataSourceDelegate)
        return vm
    }()
    
    //Creating hte instance of the TrendingViewModel
    private lazy var trendingViewModel : TrendingViewModel = {
        var vm = TrendingViewModel()
        return vm
    }()
    //MARK:- Views
    
    //Bottom Bar View
    private let bottomTabBarView : UIView = {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let posY = height - MRConstants.bottomBarViewHeight
        let viewFrame = CGRect(x: 0, y: posY, width: width, height: MRConstants.bottomBarViewHeight)
        
        let view = MRUiMaker.createView(viewFrame: .zero,
                                          backgroundColor: MRColors.whiteColor,
                                          cornerRadius: MRConstants.bottomBarViewRadius,
                                          cornerMask: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        view.dropShadow(scale: true, radius: MRConstants.bottomBarShadowRadius)
        return view
    }()
    
    //Bottom View
    private let bottomView : BottomView = {
        let view = BottomView(frame: .zero)
        return view
    }()
    
    private let topView : TopView = {
        let view = TopView(frame: .zero)
        return view
    }()
    
    private var pagerView : PagerView!
    
    private let categoryView : CategoryView = {
        let view = CategoryView(frame: .zero)
        return view
    }()
    
    private var themeView : ThemeView!
    private var trendingView : TrendingView!
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting up the UI
        setUI()
    }
    
    //MARK:- UI Function
    private func setUI(){
        
        //Setting background color
        self.view.setBackgroundColor(bgColor: .backgroundColor)
        
        //Initializing the UIViews
        initView()
        
        //Bottom View
        setupBottomView()
        
        //Top View
        setupTopView()
        
        //Pager View
        setupPagerView()
        
        //Setup Category View
        setupCategoryView()
        
        //Setup Theme View
        setupThemeView()
        
        //Setup Trending View
        setupTrendingView()
    }
    
    //Initialize the UIViews
    private func initView(){
        //Initializing the pager view model
        pagerView = PagerView(vm: pagerVM)
        pagerView.isHidden = false
        
        //Initializing the theme view model
        themeView = ThemeView(vm: themeViewModel)
        themeView.isHidden = true
        
        //Initializing the trending view model
        trendingView = TrendingView(vm: trendingViewModel)
        trendingView.isHidden = true
        
    }
    
    //MARK: TopView
    /**
        - This function will creat the top view which will contain imageVIew and label
     */
    private func setupTopView(){
        //Adding the topView
        self.view.addSubview(topView)
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraint to the topView
        topView.topLeft(toView: self.view, top: MRConstants.topBarViewTop, left: 20.0)
        topView.right(toView: self.view, space: -20.0)
        topView.height(30.0)
    }
    
    //MARK: BottomView
    /**
        - This function will creat the bottom view which will contain collectionView
     */
    private func setupBottomView(){
        //Adding the topView
        self.view.addSubview(bottomView)
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraint to the topView
        bottomView.bottomLeft(toView: self.view)
        bottomView.right(toView: self.view)
        bottomView.height(MRConstants.bottomBarViewHeight)
    }
    
    //MARK: PagerView
    /**
        - This function will creat the pager view which will contain different different section
     */
    private func setupPagerView(){
        //Adding the pagerView
        self.view.addSubview(pagerView)
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        pagerView.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraint to the pagerView
        pagerView.topBottom(toView: topView)
        pagerView.left(toView: self.view, space: 20.0)
        pagerView.right(toView: self.view, space: -20.0)
        pagerView.height(MRConstants.pagerViewHeight)
    }
    
    //MARK: Category View
    /**
     - This function will creat the pager view which will contain different different section
     */
    private func setupCategoryView(){
        //Adding the pagerView
        self.view.addSubview(categoryView)
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraint to the pagerView
        categoryView.topBottom(toView: pagerView, space: 16.0)
        categoryView.left(toView: self.view)
        categoryView.right(toView: self.view)
        categoryView.bottomTop(toView: bottomView, space: 0.0)
        
    }
    
    //MARK: Theme View
    /**
     - This function will creat the theme view which will contain collectionView
     */
    private func setupThemeView(){
        //Adding the pagerView
        self.view.addSubview(themeView)
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        themeView.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraint to the pagerView
        themeView.topBottom(toView: pagerView, space: 16.0)
        themeView.left(toView: self.view)
        themeView.right(toView: self.view)
        themeView.bottomTop(toView: bottomView, space: 0.0)
        
    }
    
    //MARK: Theme View
    /**
     - This function will creat the trendingView which will contain tableView
     */
    private func setupTrendingView(){
        //Adding the pagerView
        self.view.addSubview(trendingView)
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        trendingView.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraint to the pagerView
        trendingView.topBottom(toView: pagerView, space: 16.0)
        trendingView.left(toView: self.view)
        trendingView.right(toView: self.view)
        trendingView.bottomTop(toView: bottomView, space: 0.0)
    }
}

extension ViewController : PagerSelectedDelegate {
    
    func selectedPager(at index: Int) {
        switch index {
        case 0:
            categoryView.isHidden = false
            themeView.isHidden = true
            trendingView.isHidden = true
            break
        case 1:
            categoryView.isHidden = true
            themeView.isHidden = false
            trendingView.isHidden = true
            break
        case 2:
            categoryView.isHidden = true
            themeView.isHidden = true
            trendingView.isHidden = false
            break
        default:
            break
        }
    }
}
