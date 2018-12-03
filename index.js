var RxSwiftOption = {
    "Identifier": "RxSwift",
    "Name": "install rxswift",
    "Description": "Adds rxSwift rxCocoa as a CocoaPod",
    "Type": "checkbox",
    "Default": "true",
    "NotPersisted": true,
    "Units": {
        "true": {
            "Definitions": {
                "../Podfile:RxSwift": "\n    ## RxSwift\n    pod 'RxSwift'",
                "../Podfile:RxCocoa": "    pod 'RxCocoa'"
            },
            "Nodes": [
                "../Podfile:RxSwift",
                "../Podfile:RxCocoa"
            ]
        }
    }
}

var RxSwiftCommunityOption = {
    "Identifier": "RxSwiftCommunity",
    "Name": "install RxSwiftCommunity",
    "Description": "Adds RxSwiftCommunity as a CocoaPod",
    "Type": "checkbox",
    "Default": "true",
    "NotPersisted": true,
    "Units": {
        "true": {
            "Definitions": {
                "../Podfile:RxOptional": "\n    ## RxSwiftCommunity\n    pod 'RxOptional'",
                "../Podfile:RxGesture": "    pod 'RxGesture'",
                "../Podfile:RxSwiftExt": "    pod 'RxSwiftExt'"
            },
            "Nodes": [
                "../Podfile:RxOptional",
                "../Podfile:RxGesture",
                "../Podfile:RxSwiftExt"
            ]
        }
    }
}

var MoyaOption = {
    "Identifier": "moya",
    "Name": "install Moya",
    "Description": "Adds moya as a CocoaPod",
    "Type": "checkbox",
    "Default": "false",
    "NotPersisted": true,
    "Units": {
        "true": {
            "Definitions": {
                "../Podfile:Moya": "\n    ## Moya\n    pod 'Moya/RxSwift'",
                "../Podfile:SwiftyJSON": "pod 'SwiftyJSON'"
            },
            "Nodes": [
                "../Podfile:Moya",
                "../Podfile:SwiftyJSON"
            ]
        }
    }
}

var RealmOption = {
    "Identifier": "realm",
    "Name": "install realm",
    "Description": "Adds rxSwift rxCocoa as a CocoaPod",
    "Type": "checkbox",
    "Default": "false",
    "NotPersisted": true,
    "Units": {
        "true": {
            "Definitions": {
                "../Podfile:Realm": "\n    ## Realm\n    pod 'Realm'",
                "../Podfile:RealmSwift": "    pod 'RealmSwift'",
                "../Podfile:RxRealm": "    pod 'RxRealm'"
            },
            "Nodes": [
                "../Podfile:Realm",
                "../Podfile:RealmSwift",
                "../Podfile:RxRealm"
            ]
        }
    }
}

/// 操作选择
var options = [
    RxSwiftOption, // rxswift
    RxSwiftCommunityOption, // rxswift 辅助
    MoyaOption, // moya
    RealmOption, // realm
]


var ProjectTemplate = {
    "Kind": "Xcode.Xcode3.ProjectTemplateUnitKind",
    "Identifier": "com.msiter.ProjectTemplate",
    "Ancestors": [
        "com.apple.dt.unit.storyboardApplication",
        "com.apple.dt.unit.coreDataCocoaTouchApplication"
    ],
    "Concrete": true,
    "Description": "This template provides a starting point for an application that uses a single view. It provides a view controller to manage the view, and a storyboard or nib file that contains the view.",
    "SortOrder": 1,
    "Options": options,
    "Definitions": {
        "Base.lproj/Main.storyboard": {
            "Path": "Main.storyboard",
            "SortOrder": 99
        },
        "../Podfile": {
            "Beginning": "#source  https://github.com/CocoaPods/Specs.git\n# Uncomment the next line to define a global platform for your project\nplatform: ios,'9.0'\n\n\ntarget '___PACKAGENAME___' do \n    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks\n    use_frameworks!",
            "End": "end",
            "Group": [
                "Supporting Files"
            ]
        },
        "../.gitignore": {
            "Path": ".gitignore",
            "Group": [
                "Supporting Files"
            ]
        }
    },
    "Nodes": [
        "../Podfile",
        "../.gitignore"
    ]
}


const plist = require('plist');
const {
    lstatSync,
    readdirSync,
    writeFile
} = require('fs')

/// 根目录下 获取 文件夹
readdirSync('./')
    .filter(source => lstatSync(source).isDirectory()) // 只获取文件夹
    .filter(source => {
        return source != "node_modules"
    }) // 去除 node_moudles 文件夹
    .forEach(path => {

        /// 获取 每个目录下的文件
        readdirSync(path).forEach(file => {

            let key = "resources/" + path + "/" + file

            ProjectTemplate.Definitions[key] = {
                "Path": path + "/" + file,
                "Group": [
                    "resources",
                    path
                ]
            }

            ProjectTemplate.Nodes.push(key)
        })
    })

/// 把json 转换为 plist
/// 将其 写入 plist 文件
writeFile("TemplateInfo.plist", plist.build(ProjectTemplate), error => {
    if (error) {
        return console.error(error);
    }
    console.log("数据写入成功！");
})