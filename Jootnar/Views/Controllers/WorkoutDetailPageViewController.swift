//
//  WorkoutDetailPageViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/9/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class WorkoutDetailPageViewController: UIPageViewController {
    var workoutDetailViewControllers = [UIViewController]()
    var workoutsViewModel: WorkoutsViewModel?
    var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let workoutOverviewVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WorkoutDetailOverview") as? WorkoutDetailOverviewViewController,
            let workoutExercises = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WorkoutDetailExercises") as? WorkoutDetailExercisesViewController,
            let workoutRatingVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WorkoutDetailRating") as? WorkoutDetailRatingTableViewController {
            workoutOverviewVC.workoutsViewModel = workoutsViewModel
            workoutExercises.workoutsViewModel = workoutsViewModel
            workoutRatingVC.workoutsViewModel = workoutsViewModel

            workoutDetailViewControllers.append(workoutOverviewVC)
            workoutDetailViewControllers.append(workoutExercises)
            workoutDetailViewControllers.append(workoutRatingVC)
        }
        
        if let firstViewController = workoutDetailViewControllers.first {
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

extension WorkoutDetailPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = workoutDetailViewControllers.index(of: viewController) else { return nil }
        
        let previousIndex = currentIndex - 1
        
        if previousIndex < 0 || workoutDetailViewControllers.count <= previousIndex {
            return nil
        }
        
        return workoutDetailViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = workoutDetailViewControllers.index(of: viewController) else { return nil }
        
        let nextIndex = currentIndex + 1
        
        if workoutDetailViewControllers.count <= nextIndex {
            return nil
        }
        
        return workoutDetailViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return workoutDetailViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = workoutDetailViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }    
}
