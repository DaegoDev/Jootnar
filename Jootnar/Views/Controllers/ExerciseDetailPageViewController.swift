//
//  ExerciseDetailViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/5/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class ExerciseDetailPageViewController: UIPageViewController {
    var exerciseDetailViewControllers: [UIViewController] = [UIViewController]()
    var exercisesViewModel: ExercisesViewModel?
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self

        if let exerciseOverviewVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExerciseDetailOverview") as? ExerciseDetailOverviewViewController,
            let exerciseDescriptionVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExerciseDetailDescription") as? ExerciseDetailDescriptionViewController,
            let exerciseMultimediaVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExerciseDetailMultimedia") as? ExerciseDetailOverviewViewController {
            exerciseOverviewVC.exercisesViewModel = exercisesViewModel
            exerciseDescriptionVC.exercisesViewModel = exercisesViewModel
            
            exerciseDetailViewControllers.append(exerciseOverviewVC)
            exerciseDetailViewControllers.append(exerciseDescriptionVC)
            exerciseDetailViewControllers.append(exerciseMultimediaVC)
        }
        
        if let firstViewController = exerciseDetailViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension ExerciseDetailPageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = exerciseDetailViewControllers.index(of: viewController) else { return nil }
        
        let previousIndex = currentIndex - 1
        
        if previousIndex < 0 || exerciseDetailViewControllers.count <= previousIndex {
            return nil
        }
        
        return exerciseDetailViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = exerciseDetailViewControllers.index(of: viewController) else { return nil }
        
        let nextIndex = currentIndex + 1
        
        if exerciseDetailViewControllers.count <= nextIndex {
            return nil
        }
        
        return exerciseDetailViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return exerciseDetailViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = exerciseDetailViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex        
    }
    
}














