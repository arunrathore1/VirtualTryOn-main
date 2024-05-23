//
//  Constants.swift
//  ARFaceSCNDemo
//
//  Created by Hemant Sudhanshu on 18/07/23.
//

import UIKit
import ARKit

let sizeArray: [String] = []
let titleImageCollectionViewArray = [#imageLiteral(resourceName: "sunglasses"),#imageLiteral(resourceName: "earrings")]
let colorArrayForCollection = [UIColor.white, UIColor.white]

enum ModelSize : String{
  case XS = "XS"
  case S = "S"
  case M = "M"
  case L = "L"
  case XL = "XL"
  case XXL = "XXL"
  
  static func getAll() -> [ModelSize]{
    var sizes = [ModelSize]()
    sizes.append(ModelSize.XS)
    sizes.append(ModelSize.S)
    sizes.append(ModelSize.M)
    sizes.append(ModelSize.L)
    sizes.append(ModelSize.XL)
    sizes.append(ModelSize.XXL)
    return sizes
  }
}

struct Constants{
  
  public struct Theme {
    public static let themeColor_Peach = UIColor(red: 236, green: 216, blue: 150)
    public static let themeColor_PaleWhite = UIColor(red: 244, green: 240, blue: 228)
    public static let themeColor_Orange = UIColor(red: 215, green: 79, blue: 81)
    public static let themeColor_lightOrange = UIColor(red: 220, green: 115, blue: 98)
  }
  
  public struct ModelIds {
    public static let aviators = "aviators"
    public static let aviators2 = "aviators2"
    public static let sqrSG = "sqrSG"
    public static let simpleSquare = "simpleSquare"
    public static let noseRing = "noseRing"
    public static let nosePin = "nosePin"
    public static let tiara = "tiara"
    public static let earRing = "earRing"
    public static let earRingPearl = "earRingPearl"
    public static let bunnyHairBand = "bunnyHairBand"
    public static let headband = "headband"
    public static let nosePinFlat = "nosePinFlat"
  }
  
  public struct CellNames {
    public static let specsModelCVCell = "SpecsModelCVCell"
    public static let savedImageTBCell = "SavedImageTBCell"
    public static let navigatorCVCell = "NavigatorCVCell"
    public static let sizeCVCell = "SizeCVC"
    public static let mainCategoryTBCell = "MainCategoriesTBCell"
    public static let mainCategoryCVCell = "MainCategoriesCVCell"
    public static let offersTBCell = "OffersTBCell"
    public static let categoryShoppingTBCell = "CategoryShoppingTBCell"
    public static let categoryNameTBCell = "CategoryNameTBCell"
    public static let shoppingItemCell = "ShoppingItemCell"
    public static let modelSizeCVCell = "ModelSizeCVCell"
    public static let modelColorTBCell = "ModelColorTBCell"
    public static let imageViewCVCell = "ImageViewCVCell"
  }
  
  public struct StoryBoardIDs {
    public static let galleryViewC = "GalleryViewC"
    public static let emptyGallery = "EmptyGallery"
    public static let homeVC = "HomeVC"
    public static let categoryDetailsVC = "CategoryDetailsVC"
    public static let itemsVC = "ItemsVC"
    public static let tryModelVC = "TryModelVC"
    public static let cartVC = "CartVC"
    public static let noItemsAvailableVC = "NoItemsAvailableVC"
    public static let noInternetConnectionVC = "NoInternetConnectionVC"
  }
  
  public struct DefaultStrings {
    public static let maincatName = "default Maincategory Name"
    public static let subcatName = "default Subcategory Name"
    public static let itemName = "default Item Name"
    public static let imageURL = "default URL"
  }
  
  public struct SegueIDs {
    public static let cameraToGallery = "cameraToGallery"
  }
  
  public struct SavedImageTags {
    public static let  specs = "specs"
    public static let accessories = "accessories"
  }
  
  public struct ModelTags {
    public static let  specs = "specs"
    public static let accessories = "accessories"
  }
  
  public struct ImageAssetsName {
    public static let lipstickRed = "lipstickRed"
    public static let tattoo = "tattoo"
    public static let upperLip = "upperLip"
    public static let lowerLip = "lowerLip"
    public static let deleteIcon = "deleteIcon"
    public static let offer1 = "offer1"
    public static let offer2 = "offer2"
    public static let offer3 = "offer3"
    public static let offer4 = "offer4"
    public static let offer5 = "offer5"
    
    public static let animals = ["puppy1","kitten1","porcupine1","puppy2","panda1","dog1"]
    //        public static let menWrapSunglasses = ["menWrapSunglasses"]
    //
    //        public static let menRectangularSunglasses = ["menRectangularSunglasses"]
    //
    //        public static let menWayfarerSunglasses = ["menWayfarerSunglasses", "menWayfarerSunglasses2","menWayfarerSunglasses3","menWayfarerSunglasses4","menWayfarerSunglasses5"]
    //
    //        public static let menSportsSunglasses = ["menSportSunglasses"]
    //
    //        public static let menroundSunglasses = ["menRoundSunglasses", "menRoundSunglasses2","menRoundSunglasses3","menRoundSunglasses4"]
    //
    //        public static let menAviatorSunglasses = ["menAviatorSunglasses","menAviatorSunglasses2","menAviatorSunglasses3","menAviatorSunglasses4"]
  }
  
  //MARK: Dummy Data
  public struct ModelNames {
    public static let aviators = "aviators"
    public static let aviators2 = "aviators2"
    public static let squareSunGlasses = "squareSunGlasses"
    public static let simpleSquare = "simpleSquare"
    public static let noseRing = "noseRing"
    public static let crown1 = "crown1"
    public static let crown2 = "crown2"
    public static let tiara = "tiara"
    public static let nosePin = "nosePin"
    public static let nosePinFlat = "nosePinFlat"
    public static let earRing = "earRing"
    public static let pearlNoseRing = "earingPearl"
    public static let headband = "headband"
    public static let bunnyHairBand = "bunny_hair_band"
    public static let earRingPearl = "earRingPearl"
    public static let object3d = "glassesUSDZ"
    public static let glass1 = "glass1"
    public static let glass2 = "glass2"
    public static let glass3 = "glass3"
    public static let glass4 = "glass4"
    public static let glass5 = "glass5"
  }
  
  //    public struct MainCategories{
  //        public static let men = "Men"
  //        public static let women = "Women"
  //        public static let newArrivals = "New Arrivals"
  //        public static let kids = "Kids"
  //    }
  
  //    public struct SubCategories{
  //        public struct ForMen{
  //            public static let spectacles = CategoryItems.spectacles
  //            public static let shades = CategoryItems.shades
  //            public static let jewelerry = CategoryItems.jewelerry
  //            public static let tshirts = CategoryItems.tshirts
  //            public static let formalShirts = CategoryItems.formalShirts
  //            public static let jeans = CategoryItems.jeans
  //            public static let trousers = CategoryItems.trousers
  //            public static let casualShirts = CategoryItems.casualShirts
  //        }
  //        public struct ForWomen{
  //            public static let spectacles = CategoryItems.spectacles
  //            public static let shades = CategoryItems.shades
  //            public static let jewelerry = CategoryItems.jewelerry
  //            public static let tshirts = CategoryItems.tshirts
  //            public static let formalShirts = CategoryItems.formalShirts
  //            public static let jeans = CategoryItems.jeans
  //            public static let trousers = CategoryItems.trousers
  //            public static let casualShirts = CategoryItems.casualShirts
  //        }
  //        public struct ForNewArrivals{
  //            public static let shades = CategoryItems.shades
  //            public static let jewelerry = CategoryItems.jewelerry
  //            public static let tshirts = CategoryItems.tshirts
  //            public static let formalShirts = CategoryItems.formalShirts
  //            public static let trousers = CategoryItems.trousers
  //        }
  //        public struct ForKids{
  //            public static let shades = CategoryItems.shades
  //            public static let tshirts = CategoryItems.tshirts
  //            public static let jeans = CategoryItems.jeans
  //            public static let casualShirts = CategoryItems.casualShirts
  //        }
  //    }
  
  //    public struct ItemNames{
  //        static let AviatorsShades = "Aviators"
  //        static let WayfarerShades = "Wayfarer"
  //        static let RectangularShades = "Rectangular"
  //        static let SportsShades = "Sports"
  //        static let RoundShades = "Round"
  //        static let WrapShades = "Wrap"
  //        static let SquareShades = "Square"
  //        static let ReflectorShades = "Reflector"
  //    }
  
  //    public struct Items{
  //        public struct Men{
  //            public struct Shades{
  //                public static let names = ["Aviators","Wayfarer","Rectangular","Sports","Round","Wrap", "Square", "Reflector"]
  //            }
  //            public struct Spectacles{
  //                public static let names = ["Rectangular Frames","Wayfarer Frames","Round Frames","Half Rim Frames","Rimless Frames"]
  //            }
  //            public struct Jewelerry{
  //                public static let names = ["Ear Rings", "Face Chain", "Piercings"]
  //            }
  //            public struct TShirts{
  //                public static let names = ["Loose Fit","Regular Fit","Slim Fit","Half Sleeve","Long Sleeve","Sleeveless","Cap Sleeve", "3/4 Sleeve"]
  //            }
  //            public struct FormalShirts{
  //                public static let names = ["Loose Fit","Regular Fit","Slim Fit","Half Sleeve","Long Sleeve","Sleeveless","Cap Sleeve", "3/4 Sleeve"]
  //            }
  //            public struct Jeans{
  //                public static let names = ["Capri","Cargo", "Carrot", "Chino", "Jeggings", "Relaxed", "Dungarees"]
  //            }
  //            public struct Trousers{
  //                public static let names = ["Relaxed", "Slim Fit", "Tight Fit"]
  //            }
  //            public struct CasualShirts{
  //                public static let names = ["Loose Fit","Regular Fit","Slim Fit","Half Sleeve","Long Sleeve","Sleeveless","Cap Sleeve", "3/4 Sleeve"]
  //            }
  //        }
  //        public struct Women{
  //            public struct Shades{
  //                public static let names = ["Aviators","Wayfarer","Rectangular","Sports","Round","Wrap", "Square", "Reflector", "Cat-Eye"]
  //            }
  //            public struct Spectacles{
  //                public static let names = ["Rectangular Frames","Wayfarer Frames","Round Frames","Half Rim Frames","Rimless Frames"]
  //            }
  //            public struct Jewelerry{
  //                public static let names = ["Ear Rings", "Face Chain", "Nose Rings", "Tiara","Piercings"]
  //            }
  //            public struct TShirts{
  //                public static let names = ["Loose Fit","Regular Fit","Slim Fit","Half Sleeve","Long Sleeve","Sleeveless","Cap Sleeve", "3/4 Sleeve"]
  //            }
  //            public struct FormalShirts{
  //                public static let names = ["Loose Fit","Regular Fit","Slim Fit","Half Sleeve","Long Sleeve","Sleeveless","Cap Sleeve", "3/4 Sleeve"]
  //            }
  //            public struct Jeans{
  //                public static let names = ["Boyfriend","Cargo", "Capri", "Slim", "Jeggings", "Staight", "Pleat front"]
  //            }
  //            public struct Trousers{
  //                public static let names = ["Relaxed", "Slim Fit", "Tight Fit"]
  //            }
  //            public struct CasualShirts{
  //                public static let names = ["Loose Fit","Regular Fit","Slim Fit","Half Sleeve","Long Sleeve","Sleeveless","Cap Sleeve", "3/4 Sleeve"]
  //            }
  //        }
  //        public struct NewArrivals{
  //            public struct Shades{
  //                public static let names = ["Aviators","Wayfarer","Round","Wrap", "Square", "Cat-Eye"]
  //            }
  //            public struct Jewelerry{
  //                public static let names = ["Ear Rings", "Face Chain", "Nose Rings"]
  //            }
  //            public struct TShirts{
  //                public static let names = ["Loose Fit","Regular Fit","Half Sleeve","Long Sleeve","Sleeveless","Cap Sleeve", "3/4 Sleeve"]
  //            }
  //            public struct FormalShirts{
  //                public static let names = ["Loose Fit","Half Sleeve","Long Sleeve","Sleeveless","Cap Sleeve", "3/4 Sleeve"]
  //            }
  //            public struct Trousers{
  //                public static let names = ["Relaxed", "Tight Fit"]
  //            }
  //        }
  //        public struct Kids{
  //            public struct Shades{
  //                public static let names = ["Aviators","Wayfarer","Rectangular","Round",]
  //            }
  //            public struct TShirts{
  //                public static let names = ["Half Sleeve","Long Sleeve","Sleeveless","Cap Sleeve", "3/4 Sleeve"]
  //            }
  //            public struct Jeans{
  //                public static let names = ["Cargo", "Capri", "Slim", "Jeggings"]
  //            }
  //            public struct CasualShirts{
  //                public static let names = ["Half Sleeve","Long Sleeve","Sleeveless","Cap Sleeve", "3/4 Sleeve"]
  //            }
  //        }
  //    }
  
  //    public struct CategoryItems{
  //        public static let spectacles = "Spectacles"
  //        public static let shades = "Shades"
  //        public static let jewelerry = "Jewelerry"
  //        public static let tshirts = "T Shirts"
  //        public static let formalShirts = "Formal Shirts"
  //        public static let jeans = "Jeans"
  //        public static let trousers = "Trousers"
  //        public static let casualShirts = "Casual Shirts"
  //    }
}
