//
//  PostCollectionViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/11/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class PostCollectionViewController: UICollectionViewController {
    let postCollectionCell = "PostCollectionViewCell"
    var postsViewModel: PostsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.delegate = self
        let dependencies = PostsViewModel.Dependencies()
        postsViewModel = PostsViewModel(dependencies: dependencies)
        postsViewModel?.onPostsDidUpdate = onPostsDidUpdate
        postsViewModel?.listPosts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let postDetailVC = segue.destination as? PostDetailViewController {
            postDetailVC.postsViewModel = postsViewModel
        }
    }
}

// MARK: - COLLECTION DATASOURCE
extension PostCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postsViewModel?.posts?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postCollectionCell, for: indexPath) as? PostCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of PostCollectionViewCell.")
        }
        
        if let post = postsViewModel?.posts?[indexPath.row], let imageURL = try? post.image.asURL() {
            cell.postImage.af_setImage(withURL: imageURL)
        }
        
        return cell
    }
}

// MARK: - COLLECTION DELEGATE
extension PostCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        postsViewModel?.selectedPost = postsViewModel?.posts?[indexPath.row]
    }
}

extension PostCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
        layout.minimumInteritemSpacing = 04
        layout.minimumLineSpacing = 04
        layout.invalidateLayout()
        return CGSize(width: ((self.view.frame.width/3) - 6), height:((self.view.frame.width / 3) - 6))
    }  
}

extension PostCollectionViewController : FoodLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, sizeForImageAtIndexPath indexPath:IndexPath) -> (height: CGFloat, width: CGFloat) {
        let height: CGFloat = 150
        let width: CGFloat = 150
        return (height, width)
    }

}

extension PostCollectionViewController {
    func onPostsDidUpdate() {
        self.collectionView?.reloadData()
    }
}

