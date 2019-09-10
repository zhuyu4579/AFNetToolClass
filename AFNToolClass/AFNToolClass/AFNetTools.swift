//
//  AFNetTools.swift
//  AFNToolClass
//
//  Created by 浙大网新中研软件 on 2019/9/10.
//  Copyright © 2019 浙大网新中研软件. All rights reserved.
//

import AFNetworking

//定义枚举类型
enum RequestType :String{
    case GET="GET"
    case POST="POST"
}
class AFNetTools: AFHTTPSessionManager {
    //创建单例 let是线程安全的 通过静态常量创建单例
    static let shareInstance : AFNetTools = {
        let tools = AFNetTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        return tools
    }()
}
//MARk:-封装请求方法
extension AFNetTools{
    func request(methodType:RequestType, urlString : String,parameters:[String : Any],finished:@escaping (_ result : Any?, _ error:Error?)->()){
        //定义成功的闭包回掉
        let successCallBack = { (task:URLSessionDataTask?, result: Any?) in
            finished(result,nil)
        }
        //定义失败的闭包回调
        let failureCallBack = { (task:URLSessionDataTask?, error:Error) in
            finished(nil,error)
        }
        //网络请求
        if methodType == .GET {
            get(urlString, parameters: parameters, progress: nil, success: successCallBack,failure: failureCallBack)
        }else{
            post(urlString, parameters: parameters, progress: nil, success:successCallBack,failure: failureCallBack)
        }
       
    }
}
