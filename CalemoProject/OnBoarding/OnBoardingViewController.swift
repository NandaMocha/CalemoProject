//
//  DetailViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 16/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var letsgoButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    
    let manager = DataManager.shared
    
    var Slide:[slide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Slide = createSlides()
        setupSlideScrollView(slides: Slide)
        
        scrollView.showsHorizontalScrollIndicator = false
        pageControl.numberOfPages = Slide.count
        pageControl.currentPage = 0
        
        view.bringSubviewToFront(pageControl)
        
        manager.loadFromUserDefaults()
        
        if manager.isLoadDummyDone == false{
            manager.saveDummyJournal()
        }
        manager.loadDummyJournal()
        
    }
    
    func createSlides() -> [slide] {
        
        let slide1:slide = Bundle.main.loadNibNamed("slide", owner: self, options: nil)?.first as! slide
        slide1.onboardingImage.image = UIImage(named: "image onBoard1")
        slide1.headline.text = "Guided Journal"
        slide1.caption.text = "I’m here to help you have a better and easier way in journaling"
        
        let slide2:slide = Bundle.main.loadNibNamed("slide", owner: self, options: nil)?.first as! slide
       slide2.onboardingImage.image = UIImage(named: "image inBoard2")
        slide2.headline.text = "Track Your Emotion"
        slide2.caption.text = "Understand yourself better by tracking your daily emotion"
        
        let slide3:slide = Bundle.main.loadNibNamed("slide", owner: self, options: nil)?.first as! slide
      slide3.onboardingImage.image = UIImage(named: "Image onBoard3")
        slide3.headline.text = "Improve Self-Aware"
        slide3.caption.text = "Do you know that journaling could improve your self awareness?"
        
        let button = UIButton()
        button.backgroundColor = UIColor(patternImage: (UIImage(named: "letsStartedButton")!))
        button.frame = CGRect(x: 48, y: 761, width: 318, height: 44)
       slide3.addSubview(button)
        
        
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        
        
        return [slide1, slide2, slide3]
    }
    @objc func buttonTapped(sender: UIButton!) {
        performSegue(withIdentifier: "typeName", sender: self)
    }
    
    
    
    
    func setupSlideScrollView(slides : [slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        
        scrollView.isPagingEnabled = true
      
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x

}
}
