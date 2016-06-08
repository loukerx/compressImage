//
//  AppImageHelper.swift
//
//  Created by Yin Hua on 8/06/2016.
//


import UIKit


public class AppImageHelper: NSObject {


    
    //图片压缩 1000kb以下的图片控制在100kb-200kb之间
    func compressImageSize(image:UIImage) -> NSData{
        
        var zipImageData = UIImageJPEGRepresentation(image, 1.0)!
        let originalImgSize = zipImageData.length/1024 as Int  //获取图片大小
        print("原始大小: \(originalImgSize)")
        
        if originalImgSize>1500 {
            
            zipImageData = UIImageJPEGRepresentation(image,0.1)!
            
        }else if originalImgSize>600 {
            
            zipImageData = UIImageJPEGRepresentation(image,0.2)!
        }else if originalImgSize>400 {
            
            zipImageData = UIImageJPEGRepresentation(image,0.3)!
            
        }else if originalImgSize>300 {
            
            zipImageData = UIImageJPEGRepresentation(image,0.4)!
        }else if originalImgSize>200 {
            
            zipImageData = UIImageJPEGRepresentation(image,0.5)!
        }
        
        return zipImageData
    }
    
    
    
    func resizeImage(originalImg:UIImage) -> UIImage{
        
        //prepare constants
        let width = originalImg.size.width
        let height = originalImg.size.height
        let scale = width/height
        
        var sizeChange = CGSize()
        
        if width < 1280 && height < 1280{ //a，图片宽或者高均小于或等于1280时图片尺寸保持不变，不改变图片大小
            return originalImg
        }else if width > 1280 || height > 1280 {//b,宽或者高大于1280，但是图片宽度高度比小于或等于2，则将图片宽或者高取大的等比压缩至1280
            
            if scale <= 2 && scale >= 1 {
                let changedWidth:CGFloat = 1280
                let changedheight:CGFloat = changedWidth / scale
                sizeChange = CGSize(width: changedWidth, height: changedheight)
                
            }else if scale >= 0.5 && scale <= 1 {
                
                let changedheight:CGFloat = 1280
                let changedWidth:CGFloat = changedheight * scale
                sizeChange = CGSize(width: changedWidth, height: changedheight)
                
            }else if width > 1280 && height > 1280 {//宽以及高均大于1280，但是图片宽高比大于2时，则宽或者高取小的等比压缩至1280
                
                if scale > 2 {//高的值比较小
                    
                    let changedheight:CGFloat = 1280
                    let changedWidth:CGFloat = changedheight * scale
                    sizeChange = CGSize(width: changedWidth, height: changedheight)
                    
                }else if scale < 0.5{//宽的值比较小
                    
                    let changedWidth:CGFloat = 1280
                    let changedheight:CGFloat = changedWidth / scale
                    sizeChange = CGSize(width: changedWidth, height: changedheight)
                    
                }
            }else {//d, 宽或者高，只有一个大于1280，并且宽高比超过2，不改变图片大小
                return originalImg
            }
        }
        
        UIGraphicsBeginImageContext(sizeChange)
        
        //draw resized image on Context
        originalImg.drawInRect(CGRectMake(0, 0, sizeChange.width, sizeChange.height))
        
        //create UIImage
        let resizedImg = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resizedImg
        
    }
    
    
}
