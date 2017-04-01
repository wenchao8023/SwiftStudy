# UITabelView For Swift

> * 在Swift中的方法、属性、用途和oc中的一样
> * 在 **xib** 中添加 **tableView** 之后，可以直接右键然后最上面的两个直接拉到当前 **viewController** 就可以遵循代理了，然后在代码中遵循代理`UITableViewDelegate, UITableViewDataSource`的时候会报错，只要将几个必须要执行的代理执行之后就可以了
> * cell 自动适配高度
> 
> * * 可以使用常用的`boundingRect`方法进行自动计算 `cell`的高度
> 
> * * 使用代码`tableView.estimatedRowHeight = 60`
> `tableView.rowHeight = UITableViewAutomaticDimension`这两句代码来实现，在执行这两句代码之前，xib中的cell中的Label一定要设置相对于cell的上下的约束

> * 刷新局部代码，实现动画
>
			//         在 beginUpdates()
			//             ...
			//         和 endUpdates()
			//         之间的 cell 会动画的的展示
			//         
			//        tableView.beginUpdates()
			//        if lable.numberOfLines == 0 {
			//            lable.numberOfLines = 1
			//            dict[String(indexPath.row)] = "1"
			//        } else {
			//            lable.numberOfLines = 0
			//            dict[String(indexPath.row)] = "0"
			//        }
			//        tableView.endUpdates()

> * 如果有需求，将分割线顶头，需要重写`viewDidLayoutSubviews() `方法，然后将`tableView`和`cell`的`margin`边距全部置为0
> 
		    override func viewDidLayoutSubviews() {
		        self.tableView.separatorInset = UIEdgeInsets.zero
		        self.tableView.layoutMargins = UIEdgeInsets.zero
		    }
		    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		        cell.separatorInset = UIEdgeInsets.zero
		        cell.layoutMargins = UIEdgeInsets.zero
		    }
>
> * 如果`cell`中的图片有超出显示范围，可以在这个方法里面设置图片的位置，这样可以在滑动`tabelView`的时候，给`cell`中的图片一个相对动画，设置`imageView`的时候需要将图片设置成`Aspect Fill`模式
> 
		func scrollViewDidScroll(_ scrollView: UIScrollView) {
	        for cell in tableView.visibleCells {
	            let bottomView = cell.contentView.viewWithTag(2000)
	            let image = cell.contentView.viewWithTag(2001)
	            let rect = bottomView?.convert((bottomView?.bounds)!, to: nil)
	            var Y = UIScreen.main.bounds.size.height - (rect?.origin.y)! - 600
	            Y *= 0.2
	            if Y > 0 {
	                Y = 0
	            }
	            if Y < -100 {
	                Y = -100
	            }
	            image?.frame.origin.y = Y
	        }
	    }

