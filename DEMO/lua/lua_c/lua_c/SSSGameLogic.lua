--
-- Author: hezhilong
--
local GameLogic = {}

----扑克类型
GameLogic.CT_INVALID					    =0							
GameLogic.CT_SINGLE						    =1							
GameLogic.CT_ONE_DOUBLE					    =2							
GameLogic.CT_FIVE_TWO_DOUBLE			    =3							
GameLogic.CT_THREE						    =4	
GameLogic.CT_TOW_WANG            	    	=5								
GameLogic.CT_THREE_WANG            		    =6															
GameLogic.CT_FIVE_MIXED_FLUSH_NO_A		    =7								
GameLogic.CT_FIVE_MIXED_FLUSH_FIRST_A	    =8							
GameLogic.CT_FIVE_MIXED_FLUSH_BACK_A	    =9							
GameLogic.CT_FIVE_FLUSH					    =10							
GameLogic.CT_FIVE_THREE_DEOUBLE			    =11								
GameLogic.CT_FIVE_FOUR_ONE				    =12						
GameLogic.CT_FIVE_STRAIGHT_FLUSH_NO_A		=13								
GameLogic.CT_FIVE_STRAIGHT_FLUSH_FIRST_A	=14								
GameLogic.CT_FIVE_STRAIGHT_FLUSH_BACK_A	    =15

GameLogic.CT_FIVE_WANG                      =45							
GameLogic.CT_FIVE_BOMB					    =44								
GameLogic.CT_FIVE_MID_THREE_DEOUBLE		    =100								


GameLogic.CT_THIRTEEN_FLUSH              	=31                              //同花十三水
GameLogic.CT_THIRTEEN                    	=30                              //十三水  //13张顺子
GameLogic.CT_TWELVE_KING                 	=29                              //十二皇族//不用
GameLogic.CT_TEN_SAME						=28                               //十同

GameLogic.CT_THREE_STRAIGHTFLUSH         	=27                              //三同花顺
GameLogic.CT_THREE_BOMB                  	=26                              //三炸弹
GameLogic.CT_NINE_SAME						=25
GameLogic.CT_EIGHT_SAME						=24
GameLogic.CT_SEVEN_SAME						=23

GameLogic.CT_SIX_SAME						=21								//六同  //6张一样
GameLogic.CT_ALL_SMALL                   	=20                              //全小//不用
GameLogic.CT_SAME_COLOR                  	=19                              //凑一色//不用
GameLogic.CT_FOUR_THREESAME              	=18                              //四套三条//4个3条或3个3条1个4条
GameLogic.CT_FIVEPAIR_THREE              	=17                              //五对冲三//和六对半一样
GameLogic.CT_SIXPAIR                     	=16                              //六对半
GameLogic.CT_THREE_FLUSH                 	=15                              //三同花
GameLogic.CT_THREE_STRAIGHT              	=14                              //三顺子
									  	
GameLogic.LX_ONEPARE                     	=13                              //一对
GameLogic.LX_TWOPARE                     	=14                              //两对
GameLogic.LX_THREESAME                   	=15                              //三条//3带两单
GameLogic.LX_STRAIGHT                    	=16                              //顺子
GameLogic.LX_FLUSH                       	=17                              //同花
GameLogic.LX_GOURD                       	=18                              //葫芦//3带对子
GameLogic.LX_FOURSAME                    	=19                              //铁支//4个带1//5同									
GameLogic.LX_STRAIGHTFLUSH               	=20                              //同花顺
                       	


GameLogic.CARD_MASK_COLOR				    =0xF0							
GameLogic.CARD_MASK_VALUE				    =0x0F							
GameLogic.CARD_DW                           =16
GameLogic.CARD_XW                           =15
							




--排序类型
GameLogic.enDescend = 0						--降序类型
GameLogic.enAscend  = 1						--升序类型
GameLogic.enColor   = 2						--花色类型

--比牌结果
GameLogic.enCRLess = 1     	--First > Next
GameLogic.enCREqual = 0		--First == Next
GameLogic.enCRGreater = -1	--First < Next
GameLogic.enCRError = 3		--error

--索引变量
local cbIndexCount = 4

--手牌数目
local HAND_CARD_COUNT = 13

function GameLogic.getAnalyseData(  )
    return
    {
        bOneCount   	= 0, 								
        bTwoCount   	= 0, 									
        bThreeCount 	= 0, 								
        bFourCount  	= 0, 								
        bFiveCount  	= 0, 								
        bSixCount   	= 0, 	
        bSevenCount 	= 0, 	
        bEightCount 	= 0, 	
        bNineCount  	= 0, 	
        bTenCount   	= 0, 	
        bOneFirst   	= {},						
        bTwoFirst   	= {},							
        bThreeFirst 	= {},						
        bFourFirst  	= {},							
        bFiveFirst  	= {},							
        bSixFirst   	= {},
        bSevenFirst 	= {},
        bEightFirst 	= {},
        bNineFirst  	= {},
        bTenFirst   	= {},
        bStraight   	= false, 
        byGuiCout   	= 0,
		byQuanGuiFlag   = 0,	
    }
end

function GameLogic.getAnalyseType(  )
    return
    {
        bOnePare        = false,                          
		bTwoPare        = false,                          
		bThreeSame      = false,                        
		bStraight       = false,                          
		bFlush          = false,                            
		bGourd          = false,                            
		bFourSame       = false,                         
		bStraightFlush  = false,                    
		bFiveSame       = false,                                
        cbOnePare       = {},                     
        cbTwoPare       = {},                    
        cbThreeSame     = {},                  
        cbStraight      = {},                    
        cbFlush         = {},                       
        cbGourd         = {},                      
        cbFourSame      = {},                  
        cbStraightFlush = {},              
        cbFiveSame      = {},                        
        bbOnePare       = {},                    
        bbTwoPare       = {},                    
        bbThreeSame     = {},                   
        bbStraight      = {},                   
        bbFlush         = {},                       
        bbGourd         = {},                 
        bbFourSame      = {},                     
        bbStraightFlush = {},            
        bbFiveSame      = {},                          
        btOnePare       = 0,                        
        btThreeSame     = 0,                        
        btTwoPare       = 0,                           
        btStraight      = 0,                        
        btFlush         = 0,                            
        btGourd         = 0,                           
        btFourSame      = 0,                         
        btStraightFlush = 0,                  
        btFiveSame      = 0,     
    }
end



-- 	return 0;
-- }
print("haha")
	
return GameLogic

