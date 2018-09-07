--
-- Author: Preate
-- Date: 2018-05-22 14:26:00
--
local GameLogic = {}

----扑克类型
GameLogic.CT_INVALID					    =0							
GameLogic.CT_SINGLE						    =1							
GameLogic.CT_ONE_DOUBLE					    =2							
GameLogic.CT_FIVE_TWO_DOUBLE			    =3							
GameLogic.CT_THREE						    =4								
GameLogic.CT_FIVE_MIXED_FLUSH_NO_A		    =5								
GameLogic.CT_FIVE_MIXED_FLUSH_FIRST_A	    =6							
GameLogic.CT_FIVE_MIXED_FLUSH_BACK_A	    =7							
GameLogic.CT_FIVE_FLUSH					    =8							
GameLogic.CT_FIVE_THREE_DEOUBLE			    =9								
GameLogic.CT_FIVE_FOUR_ONE				    =10							
GameLogic.CT_FIVE_STRAIGHT_FLUSH_NO_A		=11								
GameLogic.CT_FIVE_STRAIGHT_FLUSH_FIRST_A	=12								
GameLogic.CT_FIVE_STRAIGHT_FLUSH_BACK_A	    =13								
GameLogic.CT_FIVE_BOMB					    =44								
GameLogic.CT_FIVE_MID_THREE_DEOUBLE		    =100								

GameLogic.CT_QUAN_LEI_DA                    =33
GameLogic.CT_DA_QIANG                       =32
GameLogic.CT_THIRTEEN_FLUSH                 =31
GameLogic.CT_THIRTEEN                       =30
GameLogic.CT_TWELVE_KING                    =29
GameLogic.CT_TEN_SAME                       =28
GameLogic.CT_NINE_SAME                      =27
GameLogic.CT_EIGHT_SAME                     =26
GameLogic.CT_SEVEN_SAME                     =25
GameLogic.CT_SIX_SAME                       =24
GameLogic.CT_THREE_STRAIGHTFLUSH            =23                             
GameLogic.CT_THREE_BOMB                     =22                             
GameLogic.CT_ALL_BIG                        =21                             
GameLogic.CT_ALL_SMALL                      =20                            
GameLogic.CT_SAME_COLOR                     =19                            
GameLogic.CT_FOUR_THREESAME                 =18                             
GameLogic.CT_FIVEPAIR_THREE                 =17                            
GameLogic.CT_SIXPAIR                        =16                             
GameLogic.CT_THREE_FLUSH                    =15                            
GameLogic.CT_THREE_STRAIGHT                 =14                             

GameLogic.LX_ONEPARE                        =13                             
GameLogic.LX_TWOPARE                        =14                             
GameLogic.LX_THREESAME                      =15                            
GameLogic.LX_STRAIGHT                       =16                             
GameLogic.LX_FLUSH                          =17                             
GameLogic.LX_GOURD                          =18                             
GameLogic.LX_FOURSAME                       =19                             
GameLogic.LX_STRAIGHTFLUSH                  =20                            


GameLogic.CARD_MASK_COLOR				    =0xF0							
GameLogic.CARD_MASK_VALUE				    =0x0F							
GameLogic.CARD_DW                           =16
GameLogic.CARD_XW                           =15

GameLogic.CARD_COUNT						=65								




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
        bOneCount   = 0, 								
        bTwoCount   = 0, 									
        bThreeCount = 0, 								
        bFourCount  = 0, 								
        bFiveCount  = 0, 								
        bSixCount   = 0, 	
        bSevenCount = 0, 	
        bEightCount = 0, 	
        bNineCount  = 0, 	
        bTenCount   = 0, 	
        bOneFirst   = {},						
        bTwoFirst   = {},							
        bThreeFirst = {},						
        bFourFirst  = {},							
        bFiveFirst  = {},							
        bSixFirst   = {},
        bSevenFirst = {},
        bEightFirst = {},
        bNineFirst  = {},
        bTenFirst   = {},
        bStraight   = false, 	
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

GameLogic.m_bCardListData = 
{
    0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,	
    0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,	
    0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2A,0x2B,0x2C,0x2D,
    0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x3A,0x3B,0x3C,0x3D,	
    0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,
}

GameLogic.btCardSpecialData = {0,0,0,0,0,0,0,0,0,0,0,0,0}

GameLogic.m_combineResult = {}
--[[
local cbLineCardData = {{0,0,0,0,0},
							{0,0,0,0,0},
							{0,0,0,0,0}}
]]

-- 获取牌值(1-15) 14 15 大小王
function GameLogic.GetCardValue(cbCardData)
    return yl.POKER_VALUE[cbCardData]
end

-- 获取花色(0-4)
function GameLogic.GetCardColor(cbCardData)
    return yl.CARD_COLOR[cbCardData]
end

--获取逻辑数值
function GameLogic:GetCardLogicValue(cbCardData)
	local bCardValue = GameLogic.GetCardValue(cbCardData)
	return bCardValue == 1 and (bCardValue + 13) or bCardValue
end

function GameLogic:GetCardType(bCardData,bCardCount)
	local btSpecialCard = {}
	
	if bCardCount ~= 3 and bCardCount ~= 5 and bCardCount ~= 13 then
		return GameLogic.CT_INVALID,btSpecialCard
	end
	
	--有待添加
	tagAnalyseData AnalyseData 
	AnalyseCard(bCardData , bCardCount , AnalyseData) 
	
	if bCardCount == 3 then 	
		if AnalyseData.bOneCount == 3 then 
			return GameLogic.CT_SINGLE,btSpecialCard
		end
		
		if AnalyseData.bTwoCount == 1 and AnalyseData.bOneCount == 1 then
			return GameLogic.CT_ONE_DOUBLE,btSpecialCard
		end
		
		if AnalyseData.bThreeCount == 1 then
			return GameLogic.CT_THREE,btSpecialCard 
		end
		
		return GameLogic.CT_INVALID,btSpecialCard 
	elseif bCardCount == 5 then
		local bFlushNoA	    = false  	
		local bFlushFirstA	= false 		
		local bFlushBackA	= false 
		
		if self:GetCardLogicValue(bCardData[1]) >= GameLogic.CARD_XW and self:GetCardLogicValue(bCardData[2]) < GameLogic.CARD_XW then
			if GetCardLogicValue(bCardData[5]) >= 10 then			
				bFlushBackA = true;
				for i = 1,4 do				
					if self:GetCardLogicValue(bCardData[i]) == self:GetCardLogicValue(bCardData[i+1]) then
						bFlushBackA = false;
						break;
					end
				end			
			elseif self:GetCardLogicValue(bCardData[1] == 14 and self:GetCardLogicValue(bCardData[2]) <= 5 then			
				bFlushFirstA = true;
				for i = 2,4 do			
					if self:GetCardLogicValue(bCardData[i]) - self:GetCardLogicValue(bCardData[i+1]) == 0 then					
						bFlushFirstA = false;
						break;
					end
				end
			
			elseif 5 == self:GetCardLogicValue(bCardData[1]) and 
				   4 == self:GetCardLogicValue(bCardData[2]) and 
				   3 == self:GetCardLogicValue(bCardData[3]) and 
				   2 == self:GetCardLogicValue(bCardData[4]) then
			
				bFlushFirstA = true;			
			else			
				bFlushNoA = true;
				local bRes = false;
				for i=1,4 do
					local A=self:GetCardLogicValue(bCardData[i]);
					local B=self:GetCardLogicValue(bCardData[i+1]);
					local nValue=A-B;
					
					if nValue==2 then					
						if not bRes then  
							bRes=true;
						else
							bFlushNoA = false;
							break;
						end
					end
					
					if 1 ~= nValue then
						bFlushNoA = false;
						break;
					end
				end
			end
		elseif self:GetCardLogicValue(bCardData[1])== GameLogic.CARD_DW and self:GetCardLogicValue(bCardData[2]) == GameLogic.CARD_XW then			
			if self:GetCardLogicValue(bCardData[4])>=10 then		
				bFlushBackA = true;
				for i=2,4 do
					if self:GetCardLogicValue(bCardData[i]) == self:GetCardLogicValue(bCardData[i+1]) then			
						bFlushBackA = false;
						break;
					end
				end			
			elseif 14==self:GetCardLogicValue(bCardData[2]) and 5>=self:GetCardLogicValue(bCardData[3]) then
				bFlushFirstA = true;
				for i=3,4 do
					if self:GetCardLogicValue(bCardData[i])-self:GetCardLogicValue(bCardData[i+1]) == 0 then
						bFlushFirstA = false;
						break;
					end
				end
			elseif 5>=self:GetCardLogicValue(bCardData[2]) then
				bFlushFirstA = true;
				for i=2,4 do
					if self:GetCardLogicValue(bCardData[i])-self:GetCardLogicValue(bCardData[i+1]) == 0 then					
						bFlushFirstA = false;
						break;
					end
				end
			else
				bFlushNoA = true;
				local bRes1 = false;
				local bRes2 = false;
				for i=2,4 do
					local A=self:GetCardLogicValue(bCardData[i]);
					local B=self:GetCardLogicValue(bCardData[i+1]);
					local nValue=A-B;
					
					if nValue==3 then
						if not bRes1 and not bRes2 then
							bRes1 = true;
							bRes2 = true;
						else
							bFlushNoA = false;
							break;
						end						
					end
					
					if nValue == 2 then
						if not bRes1 then
							bRes1 = true;
						elseif not bRes2 then
							bRes2 = true;
						else
						
							bFlushNoA = false;
							break;
						end
					end
					
					if 1 ~= nValue and nValue ~= 2 and nValue ~=3 then
						bFlushNoA = false;
						break;
					end					
				end	
			end
		else
			if 14==self:GetCardLogicValue(bCardData[1]) and 10==self:GetCardLogicValue(bCardData[5])	
				bFlushBackA = true 
			else
				bFlushNoA = true 
			end
			
			for i=0,4 do
				local nValue=self:GetCardLogicValue(bCardData[i+1])-self:GetCardLogicValue(bCardData[i+2])
				if 1~=nValue then
					bFlushBackA = false 
					bFlushNoA   = false
					break;
				end
			end
			
			if false==bFlushBackA and false==bFlushNoA and 14==self:GetCardLogicValue(bCardData[0]) then
				bFlushFirstA = true ;
				for i=1 ,4 do
					if self:GetCardLogicValue(bCardData[i])-self:GetCardLogicValue(bCardData[i+1]) ~= 1 then
						bFlushFirstA = false ;
					end
				end		
				if 2~=self:GetCardLogicValue(bCardData[4]) then
					bFlushFirstA = false ;
				end
			end		
		end
		
		
		--多一色的时候，可能出现既是同花又是葫芦铁支的情况，因此同花顺的先判断，同花的放到后面去
		if AnalyseData.bStraight then		
			if true==bFlushNoA then
				return GameLogic.CT_FIVE_STRAIGHT_FLUSH_NO_A,btSpecialCard 
			elseif true==bFlushFirstA then
				return GameLogic.CT_FIVE_STRAIGHT_FLUSH_FIRST_A,btSpecialCard 
			elseif true==bFlushBackA then
				return GameLogic.CT_FIVE_STRAIGHT_FLUSH_BACK_A,btSpecialCard 
			end
		end
		
		
		if 1==AnalyseData.bFiveCount then
			return GameLogic.CT_FIVE_BOMB,btSpecialCard
		end
		
		if 1==AnalyseData.bFourCount and 1==AnalyseData.bOneCount then
			return GameLogic.CT_FIVE_FOUR_ONE,btSpecialCard 
		end

		if 1==AnalyseData.bThreeCount and 1==AnalyseData.bTwoCount then
			return GameLogic.CT_FIVE_THREE_DEOUBLE,btSpecialCard 
		end
		
		if false==bFlushBackA and false==bFlushNoA and false==bFlushFirstA then
			if true==AnalyseData.bStraight then
				return GameLogic.CT_FIVE_FLUSH,btSpecialCard 
			end	
		elseif true==bFlushNoA then
			if false==AnalyseData.bStraight then
				return GameLogic.CT_FIVE_MIXED_FLUSH_NO_A,btSpecialCard
			end
		elseif true==bFlushFirstA then
			if false==AnalyseData.bStraight then
				return GameLogic.CT_FIVE_MIXED_FLUSH_FIRST_A,btSpecialCard
			end
		elseif true==bFlushBackA then		
			if false==AnalyseData.bStraight then
				return GameLogic.CT_FIVE_MIXED_FLUSH_BACK_A,btSpecialCard
			end
		end

		if 1==AnalyseData.bThreeCount and 2==AnalyseData.bOneCount then
			return GameLogic.CT_THREE,btSpecialCard
		end
	
		if 2==AnalyseData.bTwoCount and 1==AnalyseData.bOneCount then
			return GameLogic.CT_FIVE_TWO_DOUBLE,btSpecialCard 
		end
	
		if 1==AnalyseData.bTwoCount and 3==AnalyseData.bOneCount then
			return GameLogic.CT_ONE_DOUBLE,btSpecialCard 
		end
		
		if 5==AnalyseData.bOneCount and false==AnalyseData.bStraight then
			return  GameLogic.CT_SINGLE,btSpecialCard 
		end
		
		return GameLogic.CT_INVALID,btSpecialCard
	elseif bCardCount == 13 then
		local TwelveKing=false;
		if 13==AnalyseData.bOneCount and true==AnalyseData.bStraight then
			return GameLogic.CT_THIRTEEN_FLUSH,btSpecialCard
		end
		
		if 13==AnalyseData.bOneCount then
			return GameLogic.CT_THIRTEEN,btSpecialCard
		end
		
		if AnalyseData.bTenCount > 0 then
			return GameLogic.CT_TEN_SAME,btSpecialCard
		end
		
		if  AnalyseData.bNineCount > 0 then
			return GameLogic.CT_NINE_SAME,btSpecialCard
		end
		
		if AnalyseData.bEightCount > 0 then		
			return GameLogic.CT_EIGHT_SAME,btSpecialCard
		end
		
		if AnalyseData.bSevenCount > 0 then		
			return GameLogic.CT_SEVEN_SAME,btSpecialCard
		end
		
		if AnalyseData.bSixCount > 0 then		
			return GameLogic.CT_SIX_SAME,btSpecialCard
		end
		
		--有待添加
		local bThreeStraightFlush = self:IsThreeFlushStraight(bCardData,bCardCount)
		if bThreeStraightFlush then
			return GameLogic.CT_THREE_STRAIGHTFLUSH,btSpecialCard
		end
		
		if 3==AnalyseData.bFourCount then
			return GameLogic.CT_THREE_BOMB,btSpecialCard
		end	
		
		if 4==AnalyseData.bThreeCount or (3==AnalyseData.bThreeCount and 1==AnalyseData.bFourCount) then
			return GameLogic.CT_FOUR_THREESAME,btSpecialCard
		end
		
		if (5==AnalyseData.bTwoCount and 1==AnalyseData.bThreeCount) or (3==AnalyseData.bTwoCount and 1==AnalyseData.bFourCount and 1==AnalyseData.bThreeCount)
		   or (1==AnalyseData.bTwoCount and 2==AnalyseData.bFourCount and 1==AnalyseData.bThreeCount) then

			return GameLogic.CT_FIVEPAIR_THREE,btSpecialCard
		end

		if 6==AnalyseData.bTwoCount or (4==AnalyseData.bTwoCount and 1==AnalyseData.bFourCount) or (2==AnalyseData.bTwoCount and 2==AnalyseData.bFourCount)
		   or (3==AnalyseData.bFourCount) then

			return GameLogic.CT_SIXPAIR,btSpecialCard
		end 
		
		local bCardList = clone(bCardData)		
		local bLeftCCount = 13;
		local Flush = true;	
		for i = 0,3 do
			i = i+1
			local isFlush,bTempCard,bTempCCount = IsFlush(bCardList, bLeftCCount, bTempCard[i], bTempCCount[i], (i==2?3:5))
			if not isFlush then
				Flush = false;
				break;
			end
			
			local value,tempData = self:RemoveCard(bTempCard[i], bTempCCount[i], bCardList, bLeftCCount)
			if value then
				bLeftCCount -= bTempCCount[i]
			end
			
			if i < 2 then
				btSpecialCard[i*5] = clone(bTempCard[i])		
			else 
				btSpecialCard[10] = clone(bTempCard[i])		
			end
		end
		
		if Flush then
			return GameLogic.CT_THREE_FLUSH,btSpecialCard
		end
			
		local bCardList = clone(bCardData)
		self:SortCardList(bCardList,13)
		local bLeftCount = 13;
		local cbStraight = {0,0,0,0,0}
		local bTempCount = 5
		
		local tagCardType = self:GetType(bCardList,bLeftCount)
		if tagCardType.bStraight then
			btSpecialCard = {}
			
			for i = 0,tagCardType.btStraight do
				i = i + 1
				bCardList = clone(bCardData)
				bLeftCount = 13
				self:SortCardList(bCardList,13)
				cbStraight = {0,0,0,0,0}
				cbStraight[0]=bCardList[tagCardType.cbStraight[i*5]]
				cbStraight[1]=bCardList[tagCardType.cbStraight[i*5+1]]
				cbStraight[2]=bCardList[tagCardType.cbStraight[i*5+2]]
				cbStraight[3]=bCardList[tagCardType.cbStraight[i*5+3]]
				cbStraight[4]=bCardList[tagCardType.cbStraight[i*5+4]]
				
				--这里在某种牌型下，会出错，需返回掉
				local value,tempData = self:RemoveCard(cbStraight, bTempCount, bCardList, bLeftCount)				
				if value then				
					bLeftCount = bLeftCount -bTempCount
					btSpecialCard = clone(cbStraight)
					local bLeftCardList = {0,0,0,0,0,0,0,0,0,0,0,0,0}
					local bLeftCount1 =bLeftCount
					
					local tagCardType1 = GetType(tempData,bLeftCount)
					if tagCardType1.bStraight then					
						for j = 0,tagCardType1.btStraight do
							j = j + 1														
							tempData = clone(bLeftCardList)
							cbStraight = {0,0,0,0,0}
							bLeftCount =bLeftCount1
							cbStraight[0]=tempData[tagCardType1.cbStraight[j*5]]
							cbStraight[1]=tempData[tagCardType1.cbStraight[j*5+1]]
							cbStraight[2]=tempData[tagCardType1.cbStraight[j*5+2]]
							cbStraight[3]=tempData[tagCardType1.cbStraight[j*5+3]]
							cbStraight[4]=tempData[tagCardType1.cbStraight[j*5+4]]
							
							local value,tempData1 = self:RemoveCard(cbStraight, bTempCount, bCardList, bLeftCount)	
							if value then
								bLeftCount = bLeftCount - bTempCount
								--此处翻译有异议
								--memcpy(btSpecialCard+5,cbStraight, bTempCount);
								for i=1,bTempCount do
									table.insert(btSpecialCard,cbStraight[i])
								end
								
								
								local bThreeStraight = false
								self:SortCardList(tempData1 , bLeftCount, GameLogic.enDescend)
								if self:GetCardLogicValue(tempData1[1]) >= GameLogic.CARD_XW and self:GetCardLogicValue(tempData1[2]) < GameLogic.CARD_XW then
									if self:GetCardLogicValue(tempData1[2])-self:GetCardLogicValue(tempData1[3])==1
									   or self:GetCardLogicValue(tempData1[2])-self:GetCardLogicValue(tempData1[3])==2
									   or (self:GetCardLogicValue(tempData1[2]) == 14 and self:GetCardLogicValue(tempData1[3])<=3) then
									   
										bThreeStraight = true
									end
								elseif self:GetCardLogicValue(tempData1[1]) == GameLogic.CARD_DW and self:GetCardLogicValue(tempData1[2]) == GameLogic.CARD_XW then
									bThreeStraight = true
								else
									if (self:GetCardLogicValue(tempData1[1])==self:GetCardLogicValue(tempData1[2])+1 and self:GetCardLogicValue(tempData1[2])==self:GetCardLogicValue(tempData1[3])+1)
									   or (self:GetCardLogicValue(tempData1[1]) == 14 and self:GetCardLogicValue(tempData1[2])==3 and self:GetCardLogicValue(tempData1[3])==2) then

										bThreeStraight = true
									end
								end
								if bThreeStraight then
									--此处翻译有异议
									--memcpy(btSpecialCard+10,tempData1 , bLeftCount)
									for i=1,bLeftCount do
										table.insert(btSpecialCard,tempData1[i])
									end
								
									return CT_THREE_STRAIGHT,btSpecialCard
								end
							end
						end						
					end
				end
			end
		end
	end

	return CT_INVALID,btSpecialCard
end
    
-- --function GameLogic:IsFlush(const BYTE cbCardData[], const BYTE cbCardCount, BYTE bMaxCardData[], BYTE & bMaxCardCount, BYTE bNeedCCount)
-- function GameLogic:IsFlush(const BYTE cbCardData[], const BYTE cbCardCount,BYTE bNeedCCount)
-- 	local bMaxCardData = {}
-- 	local bMaxCardCount = 0
-- 	local bKCount = 0;
	
-- 	local evCardList = {}
-- 	local evColorList = {}
-- 	local bCardArray = clone(cbCardData)

-- 	self:SortCardList(bCardArray, cbCardCount, GameLogic.enDescend);
	
-- 	for i = 0,cbCardCount do
-- 		if bCardArray[i+1] == 0x41 or bCardArray[i+1] == 0x42 then
-- 			table.insert(evCardList[1],bCardArray[i+1])
-- 		else
-- 			local bLogicNum = self:GetCardLogicValue(bCardArray[i+1])
-- 			local bColor = self:GetCardColor(bCardArray[i+1])									
-- 			table.insert(evCardList[bLogicNum],bCardArray[i+1])
-- 			table.insert(evColorList[bColor],bCardArray[i+1])
-- 		end	
-- 	end
	
-- 	local bUseKingCount = {0,0,0,0}
-- 	local bPossibleCard = {}
-- 	local maxCardColorList = {}
-- 	for i = 0, 4 do
-- 		if #evColorList[i+1] + #evCardList[1] >= bNeedCCount then		
-- 			if #evColorList[i+1] >= bNeedCCount then
-- 				for k = 0,bNeedCCount do
-- 					bPossibleCard[i+1][k+1] = evColorList[i+1][k+1]
-- 				end
-- 			else
-- 				for j = 0,bNeedCCount - #evColorList[i+1] do
-- 					bPossibleCard[i+1][j+1] = evCardList[1][j+1)]
-- 					bUseKingCount[i+1] = bUseKingCount[i+1] + 1
-- 				end
-- 				for k = 0,#evColorList[i+1] do
-- 					bPossibleCard[i+1][j+k+1] = evColorList[i+1][k+1]
-- 				end
-- 			end
-- 			table.insert(maxCardColorList,i+1)
-- 		end
-- 	end
	
-- 	if #maxCardColorList ~= 0 then		
-- 		local bMinKing = maxCardColorList[1]
-- 		for i = 1,#maxCardColorList do
-- 			lcoal bColor = maxCardColorList[i]
-- 			if bUseKingCount[bColor] < bUseKingCount[bMinKing] then
-- 				bMinKing = bColor
-- 			end
-- 		end
-- 		bMaxCardData = clone(bPossibleCard[bMinKing])
-- 		bMaxCardCount = bNeedCCount;		
-- 		return true,bMaxCardData,bMaxCardCount
-- 	end
-- 	return false,bMaxCardData,bMaxCardCount
-- end

-- --逻辑值排序
-- function GameLogic:SortCardList( cbCardData, cbCardCount, cbSortType)
-- 	if cbCardCount == 0 or cbCardCount > 13 then
-- 		return
-- 	end

-- 	local cbSortValue = {}
-- 	for i=1,cbCardCount do
--         local value = self:GetCardLogicValue(cbCardData[i])
--         table.insert(cbSortValue, i, value)
--     end
	
-- 	-- dump(cbSortValue)
-- 	-- dump(cbCardData)
-- 	--排序操作
-- 	if GameLogic.enDescend == cbSortType then
-- 		local bSorted = true
-- 		local cbLast = cbCardCount - 1
-- 		repeat
-- 			bSorted = true
-- 			for i=1,cbLast do
-- 				--print(i,cbLast, cbSortValue[i], cbCardData[i])
-- 				if (cbSortValue[i] < cbSortValue[i+1])
-- 					or ((cbSortValue[i] == cbSortValue[i + 1]) and (cbCardData[i] < cbCardData[i + 1])) then
-- 					--设置标志
-- 					bSorted = false

-- 					--扑克数据
-- 					cbCardData[i], cbCardData[i + 1] = cbCardData[i + 1], cbCardData[i]				

-- 					--排序权位
-- 					cbSortValue[i], cbSortValue[i + 1] = cbSortValue[i + 1], cbSortValue[i]
-- 				end
-- 			end
-- 			cbLast = cbLast - 1
-- 		until bSorted ~= false
-- 	elseif GameLogic.enAscend == cbSortType then
-- 		local bSorted = true
-- 		local cbLast = cbCardCount - 1
-- 		repeat
-- 			bSorted = true
-- 			for i=1,cbLast do
-- 				if (cbSortValue[i] > cbSortValue[i+1])
-- 					or ((cbSortValue[i] == cbSortValue[i + 1]) and (cbCardData[i] > cbCardData[i + 1])) then
-- 					--设置标志
-- 					bSorted = false

-- 					--扑克数据
-- 					cbCardData[i], cbCardData[i + 1] = cbCardData[i + 1], cbCardData[i]				

-- 					--排序权位
-- 					cbSortValue[i], cbSortValue[i + 1] = cbSortValue[i + 1], cbSortValue[i]
-- 				end
-- 			end
-- 			cbLast = cbLast - 1
-- 		until bSorted ~= false
			
-- 	elseif GameLogic.enColor == cbSortType then
-- 		local bSorted=true
-- 		local bTempData = 0
-- 		local cbLast=bCardCount-1
-- 		local m_bCardCount=1
-- 		local bColor = {0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 		for i=0,bCardCount do
-- 			i = i + 1
-- 			bColor[i]=GameLogic.GetCardColor(cbCardData[i])
-- 		end
		
-- 		repeat
-- 		{
-- 			bSorted=true
-- 			for i=0,cbLast do
-- 				i = i + 1
-- 				if (bColor[i]<bColor[i+1]) or ((bColor[i]==bColor[i+1]) and (GetCardLogicValue(cbCardData[i])<GetCardLogicValue(cbCardData[i+1]))) then

-- 					bTempData=cbCardData[i]
-- 					cbCardData[i]=cbCardData[i+1]
-- 					cbCardData[i+1]=bTempData
-- 					bTempData=bColor[i]
-- 					bColor[i]=bColor[i+1]
-- 					bColor[i+1]=bTempData
-- 					bSorted=false
-- 				end
-- 			end
-- 			cbLast = cbLast - 1
-- 		until bSorted ~= false
-- 	end
-- end

-- --删除数据
-- function GameLogic:RemoveCard(removeData,removeCount,cbCardData,cbCardCount)
-- 	assert(removeCount <= cbCardCount)
-- 	local cbDeleteCount = 0
-- 	local cbTempCardData = {}

-- 	--拷贝数据
-- 	cbTempCardData = clone(cbCardData)

-- 	--置零数据
-- 	for i=1,removeCount do
-- 		for j=1,cbCardCount do
-- 			if removeData[i] == cbTempCardData[j] then 
-- 				cbDeleteCount = cbDeleteCount + 1
-- 				cbTempCardData[j] = 0
-- 				break
-- 			end
-- 		end
-- 	end

-- 	if cbDeleteCount ~= removeCount then
-- 		return false
-- 	end
	
-- 	local cbTemp = {}
-- 	local cbcount = 1
-- 	for k,v in pairs(cbTempCardData) do
-- 		if v ~= 0 then
-- 			cbTemp[cbcount] = v
-- 			cbcount = cbcount + 1
-- 		end
-- 	end

-- 	return true,cbTemp
-- end


-- function CGameLogic:GetType( bCardData,bCardCount )
-- 	local Type = GameLogic.getAnalyseType()
-- 	if bCardCount==0 then
-- 		return Type
-- 	end

-- 	local CardData = clone(bCardData)
-- 	self:SortCardList(CardData , bCardCount , CGameLogic.enDescend) 
	
-- 	local Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 	local Number=0
-- 	local SameValueCount=1
-- 	local Num={0,0,0,0,0,0,0,0,0}
	
-- 	if self:GetCardLogicValue(CardData[1]) >= CGameLogic.CARD_XW and self:GetCardLogicValue(CardData[2]) < CGameLogic.CARD_XW then
-- 		local bLogicValue=self:GetCardLogicValue(CardData[2])
-- 		Number = Number+1
-- 		Index[Number]=1	
-- 		--类似这种处翻译都有异议 懂规则的改		
-- 		for i=2,bCardCount do		
-- 			i = i + 1
-- 			if bLogicValue == self:GetCardLogicValue(CardData[i]) then			
-- 				SameValueCount = SameValueCount+1
-- 				Number = Number+1
-- 				Index[Number]=i;
-- 			end
-- 			if bLogicValue ~= self:GetCardLogicValue(CardData[i]) or i==bCardCount-1 then
-- 				if SameValueCount==1 then
-- 					Type.bOnePare=true
-- 					Num[1] = Num[1]+1
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-1+1]
-- 					Type.cbOnePare[Num[1]]=0;
-- 					Type.btOnePare = Type.btOnePare + 1
-- 				elseif SameValueCount==2 then
-- 					Type.bOnePare=true
-- 					Num[1] = Num[1]+1
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-2+1]
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-1+1]
-- 					Type.btOnePare = Type.btOnePare + 1
-- 					Type.bThreeSame=true
-- 					Num[3] = Num[3]+1
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-2+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-1+1]
-- 					Type.cbThreeSame[Num[3]]=0;
-- 					Type.btThreeSame = Type.btThreeSame + 1
-- 				elseif SameValueCount==3 then
-- 					Type.bOnePare=true
-- 					Num[1] = Num[1]+1
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-3+1]
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-2+1]
-- 					Type.btOnePare = Type.btOnePare + 1

-- 					Type.bThreeSame=true
-- 					Num[3] = Num[3]+1
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-3+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-2+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-1+1]
-- 					Type.btThreeSame = Type.btThreeSame + 1

-- 					Type.bFourSame=true
-- 					Num[7] = Num[7]+1
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-3+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-2+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-1+1]
-- 					Type.cbFourSame[Num[7]]=0;
-- 					Type.btFourSame = Type.btFourSame + 1
-- 				elseif SameValueCount==4 then
-- 					Type.bOnePare=true;
-- 					Num[1] = Num[1]+1
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-4+1]
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-3+1]
-- 					Type.btOnePare = Type.btOnePare + 1

-- 					Type.bThreeSame=true;
-- 					Num[3] = Num[3]+1
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-4+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-3+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-2+1]
-- 					Type.btThreeSame = Type.btThreeSame + 1

-- 					Type.bFourSame=true
-- 					Num[7] = Num[7]+1
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-4+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-3+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-2+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-1+1]
-- 					Type.btFourSame = Type.btFourSame + 1
					
-- 					Type.bFiveSame = true
-- 					Num[9] = Num[9]+1
-- 					Type.cbFiveSame[Num[9]] = Index[SameValueCount-4+1]
-- 					Type.cbFiveSame[Num[9]] = Index[SameValueCount-3+1]
-- 					Type.cbFiveSame[Num[9]] = Index[SameValueCount-2+1]
-- 					Type.cbFiveSame[Num[9]] = Index[SameValueCount-1+1]
-- 					Type.cbFiveSame[Num[9]] = 0;
-- 					Type.btFiveSame = Type.btFiveSame + 1
-- 				elseif SameValueCount>=5 then
-- 					Type.bOnePare=true
-- 					Num[1] = Num[1]+1
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-5+1]
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-4+1]
-- 					Type.btOnePare = Type.btOnePare + 1

-- 					Type.bThreeSame=true
-- 					Num[3] = Num[3]+1
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-5+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-4+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-3]+1
-- 					Type.btThreeSame = Type.btThreeSame + 1

-- 					Type.bFourSame=true
-- 					Num[7] = Num[7]+1
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-5+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-4+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-3+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-2+1]
-- 					Type.btFourSame = Type.btFourSame + 1
					
-- 					Type.bFiveSame = true;
-- 					Num[9] = Num[9]+1
-- 					Type.cbFiveSame[Num[9]] = Index[SameValueCount-5+1]
-- 					Type.cbFiveSame[Num[9]] =    Index[SameValueCount-4+1]
-- 					Type.cbFiveSame[Num[9]] =    Index[SameValueCount-3+1]
-- 					Type.cbFiveSame[Num[9]] =    Index[SameValueCount-2+1]
-- 					Type.cbFiveSame[Num[9]] = Index[SameValueCount-1+1]
-- 					Type.btFiveSame = Type.btFiveSame + 1
-- 					Type.cbFiveSame[Num[9]] = Index[SameValueCount-5+1]
-- 					Type.cbFiveSame[Num[9]] =    Index[SameValueCount-4+1]
-- 					Type.cbFiveSame[Num[9]] =    Index[SameValueCount-3+1]
-- 					Type.cbFiveSame[Num[9]] =    Index[SameValueCount-2+1]
-- 					Type.cbFiveSame[Num[9]] = 0
-- 					Type.btFiveSame = Type.btFiveSame + 1
-- 				end
-- 				Number=0
-- 				Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 				Number = Number + 1
-- 				Index[Number]=i
-- 				SameValueCount=1
-- 				bLogicValue=self:GetCardLogicValue(CardData[i])
-- 			end
-- 		end
-- 	elseif self:GetCardLogicValue(CardData[1]) == GameLogic.CARD_DW and self:GetCardLogicValue(CardData[2]) == GameLogic.CARD_XW then
-- 		local bLogicValue=self:GetCardLogicValue(CardData[3])
-- 		Number = Number + 1
-- 		Index[Number]=2
-- 		--类似这种处翻译都有异议 懂规则的改	
-- 		if bCardCount == 3 then
-- 			Type.bOnePare=true
-- 			Num[1] = Num[1]+1
-- 			Type.cbOnePare[Num[1]]=0
-- 			Type.cbOnePare[Num[1]]=2
-- 			Type.btOnePare = Type.btOnePare + 1
-- 			Type.bThreeSame=true
-- 			Num[3] = Num[3]+1
-- 			Type.cbThreeSame[Num[3]]=0
-- 			Type.cbThreeSame[Num[3]]=1
-- 			Type.cbThreeSame[Num[3]]=2
-- 			Type.btThreeSame = Type.btThreeSame + 1
-- 		else
-- 			for i=3,bCardCount do		
-- 				i = i + 1
-- 				if bLogicValue == self:GetCardLogicValue(CardData[i]) then
-- 					SameValueCount = SameValueCount + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 				end
-- 				if bLogicValue ~= self:GetCardLogicValue(CardData[i]) or i==bCardCount-1 then
-- 					if SameValueCount==1 then
-- 						Type.bOnePare=true;
-- 						Num[1] = Num[1] + 1
-- 						Type.cbOnePare[Num[1]]=Index[SameValueCount-1+1]
-- 						Type.cbOnePare[Num[1]]=0;
-- 						Type.btOnePare = Type.btOnePare + 1

-- 						Type.bThreeSame=true;
-- 						Num[3] = Num[3] + 1
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-1+1]
-- 						Type.cbThreeSame[Num[3]]=0;
-- 						Type.cbThreeSame[Num[3]]=1;
-- 						Type.btThreeSame = Type.btThreeSame + 1
-- 					elseif SameValueCount==2 then
-- 						Type.bOnePare=true
-- 						Num[1] = Num[1] + 1
-- 						Type.cbOnePare[Num[1]]=Index[SameValueCount-2+1]
-- 						Type.cbOnePare[Num[1]]=Index[SameValueCount-1+1]
-- 						Type.btOnePare = Type.btOnePare + 1

-- 						Type.bThreeSame=true;
-- 						Num[3] = Num[3] + 1
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-2+1]
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-1+1]
-- 						Type.cbThreeSame[Num[3]]=0;
-- 						Type.btThreeSame = Type.btThreeSame + 1
-- 						Type.bFourSame=true;
-- 						Num[7] = Num[7] + 1
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-2+1]
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-1+1]
-- 						Type.cbFourSame[Num[7]]=0;
-- 						Type.cbFourSame[Num[7]]=1;
-- 						Type.btFourSame = Type.btFourSame + 1
-- 					elseif SameValueCount==3 then
-- 						Type.bOnePare=true
-- 						Num[1] = Num[1] + 1
-- 						Type.cbOnePare[Num[1]]=Index[SameValueCount-3+1]
-- 						Type.cbOnePare[Num[1]]=Index[SameValueCount-2+1]
-- 						Type.btOnePare = Type.btOnePare + 1

-- 						Type.bThreeSame=true
-- 						Num[3] = Num[3] + 1
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-3+1]
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-2+1]
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-1+1]
-- 						Type.btThreeSame = Type.btThreeSame + 1
						
-- 						Type.bFourSame=true
-- 						Num[7] = Num[7] + 1
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-3+1]
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-2+1]
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-1+1]
-- 						Type.cbFourSame[Num[7]]=0
-- 						Type.btFourSame = Type.btFourSame + 1
						
-- 						Type.bFiveSame = true
-- 						Num[9] = Num[9] + 1
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-3+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-2+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-1+1]
-- 						Type.cbFiveSame[Num[9]] = 0
-- 						Type.cbFiveSame[Num[9]] = 1
-- 						Type.btFiveSame = Type.btFiveSame + 1
-- 					elseif SameValueCount==4 then
-- 						Type.bOnePare=true;
-- 						Num[1] = Num[1] + 1
-- 						Type.cbOnePare[Num[1]]=Index[SameValueCount-4+1]
-- 						Type.cbOnePare[Num[1]]=Index[SameValueCount-3+1]
-- 						Type.btOnePare = Type.btOnePare + 1

-- 						Type.bThreeSame=true
-- 						Num[3] = Num[3] + 1
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-4+1]
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-3+1]
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-2+1]
-- 						Type.btThreeSame = Type.btThreeSame + 1

-- 						Type.bFourSame=true
-- 						Num[7] = Num[7] + 1
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-4+1]
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-3+1]
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-2+1]
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-1+1]
-- 						Type.btFourSame = Type.btFourSame + 1
						
-- 						Type.bFiveSame = true
-- 						Num[9] = Num[9] + 1
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-4+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-3+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-2+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-1+1]
-- 						Type.cbFiveSame[Num[9]] = 0
-- 						Type.btFiveSame = Type.btFiveSame + 1
-- 					elseif SameValueCount > 4 then
-- 						Type.bOnePare=true
-- 						Num[1] = Num[1] + 1
-- 						Type.cbOnePare[Num[1]]=Index[SameValueCount-5+1]
-- 						Type.cbOnePare[Num[1]]=Index[SameValueCount-4+1]
-- 						Type.btOnePare = Type.btOnePare + 1
						
-- 						Type.bThreeSame=true
-- 						Num[3] = Num[3] + 1
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-5+1]
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-4+1]
-- 						Type.cbThreeSame[Num[3]]=Index[SameValueCount-3+1]
-- 						Type.btThreeSame = Type.btThreeSame + 1
						
-- 						Type.bFourSame=true
-- 						Num[7] = Num[7] + 1
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-5+1]
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-4+1]
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-3+1]
-- 						Type.cbFourSame[Num[7]]=Index[SameValueCount-2+1]
-- 						Type.btFourSame = Type.btFourSame + 1
						
-- 						Type.bFiveSame = true
-- 						Num[9] = Num[9] + 1
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-5+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-4+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-3+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-2+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-1+1]
-- 						Type.btFiveSame = Type.btFiveSame + 1
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-5+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-4+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-3+1]
-- 						Type.cbFiveSame[Num[9]] = Index[SameValueCount-2+1]
-- 						Type.cbFiveSame[Num[9]] = 0
-- 						Type.btFiveSame = Type.btFiveSame + 1
-- 					end
-- 					Number=0;
-- 					Index={0,0,0,0,0,0,0,0,0,0,0,0,0}								
-- 					Number = Number + 1
-- 					Index[Number]=i					
-- 					SameValueCount=1
-- 					bLogicValue=self:GetCardLogicValue(CardData[i])
-- 				end				
-- 			end
-- 		end
-- 	else
-- 		lcoal bLogicValue=self:GetCardLogicValue(CardData[1])
-- 		Number = Number + 1
-- 		Index[Number]=0
-- 		for i=1,bCardCount do
-- 			i = i + 1
-- 			if bLogicValue==self:GetCardLogicValue(CardData[i]) then
-- 				SameValueCount = SameValueCount + 1
-- 				Number = Number + 1
-- 				Index[Number]=i
-- 			end
-- 			if bLogicValue ~= self:GetCardLogicValue(CardData[i]) or i==bCardCount-1 then
-- 				if SameValueCount==1 then
-- 				end
-- 				elseif SameValueCount==2 then
-- 					Type.bOnePare=true
-- 					Num[1] = Num[1] + 1
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-2+1]
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-1+1]
-- 					Type.btOnePare = Type.btOnePare + 1
-- 				elseif SameValueCount==3 then
-- 					Type.bOnePare=true
-- 					Num[1] = Num[1] + 1
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-3+1]
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-2+1]
-- 					Type.btOnePare = Type.btOnePare + 1

-- 					Type.bThreeSame=true
-- 					Num[3] = Num[3] + 1
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-3+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-2+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-1+1]
-- 					Type.btThreeSame = Type.btThreeSame + 1
-- 				elseif SameValueCount==4 then
-- 					Type.bOnePare=true
-- 					Num[1] = Num[1] + 1
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-4+1]
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-3+1]
-- 					Type.btOnePare = Type.btOnePare + 1

-- 					Type.bThreeSame=true
-- 					Num[3] = Num[3] + 1
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-4+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-3+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-2+1]
-- 					Type.btThreeSame = Type.btThreeSame + 1

-- 					Type.bFourSame=true
-- 					Num[7] = Num[7] + 1
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-4+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-3+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-2+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-1+1]
-- 					Type.btFourSame = Type.btFourSame + 1
-- 				elseif SameValueCount >= 5 then
-- 					Type.bOnePare=true
-- 					Num[1] = Num[1] + 1
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-5+1]
-- 					Type.cbOnePare[Num[1]]=Index[SameValueCount-4+1]
-- 					Type.btOnePare = Type.btOnePare + 1

-- 					Type.bThreeSame=true
-- 					Num[3] = Num[3] + 1
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-5+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-4+1]
-- 					Type.cbThreeSame[Num[3]]=Index[SameValueCount-3+1]
-- 					Type.btThreeSame = Type.btThreeSame + 1

-- 					Type.bFourSame=true
-- 					Num[7] = Num[7] + 1
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-5+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-4+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-3+1]
-- 					Type.cbFourSame[Num[7]]=Index[SameValueCount-2+1]
-- 					Type.btFourSame = Type.btFourSame + 1

-- 					Type.bFiveSame=true
-- 					Num[9] = Num[9] + 1
-- 					Type.cbFiveSame[Num[9]]=Index[SameValueCount-5+1]
-- 					Type.cbFiveSame[Num[9]]=Index[SameValueCount-4+1]
-- 					Type.cbFiveSame[Num[9]]=Index[SameValueCount-3+1]
-- 					Type.cbFiveSame[Num[9]]=Index[SameValueCount-2+1]
-- 					Type.cbFiveSame[Num[9]]=Index[SameValueCount-1+1]
-- 					Type.btFiveSame = Type.btFiveSame + 1
-- 				end				
-- 				Number=0;
-- 				Index={0,0,0,0,0,0,0,0,0,0,0,0,0}								
-- 				Number = Number + 1
-- 				Index[Number]=i					
-- 				SameValueCount=1
-- 				bLogicValue=self:GetCardLogicValue(CardData[i])
-- 			end
-- 		end
-- 	end
	
-- 	BYTE OnePareCount=Num[1]/2;
-- 	BYTE ThreeSameCount=Num[3]/3
-- 	if OnePareCount>=2 then
-- 		Type.bTwoPare=false;
-- 		for i=0,OnePareCount do
-- 			i = i+1
-- 			for j=i+1,OnePareCount do
-- 				if CardData[Type.cbOnePare[i*2]] == CardData[Type.cbOnePare[j*2]]
-- 					or CardData[Type.cbOnePare[i*2+1]] == CardData[Type.cbOnePare[j*2]]
-- 					or CardData[Type.cbOnePare[i*2+1]] == CardData[Type.cbOnePare[j*2+1]]
-- 					or CardData[Type.cbOnePare[j*2+1]] == CardData[Type.cbOnePare[i*2]] then
-- 				else
-- 					Num[2] = Num[2]+1
-- 					Type.cbTwoPare[Num[2]]=Type.cbOnePare[i*2]
-- 					Type.cbTwoPare[Num[2]]=Type.cbOnePare[i*2+1]
-- 					Type.cbTwoPare[Num[2]]=Type.cbOnePare[j*2]
-- 					Type.cbTwoPare[Num[2]]=Type.cbOnePare[j*2+1]
-- 					Type.btTwoPare = Type.btTwoPare + 1
-- 					Type.bTwoPare=true
-- 				end
-- 			end
-- 		end
-- 	end
	
-- 	if OnePareCount>0 and ThreeSameCount>0 then
-- 		for i=0,ThreeSameCount do
-- 			i = i + 1
-- 			for j=0,OnePareCount do
-- 				j = j + 1
-- 				--这边是防止三张和2张的里面有同一张牌
-- 				if Type.cbThreeSame[i*3] == Type.cbThreeSame[i*3+1]
-- 				   or Type.cbThreeSame[i*3] == Type.cbThreeSame[i*3+2]
-- 				   or Type.cbThreeSame[i*3] == Type.cbOnePare[j*2]
-- 				   or Type.cbThreeSame[i*3] == Type.cbOnePare[j*2+1]
-- 				   or Type.cbThreeSame[i*3+1] == Type.cbThreeSame[i*3+2]
-- 				   or Type.cbThreeSame[i*3+1] == Type.cbOnePare[j*2]
-- 				   or Type.cbThreeSame[i*3+1] == Type.cbOnePare[j*2+1]
-- 				   or Type.cbThreeSame[i*3+2] == Type.cbOnePare[j*2]
-- 				   or Type.cbThreeSame[i*3+2] == Type.cbOnePare[j*2+1]
-- 				   or Type.cbOnePare[j*2] == Type.cbThreeSame[i*3+2] then
-- 				else
-- 					Type.bGourd=true
-- 					Num[6] = Num[6] + 1
-- 					Type.cbGourd[Num[6]]=Type.cbThreeSame[i*3]
-- 					Type.cbGourd[Num[6]]=Type.cbThreeSame[i*3+1]
-- 					Type.cbGourd[Num[6]]=Type.cbThreeSame[i*3+2]
-- 					Type.cbGourd[Num[6]]=Type.cbOnePare[j*2]
-- 					Type.cbGourd[Num[6]]=Type.cbOnePare[j*2+1]
-- 					Type.btGourd = Type.btGourd + 1
-- 				end
-- 			end
-- 		end
-- 	end
	
-- 	Number=0
-- 	Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 	local Straight=1
-- 	local bStraight=self:GetCardLogicValue(CardData[1])
			
-- 	if self:GetCardLogicValue(CardData[1]) >=GameLogic.CARD_XW and self:GetCardLogicValue(CardData[2]) < GameLogic.CARD_XW then
-- 		local bUsedW = false
-- 		--类似这种处翻译都有异议 懂规则的改	
-- 		for pos = 1,bCardCount - 3 do 
-- 			pos = pos + 1
-- 			bUsedW = false;
-- 			bStraight=self:GetCardLogicValue(CardData[pos]);
-- 			Number=0;
-- 			Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 			Number = Number + 1
-- 			Index[Number]=pos
-- 			Straight=1
			
-- 			for i=pos+1,bCardCount do
-- 				if bStraight==self:GetCardLogicValue(CardData[i])+1 then
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 				elseif (bStraight==self:GetCardLogicValue(CardData[i])+2) and (bUsedW == false))then
-- 					bUsedW = true;
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=0
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bStraight=self:GetCardLogicValue(CardData[i]);
-- 				end
-- 				if bStraight>self:GetCardLogicValue(CardData[i])+1 or i==bCardCount-1 then
-- 					if bUsedW == false then
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=0
-- 						bUsedW = true
-- 					end
-- 					if Straight >= 5 then
-- 						Type.bStraight=true;
-- 						for j=0,Straight do
-- 							j = j + 1
-- 							if Straight-j >= 5 then
-- 								local bFind = false
-- 								if Type.btStraight > 0 then
-- 									for z = 0,Type.btStraight do
-- 										z = z + 1
-- 										if Type.cbStraight[z * 5] == Index[j]
-- 											and Type.cbStraight[z * 5+1] == Index[j+1]
-- 											and Type.cbStraight[z * 5+2] == Index[j+2]
-- 											and Type.cbStraight[z * 5+3] == Index[j+3]
-- 											and Type.cbStraight[z * 5+4] == Index[j+4] then
											
-- 											bFind = true
-- 											break
-- 										end
-- 									end
-- 								end
-- 								if bFind == false then
-- 									Num[4] = Num[4] + 1
-- 									Type.cbStraight[Num[4]]=Index[j]
-- 									Type.cbStraight[Num[4]]=Index[j+1]
-- 									Type.cbStraight[Num[4]]=Index[j+2]
-- 									Type.cbStraight[Num[4]]=Index[j+3]
-- 									Type.cbStraight[Num[4]]=Index[j+4]
-- 									Type.btStraight = Type.btStraight + 1
-- 								end
								
-- 								for k=j,j+5 do
-- 									for m=0,bCardCount do
-- 										m = m + 1
-- 										if self:GetCardLogicValue(CardData[Index[k]])==self:GetCardLogicValue(CardData[m])
-- 										   and CardData[Index[k]] ~= CardData[m] then

-- 											local cbTmpStraight = {0,0,0,0,0}
-- 											local cbTmpPos = 0
-- 											for n=j,j+5 do
-- 												cbTmpPos = cbTmpPos + 1
-- 												if n==k then
-- 													cbTmpStraight[cbTmpPos] = m;
-- 												else
-- 													cbTmpStraight[cbTmpPos] = Index[n]
-- 												end
-- 											end
										
-- 											local bFind = false
-- 											for z = 0,Type.btStraight do
-- 												z = z + 1
-- 												if Type.cbStraight[z * 5] == cbTmpStraight[0+1]
-- 													and Type.cbStraight[z * 5+1] == cbTmpStraight[1+1]
-- 													and Type.cbStraight[z * 5+2] == cbTmpStraight[2+1]
-- 													and Type.cbStraight[z * 5+3] == cbTmpStraight[3+1]
-- 													and Type.cbStraight[z * 5+4] == cbTmpStraight[4+1] then

-- 													bFind = true
-- 													break
-- 												end
-- 											end
-- 											if bFind == false then
-- 												Num[4] = Num[4] + 1
-- 												Type.cbStraight[Num[4]] = cbTmpStraight[0+1]
-- 												Type.cbStraight[Num[4]] = cbTmpStraight[1+1]
-- 												Type.cbStraight[Num[4]] = cbTmpStraight[2+1]
-- 												Type.cbStraight[Num[4]] = cbTmpStraight[3+1]
-- 												Type.cbStraight[Num[4]] = cbTmpStraight[4+1]
-- 												Type.btStraight = Type.btStraight + 1
-- 											end											
-- 										end
-- 									end
-- 								end
-- 							else						
-- 								break
-- 							end
-- 						end						
-- 					end
-- 					if bCardCount-i < 4 then      --original is 5,but we had a king at index[0]
-- 						break
-- 					end
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 					Straight=1
-- 					Number=0
-- 					Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 					Number = Number +1
-- 					Index[Number]=i
-- 					bUsedW = false
-- 				end
-- 			end
-- 		end

-- 		if self:GetCardLogicValue(CardData[bCardCount-1])==2 then
-- 			Number=0
-- 			Straight=2
-- 			bStraight=self:GetCardLogicValue(CardData[1+1])
-- 			Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
			
-- 			if bStraight==14 then
-- 				Number = Number +1
-- 				Index[Number]=1
-- 				bStraight=self:GetCardLogicValue(CardData[bCardCount-1])
-- 				Number = Number +1
-- 				Index[Number]=bCardCount-1
				
-- 				bUsedW = false
-- 				for i=bCardCount-2,2,-1 do
-- 					if bStraight==self:GetCardLogicValue(CardData[i])-1 then
-- 						Straight = Straight + 1
-- 						Number = Number +1
-- 						Index[Number]=i
-- 						bStraight=self:GetCardLogicValue(CardData[i])
-- 					else					
-- 						if (bStraight==self:GetCardLogicValue(CardData[i])-2)
-- 						   and false == bUsedW then
							
-- 							Straight = Straight + 1
-- 							Number = Number +1
-- 							Index[Number]=0
-- 							Straight = Straight + 1
-- 							Number = Number +1
-- 							Index[Number]=i
-- 							bStraight=self:GetCardLogicValue(CardData[i])
-- 							bUsedW = true
-- 						end
-- 					end
-- 				end
				
-- 				if bUsedW == false then				
-- 					Straight = Straight + 1
-- 					Number = Number +1
-- 					Index[Number]=0
-- 					bUsedW = true
-- 				end
-- 			else
-- 				Number = Number +1
-- 				Index[Number]=0
-- 				bStraight=self:GetCardLogicValue(CardData[bCardCount-1])
-- 				Number = Number +1
-- 				Index[Number]=bCardCount-1
-- 				for i=bCardCount-2,1,-1 do
-- 					if bStraight==self:GetCardLogicValue(CardData[i])-1 then
-- 						Straight = Straight + 1
-- 						Number = Number +1
-- 						Index[Number]=i
-- 						bStraight=self:GetCardLogicValue(CardData[i])
-- 					end
-- 				end
-- 			end
			
-- 			if Straight>=5 then
-- 				Type.bStraight=true
-- 				for j=0,5 do
-- 					j = j + 1
-- 					Num[4] = Num[4] + 1
-- 					Type.cbStraight[Num[4]]=Index[j]
-- 				end
-- 				Type.btStraight = Type.btStraight + 1
				
-- 				for k=0,5 do
-- 					k = k + 1
-- 					for m=0,bCardCount do
-- 						m = m + 1
-- 						if self:GetCardLogicValue(CardData[Index[k]])==self:GetCardLogicValue(CardData[m]) and GameLogic.GetCardColor(CardData[Index[k]])~= GameLogic.GetCardColor(CardData[m]) then
-- 							for n=0,5 do
-- 								n = n+1
-- 								if n==k then
-- 									Num[4] = Num[4] + 1
-- 									Type.cbStraight[Num[4]]=m
-- 								else
-- 									Num[4] = Num[4] + 1
-- 									Type.cbStraight[Num[4]]=Index[n]
-- 								end
-- 							end
-- 							Type.btStraight = Type.btStraight + 1
-- 						end
-- 					end
-- 				end				
-- 			end
-- 		end
		
-- 		if (self:GetCardLogicValue(CardData[bCardCount-1])==3)
-- 		    and (self:GetCardLogicValue(CardData[2])==14) then
		
-- 			Number=0
-- 			Straight=3
-- 			Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
			
-- 			Number = Number + 1
-- 			Index[Number]=0
-- 			Number = Number + 1
-- 			Index[Number]=1
-- 			bStraight=self:GetCardLogicValue(CardData[bCardCount-1])
-- 			Number = Number + 1
-- 			Index[Number]=bCardCount-1;
			
-- 			for i=bCardCount-2,2,-1 do
-- 				if bStraight==self:GetCardLogicValue(CardData[i])-1 then
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 				end
-- 			end
			
			
-- 			if Straight>=5 then
-- 				Type.bStraight=true
-- 				for j=0,5 do
-- 					j = j + 1
-- 					Num[4] = Num[4] + 1
-- 					Type.cbStraight[Num[4]]=Index[j]
-- 				end
-- 				Type.btStraight = Type.btStraight + 1
				
-- 				for k=0,5 do
-- 					k = k + 1
-- 					for m=0,bCardCount do
-- 						m = m + 1
-- 						if self:GetCardLogicValue(CardData[Index[k]])==self:GetCardLogicValue(CardData[m]) and GameLogic.GetCardColor(CardData[Index[k]]) ~= GameLogic.GetCardColor(CardData[m]) then
-- 							for n=0,5 do
-- 								n = n + 1
-- 								if n==k then
-- 									Num[4] = Num[4] + 1
-- 									Type.cbStraight[Num[4]]=m
-- 								else
-- 									Num[4] = Num[4] + 1
-- 									Type.cbStraight[Num[4]]=Index[n]
-- 								end
-- 							end
-- 							Type.btStraight = Type.btStraight + 1
-- 						end
-- 					end
-- 				end				
-- 			end
-- 		end
-- 	elseif self:GetCardLogicValue(CardData[1]) == GameLogic.CARD_DW and self:GetCardLogicValue(CardData[2]) == GameLogic.CARD_XW then
-- 		local bUsedDW = false
-- 		local bUsedXW = false
-- 		--类似这种处翻译都有异议 懂规则的改	
-- 		for pos=2,bCardCount - 2 do
-- 			bUsedDW = false
-- 			bUsedXW = false
-- 			Straight=1
-- 			Number=0
-- 			Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 			bStraight=self:GetCardLogicValue(CardData[pos])
-- 			Number = Number + 1
-- 			Index[Number]=pos
			
-- 			for i=pos,bCardCount do
-- 				if bStraight==self:GetCardLogicValue(CardData[i])+1 then
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 				elseif (bStraight==self:GetCardLogicValue(CardData[i])+2) and ((bUsedDW==false) or (bUsedXW==false)) then
-- 					if bUsedDW == false then
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=0
-- 						bUsedDW = true;
-- 					elseif bUsedXW == false then
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=1
-- 						bUsedXW = true
-- 					end
					
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 				elseif (bStraight == self:GetCardLogicValue(CardData[i]+3)) and (bUsedDW==false) and (bUsedXW==false) then
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=0
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=1
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 					bUsedDW = true
-- 					bUsedXW = true
-- 				end
-- 				if bStraight>self:GetCardLogicValue(CardData[i])+1 or i==bCardCount-1 then
-- 					if Straight==4 and ((bUsedDW==false) or (bUsedXW==false)) then
-- 						if bUsedDW == false then
-- 							Straight = Straight + 1
-- 							Number = Number + 1
-- 							Index[Number]=0
-- 							bUsedDW = true
-- 						elseif (bUsedXW == false)
-- 							Straight = Straight + 1
-- 							Number = Number + 1
-- 							Index[Number]=1
-- 							bUsedXW = true
-- 						end
-- 					end
					
-- 					if Straight==3 and ((bUsedDW==false) and (bUsedXW==false)) then
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=0
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=1
-- 						bUsedDW = true
-- 						bUsedXW = true
-- 					end
					
-- 					if Straight>=5 then
-- 						Type.bStraight=true
-- 						for j=0,Straight do
-- 							j = j + 1
-- 							if Straight-j >= 5 then
-- 								if bCardData[Index[j]] == bCardData[Index[j+1]] or bCardData[Index[j]] == bCardData[Index[j+2]]
-- 									or bCardData[Index[j]] == bCardData[Index[j+3]] or bCardData[Index[j]] == bCardData[Index[j+4]]
-- 									or bCardData[Index[j+1]] == bCardData[Index[j+2]] or bCardData[Index[j+1]] == bCardData[Index[j+3]]
-- 									or bCardData[Index[j+1]] == bCardData[Index[j+4]] or bCardData[Index[j+2]] == bCardData[Index[j+3]]
-- 									or bCardData[Index[j+2]] == bCardData[Index[j+4]] or bCardData[Index[j+3]] == bCardData[Index[j+4]] then
																	
-- 								else
-- 									local bFind = false
-- 									for z = 0,Type.btStraight do
-- 										z = z + 1
-- 										if  Type.cbStraight[z * 5 + 0] == Index[j + 0] and
-- 											Type.cbStraight[z * 5 + 1] == Index[j + 1] and
-- 											Type.cbStraight[z * 5 + 2] == Index[j + 2] and
-- 											Type.cbStraight[z * 5 + 3] == Index[j + 3] and
-- 											Type.cbStraight[z * 5 + 4] == Index[j + 4] then

-- 											bFind = true
-- 											break
-- 										end
-- 									end
-- 									if bFind == false then
-- 										Num[4] = Num[4] +1
-- 										Type.cbStraight[Num[4]]=Index[j];
-- 										Num[4] = Num[4] +1
-- 										Type.cbStraight[Num[4]]=Index[j+1];
-- 										Num[4] = Num[4] +1
-- 										Type.cbStraight[Num[4]]=Index[j+2];
-- 										Num[4] = Num[4] +1
-- 										Type.cbStraight[Num[4]]=Index[j+3];
-- 										Num[4] = Num[4] +1
-- 										Type.cbStraight[Num[4]]=Index[j+4];
-- 										Type.btStraight = Type.btStraight + 1
-- 									end

-- 									for k=j,j+5 do
-- 										for m=0,bCardCount do
-- 											m = m + 1
-- 											if self:GetCardLogicValue(CardData[Index[k]])==self:GetCardLogicValue(CardData[m]) and GameLogic.GetCardColor(CardData[Index[k]]) ~= GameLogic.GetCardColor(CardData[m]) then
-- 												local cbTmpStraight = {0,0,0,0,0}
-- 												local cbTmpPos = 0
-- 												for n=j,j+5 do
-- 													if n==k then
-- 														cbTmpPos = cbTmpPos + 1
-- 														cbTmpStraight[cbTmpPos] = m
-- 													else
-- 														cbTmpPos = cbTmpPos + 1
-- 														cbTmpStraight[cbTmpPos] = Index[n]
-- 													end
-- 												end
-- 												local bFind = false
-- 												for z = 0,Type.btStraight do
-- 													z = z + 1
-- 													if Type.cbStraight[z * 5 + 0] == cbTmpStraight[0 + 0 + 1] and
-- 													   Type.cbStraight[z * 5 + 1] == cbTmpStraight[0 + 1 + 1] and
-- 													   Type.cbStraight[z * 5 + 2] == cbTmpStraight[0 + 2 + 1] and
-- 													   Type.cbStraight[z * 5 + 3] == cbTmpStraight[0 + 3 + 1] and
-- 													   Type.cbStraight[z * 5 + 4] == cbTmpStraight[0 + 4 + 1] then
													
-- 														bFind = true
-- 														break
-- 													end
-- 												end
-- 												if bFind == false then
-- 													Num[4] = Num[4] + 1
-- 													Type.cbStraight[Num[4]] = cbTmpStraight[0 + 0 + 1]
-- 													Num[4] = Num[4] + 1
-- 													Type.cbStraight[Num[4]] = cbTmpStraight[0 + 1 + 1]
-- 													Num[4] = Num[4] + 1
-- 													Type.cbStraight[Num[4]] = cbTmpStraight[0 + 2 + 1]
-- 													Num[4] = Num[4] + 1
-- 													Type.cbStraight[Num[4]] = cbTmpStraight[0 + 3 + 1]
-- 													Num[4] = Num[4] + 1
-- 													Type.cbStraight[Num[4]] = cbTmpStraight[0 + 4 + 1]
-- 													Type.btStraight = Type.btStraight + 1
-- 												end
-- 											end
-- 										end
-- 									end
-- 								end
-- 							else
-- 								break
-- 							end
-- 						end					
-- 					end
-- 					if bCardCount-i < 3 then  -- we got two king at index[0] and index[1]
-- 						break
-- 					end
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 					Straight=1
-- 					Number=0
-- 					Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bUsedDW = false
-- 					bUsedXW = false
-- 				end
-- 			end
-- 		end
				 
-- 		if self:GetCardLogicValue(CardData[bCardCount-1])==2 then
-- 			Number=0
-- 			Straight=2
-- 			bStraight=self:GetCardLogicValue(CardData[3])
-- 			Index={0,0,0,0,0,0,0,0,0,0,0,0,0}

-- 			if bStraight==14 then
-- 				Number = Number + 1
-- 				Index[Number]=2       
-- 				bStraight=self:GetCardLogicValue(CardData[bCardCount-1])
-- 				Number = Number + 1
-- 				Index[Number]=bCardCount-1
				
-- 				local bDWused = false
-- 				local bXWused = false
-- 				for i=bCardCount-2,3,-1) do				
-- 					if(bStraight==self:GetCardLogicValue(CardData[i])-1) then
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=i
-- 						bStraight=self:GetCardLogicValue(CardData[i])
-- 					elseif (bStraight==self:GetCardLogicValue(CardData[i])-2)
-- 							and ((false == bDWused) or (false == bXWused)) then

-- 						if bDWused == false then
-- 							bDWused = true
-- 							Straight = Straight + 1
-- 							Number = Number + 1
-- 							Index[Number]=0
-- 							Straight = Straight + 1
-- 							Number = Number + 1
-- 							Index[Number]=i
-- 							bStraight=self:GetCardLogicValue(CardData[i])
-- 						elseif bXWused == false then
-- 							bXWused = true
-- 							Straight = Straight + 1
-- 							Number = Number + 1
-- 							Index[Number]=1
-- 							Straight = Straight + 1
-- 							Number = Number + 1
-- 							Index[Number]=i
-- 							bStraight=self:GetCardLogicValue(CardData[i])
-- 						end
-- 					elseif (bStraight == self:GetCardLogicValue(CardData[i]-3))
-- 							 and (false == bDWused) or (false == bXWused) then
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=0
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=1
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=i
-- 						bStraight=self:GetCardLogicValue(CardData[i])
-- 						bDWused = true;
-- 						bXWused = true;
-- 					end
-- 				end
-- 				if bDWused == false then				
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=0
-- 					bDWused = true
-- 				end
-- 				if bXWused == false then
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=1
-- 					bXWused = true
-- 				end
-- 			else
-- 				Number = Number + 1
-- 				Index[Number]= math.random(10)%2
-- 				bStraight=self:GetCardLogicValue(CardData[bCardCount-1])
-- 				Number = Number + 1
-- 				Index[Number]=bCardCount-1;
-- 				for i=bCardCount-2,3,-1 do
-- 					if bStraight==self:GetCardLogicValue(CardData[i])-1 then
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=i
-- 						bStraight=self:GetCardLogicValue(CardData[i])
-- 					end
-- 				end
-- 			end
-- 			if Straight>=5 then
-- 				Type.bStraight=true
-- 				for j=0,5 do
-- 					j = j + 1
-- 					Num[4] = Num[4] + 1
-- 					Type.cbStraight[Num[4]]=Index[j]
-- 				end
-- 				Type.btStraight = Type.btStraight + 1
								   
-- 				for k=0,5 do
-- 					k = k + 1
-- 					for m=0,bCardCount do
-- 						m = m + 1
-- 						if self:GetCardLogicValue(CardData[Index[k]])==self:GetCardLogicValue(CardData[m]) and GameLogic.GetCardColor(CardData[Index[k]]) ~= GameLogic.GetCardColor(CardData[m]) then
-- 							for n=0,5 do
-- 								n = n + 1
-- 								if n==k then
-- 									Num[4] = Num[4] + 1
-- 									Type.cbStraight[Num[4]]=m
-- 								else
-- 									Num[4] = Num[4] + 1
-- 									Type.cbStraight[Num[4]]=Index[n]
-- 							end
-- 							Type.btStraight = Type.btStraight + 1
-- 						end
-- 					end
-- 				end
				
-- 			end
-- 		end
		
-- 		if self:GetCardLogicValue(CardData[bCardCount-1])==3 then
-- 			Number=0
-- 			Straight=3
-- 			bStraight=self:GetCardLogicValue(CardData[3])
-- 			Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 			local bFind = false
-- 			if bStraight==14 then
-- 				Number = Number + 1
-- 				Index[Number]=1
-- 				Number = Number + 1
-- 				Index[Number] = 2
-- 				bStraight=self:GetCardLogicValue(CardData[bCardCount-1])
-- 				Number = Number + 1
-- 				Index[Number]=bCardCount-1	
				
-- 				local bDWused = false				
-- 				for i=bCardCount-2,3,-1 do
-- 					if bStraight==self:GetCardLogicValue(CardData[i])-1 then
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=i
-- 						bStraight=self:GetCardLogicValue(CardData[i])
-- 					elseif (bStraight==self:GetCardLogicValue(CardData[i])-2)
-- 							and (false == bDWused) then

-- 						if bDWused == false then
-- 							bDWused = true
-- 							Straight = Straight + 1
-- 							Number = Number + 1
-- 							Index[Number]=0
-- 							Straight = Straight + 1
-- 							Number = Number + 1
-- 							Index[Number]=i
-- 							bStraight=self:GetCardLogicValue(CardData[i])
-- 						end
-- 					end
-- 				end
-- 				if bDWused == false then
-- 					bDWused = true
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=0
-- 				end
-- 			else
-- 				Number = Number + 1
-- 				Index[Number]=0
-- 				Number = Number + 1
-- 				Index[Number]=1
-- 				bStraight=self:GetCardLogicValue(CardData[bCardCount-1])
-- 				Number = Number + 1
-- 				Index[Number]=bCardCount-1
-- 				for i=bCardCount-2,3,-1 do
-- 					if(bStraight==self:GetCardLogicValue(CardData[i])-1) then
-- 						Straight = Straight + 1
-- 						Number = Number + 1
-- 						Index[Number]=i
-- 						bStraight=self:GetCardLogicValue(CardData[i])
-- 					end
-- 				end
-- 			end
-- 			if Straight>=5 then
-- 				Type.bStraight=true
-- 				for j=0,5 do
-- 					j = j + 1
-- 					Num[4] = Num[4] = 1
-- 					Type.cbStraight[Num[4]]=Index[j]
-- 				end
-- 				Type.btStraight = Type.btStraight + 1
-- 				for k=0,5 do
-- 					k = k + 1
-- 					for m=0,bCardCount do
-- 						m = m + 1
-- 						if self:GetCardLogicValue(CardData[Index[k]])==self:GetCardLogicValue(CardData[m]) and GameLogic.GetCardColor(CardData[Index[k]]) ~= GameLogic.GetCardColor(CardData[m]) then
-- 							for n=0,5 do
-- 								n = n + 1
-- 								if n==k then
-- 									Num[4] = Num[4] + 1
-- 									Type.cbStraight[Num[4]]=m
-- 								else
-- 									Num[4] = Num[4] + 1
-- 									Type.cbStraight[Num[4]]=Index[n]
-- 							end
-- 							Type.btStraight = Type.btStraight + 1													
-- 						end
-- 					end
-- 				end			
-- 			end
-- 		end
				  
-- 		if (self:GetCardLogicValue(CardData[bCardCount-1])==4)
-- 		   and (self:GetCardLogicValue(CardData[3])==14) then

-- 			Number=0;
-- 			Straight=4
-- 			bStraight=self:GetCardLogicValue(CardData[3])
-- 			Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 			Number = Number + 1
-- 			Index[Number]=0
-- 			Number = Number + 1
-- 			Index[Number]=1
-- 			Number = Number + 1
-- 			Index[Number]=2
-- 			bStraight=self:GetCardLogicValue(CardData[bCardCount-1])
-- 			Number = Number + 1
-- 			Index[Number]=bCardCount-1
			
-- 			for i=bCardCount-2,3,-1 do
-- 				if bStraight==self:GetCardLogicValue(CardData[i])-1 then
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 				end
-- 			end
			
-- 			if Straight>=5 then
-- 				Type.bStraight=true
-- 				for j=0,5 do
-- 					j = j + 1
-- 					Num[4] = Num[4] +1
-- 					Type.cbStraight[Num[4]]=Index[j]
-- 				end
-- 				Type.btStraight = Type.btStraight + 1

-- 				for k=0,5 do
-- 					k = k + 1
-- 					for m=0,bCardCount do
-- 						m = m + 1
-- 						if self:GetCardLogicValue(CardData[Index[k]])==self:GetCardLogicValue(CardData[m]) and GameLogic.GetCardColor(CardData[Index[k]])~= GameLogic.GetCardColor(CardData[m]) then
-- 							for n=0,5 do
-- 								n = n = 1
-- 								if n==k then	
-- 									Num[4] = Num[4] +1
-- 									Type.cbStraight[Num[4]]=m
-- 								else
-- 									Num[4] = Num[4] +1
-- 									Type.cbStraight[Num[4]]=Index[n]
-- 								end
-- 							end
-- 							Type.btStraight = Type.btStraight + 1					
-- 						end
-- 					end
-- 				end				
-- 			end
-- 		end		
-- 	else
-- 		bStraight=self:GetCardLogicValue(CardData[1])
-- 		Number = Number + 1
-- 		Index[Number]=0
-- 		if bStraight ~= 14  then
-- 			--类似这种处翻译都有异议 懂规则的改	
-- 			for i=1,bCardCount do
-- 				if bStraight==self:GetCardLogicValue(CardData[i])+1 then
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 				end
-- 				if bStraight>self:GetCardLogicValue(CardData[i])+1 or i==bCardCount-1 then
-- 					if Straight>=5 then
-- 						Type.bStraight=true
-- 						for j=0,Straight do
-- 							j = j + 1
-- 							if Straight-j >= 5 then
-- 								Num[4] = Num[4] +1
-- 								Type.cbStraight[Num[4]]=Index[j]
-- 								Num[4] = Num[4] +1
-- 								Type.cbStraight[Num[4]]=Index[j+1]
-- 								Num[4] = Num[4] +1
-- 								Type.cbStraight[Num[4]]=Index[j+2]
-- 								Num[4] = Num[4] +1
-- 								Type.cbStraight[Num[4]]=Index[j+3]
-- 								Num[4] = Num[4] +1
-- 								Type.cbStraight[Num[4]]=Index[j+4]
-- 								Type.btStraight = Type.btStraight + 1
-- 								for k=j,j+5 do
-- 									for m=0,bCardCount do
-- 										m = m + 1
-- 										if self:GetCardLogicValue(CardData[Index[k]])==self:GetCardLogicValue(CardData[m]) and GameLogic.GetCardColor(CardData[Index[k]]) ~= GameLogic.GetCardColor(CardData[m]) then
-- 											for n=j,j+5 do			
-- 												if n==k then
-- 													Num[4] = Num[4] +1
-- 													Type.cbStraight[Num[4]]=m;
-- 												else
-- 													Num[4] = Num[4] +1
-- 													Type.cbStraight[Num[4]]=Index[n];
-- 												end
-- 											end
-- 											Type.btStraight = Type.btStraight + 1
-- 										end
-- 									end
-- 								end
-- 							else
-- 								break
-- 							end
-- 						end
						
-- 					end
-- 					if bCardCount-i < 5 then
-- 						break
-- 					end
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 					Straight=1
-- 					Number=0
-- 					Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 				end
-- 			end
			
-- 		end
-- 		if bStraight==14 then
-- 			for i=1,bCardCount do
-- 				if bStraight==self:GetCardLogicValue(CardData[i])+1 then
-- 					Straight = Straight + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 				end
-- 				if bStraight>self:GetCardLogicValue(CardData[i])+1 or i==bCardCount-1 then
-- 					if Straight>=5 then
-- 						Type.bStraight=true
-- 						for(BYTE j=0;j<Straight;j++) do
-- 							j = j + 1
-- 							if Straight-j>=5 then
-- 								Num[4] = Num[4] +1
-- 								Type.cbStraight[Num[4]]=Index[j];
-- 								Num[4] = Num[4] +1
-- 								Type.cbStraight[Num[4]]=Index[j+1];
-- 								Num[4] = Num[4] +1
-- 								Type.cbStraight[Num[4]]=Index[j+2];
-- 								Num[4] = Num[4] +1
-- 								Type.cbStraight[Num[4]]=Index[j+3];
-- 								Num[4] = Num[4] +1
-- 								Type.cbStraight[Num[4]]=Index[j+4];
-- 								Type.btStraight = Type.btStraight + 1
-- 								for k=j,j+5 do
-- 									for m=0,bCardCount do
-- 										m = m + 1
-- 										if self:GetCardLogicValue(CardData[Index[k]])==self:GetCardLogicValue(CardData[m]) and GameLogic.GetCardColor(CardData[Index[k]]) ~= GameLogic.GetCardColor(CardData[m]) then
-- 											for j,j+5 do
-- 												if n==k then
-- 													Num[4] = Num[4] +1
-- 													Type.cbStraight[Num[4]]=m
-- 												else
-- 													Num[4] = Num[4] +1
-- 													Type.cbStraight[Num[4]]=Index[n]
-- 												end
-- 											end
-- 											Type.btStraight = Type.btStraight + 1
-- 										end
-- 									end
-- 								end
-- 							else
-- 								break
-- 							end
-- 						end
-- 					end
-- 					if bCardCount-i<5 then
-- 						break
-- 					end
-- 					bStraight=self:GetCardLogicValue(CardData[i])
-- 					Straight=1
-- 					Number=0
-- 					Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 				end
-- 			end
-- 			if self:GetCardLogicValue(CardData[bCardCount-1])==2 then			
-- 				Number=0
-- 				local BackA=1
-- 				local FrontA=1
-- 				Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 				Number = Number + 1
-- 				Index[Number]=0
-- 				bStraight=self:GetCardLogicValue(CardData[bCardCount-1])
-- 				Number = Number + 1
-- 				Index[Number]=bCardCount-1
-- 				for i=bCardCount-2,0,-1) do
-- 					i = i + 1
-- 					if bStraight==self:GetCardLogicValue(CardData[i])-1 then					
-- 						FrontA = FrontA + 1
-- 						Number = Number + 1
-- 						Index[Number]=i
-- 						bStraight=self:GetCardLogicValue(CardData[i])
-- 					end
-- 				end
-- 				if FrontA+BackA >= 5 then
-- 					Type.bStraight=true
-- 					for i=BackA,0,-1) do
-- 						i = i + 1
-- 						for j=1,FrontA do
-- 							if i+j==5 then
-- 								for k=0,i do
-- 									k = k + 1
-- 									Num[4] = Num[4] +1
-- 									Type.cbStraight[Num[4]]=Index[k]
-- 								end
-- 								for k=0,j do
-- 									k = k + 1
-- 									Num[4] = Num[4] +1
-- 									Type.cbStraight[Num[4]]=Index[k+BackA]
-- 								end
-- 								Type.btStraight = Type.btStraight + 1
-- 								break;
-- 							end
-- 						end
-- 					end
-- 				end
-- 			end			
-- 		end
-- 	end
	
-- 	Number=0;
-- 	Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 	self:SortCardList(CardData,bCardCount,GameLogic.enColor) 
-- 	local cbCardData = clone(bCardData)
-- 	self:SortCardList(cbCardData,bCardCount,GameLogic.enDescend) 

-- 	if (GetCardLogicValue(CardData[1]) >=CARD_XW and GetCardLogicValue(CardData[2]) <CARD_XW) then
-- 		--类似这种处翻译都有异议 懂规则的改	
-- 		for pos = 1,bCardCount - 3 do
-- 			local SameColorCount=1
-- 			local bCardColor = GameLogic.GetCardColor(CardData[pos]) 
-- 			Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 			Number = 0
-- 			Number = Number + 1
-- 			Index[Number]=pos
			
-- 			for i=pos+1,bCardCount do
-- 				if bCardColor==GameLogic.GetCardColor(CardData[i]) then
-- 					SameColorCount = SameColorCount + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 				end
-- 				if bCardColor ~= GameLogic.GetCardColor(CardData[i]) or i==bCardCount-1 then
-- 						SameColorCount = SameColorCount + 1
-- 						Number = Number + 1
-- 						Index[Number]=0
-- 					if SameColorCount>=5 then
-- 						Type.bFlush=true
-- 						for j=0,SameColorCount do
-- 							j = j + 1
-- 							for k=0,bCardCount do
-- 								k = k + 1
-- 								if self:GetCardLogicValue(CardData[Index[j]])==self:GetCardLogicValue(cbCardData[k])
-- 								   and GameLogic.GetCardColor(CardData[Index[j]])==GameLogic.GetCardColor(cbCardData[k]) then
								
-- 									 --加一色  这里先判断是不是有相同的被保存过了
-- 									local bSave = false
-- 									for l = 0,j do
-- 										l = l + 1
-- 										if Index[l] == k then
-- 											bSave = true
-- 											break
-- 										end
-- 									end
-- 									if not bSave then									
-- 									    Index[j]=k
-- 										break
-- 									end
-- 								end
-- 							end
-- 						end

-- 						local SaveIndex=0
-- 						for j=0,SameColorCount do
-- 							j = j + 1
-- 							for k=j+1,SameColorCount do
-- 								if Index[j]>Index[k] then
-- 									SaveIndex=Index[j]
-- 									Index[j]=Index[k]
-- 									Index[k]=SaveIndex
-- 								end
-- 							end
-- 						end
						
-- 						--排列组合出同花
-- 						Type.bFlush=true
-- 						m_combineResult = {}
-- 						local result = {0,0,0,0,0}
-- 						self:combine_increase(Index, 0, result, 5, 5, SameColorCount)
-- 						for j=0,#GameLogic.m_combineResult,5 do
-- 							j = j + 1
							
-- 							if Type.btFlush >= 200 then
-- 								break
-- 							end
-- 							local bFind = false
-- 							for z = 0,Type.btFlush do
-- 								z = z + 1
-- 								if (CardData[Type.cbFlush[z * 5 + 0]] == CardData[GameLogic.m_combineResult[j+0]] and
-- 									CardData[Type.cbFlush[z * 5 + 1]] == CardData[GameLogic.m_combineResult[j+1]] and
-- 									CardData[Type.cbFlush[z * 5 + 2]] == CardData[GameLogic.m_combineResult[j+2]] and
-- 									CardData[Type.cbFlush[z * 5 + 3]] == CardData[GameLogic.m_combineResult[j+3]] and
-- 									CardData[Type.cbFlush[z * 5 + 4]] == CardData[GameLogic.m_combineResult[j+4]]) then

-- 									bFind = true
-- 									break
-- 								end
-- 							end
-- 							if bFind == false then
-- 								Num[5] = Num[5] + 1
-- 								Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j]
-- 								Num[5] = Num[5] + 1
-- 								Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+1]
-- 								Num[5] = Num[5] + 1
-- 								Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+2]
-- 								Num[5] = Num[5] + 1
-- 								Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+3]
-- 								Num[5] = Num[5] + 1
-- 								Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+4]
-- 								Type.btFlush = Type.btFlush + 1
-- 							end
-- 						end
						
-- 						--从同花中筛选出同花顺
-- 						for j=0,#GameLogic.m_combineResult,5 do
-- 							j = j + 1 
-- 							if  self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+0]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+1]]) and
-- 								self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+1]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+2]]) and
-- 								self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+2]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+3]]) and
-- 								self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+3]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+4]]) then

-- 								if Type.btStraightFlush >= 40 then
-- 									break
-- 								end
								
-- 								local notKingIndex = 0
-- 								if self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+0]]) >= GameLogic.CARD_XW and
-- 									self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+1]]) < GameLogic.CARD_XW then

-- 									notKingIndex = 1
-- 								end
-- 								if ((self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[notKingIndex + j+0]])==14) and
-- 									 (self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[notKingIndex + j+1]])<=5))
-- 									or (4>=(self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[notKingIndex + j+0]])-self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+4]]))) then
								
-- 									local bFind = false
-- 									for z = 0,Type.btStraightFlush do
-- 										z = z + 1
-- 										if (Type.cbStraightFlush[z * 5 + 0] == GameLogic.m_combineResult[j+0] and
-- 											Type.cbStraightFlush[z * 5 + 1] == GameLogic.m_combineResult[j+1] and
-- 											Type.cbStraightFlush[z * 5 + 2] == GameLogic.m_combineResult[j+2] and
-- 											Type.cbStraightFlush[z * 5 + 3] == GameLogic.m_combineResult[j+3] and
-- 											Type.cbStraightFlush[z * 5 + 4] == GameLogic.m_combineResult[j+4]) then
										
-- 											bFind = true
-- 											break
-- 										end
-- 									end
									
-- 									if bFind == false then
-- 										Type.bStraightFlush=true
-- 										Num[8] = Num[8] + 1
-- 										Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+0]
-- 										Num[8] = Num[8] + 1
-- 										Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+1]
-- 										Num[8] = Num[8] + 1
-- 										Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+2]
-- 										Num[8] = Num[8] + 1
-- 										Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+3]
-- 										Num[8] = Num[8] + 1
-- 										Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+4]
-- 										Type.btStraightFlush = Type.btStraightFlush + 1
-- 									end
-- 								end
-- 							end
-- 						end
-- 					end
					
-- 					if bCardCount-i < 4 then
-- 						break
-- 					end
					
-- 					Number=0
-- 					Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 					SameColorCount=1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bCardColor=GameLogic.GetCardColor(CardData[i])
-- 				end
-- 			end
-- 		end
-- 	elseif self:GetCardLogicValue(CardData[1]) == GameLogic.CARD_DW and self:GetCardLogicValue(CardData[2]) == GameLogic.CARD_XW then
-- 		--类似这种处翻译都有异议 懂规则的改	
-- 		for pos = 2,bCardCount - 2 do
-- 			local SameColorCount=1
-- 			local bCardColor = GameLogic.GetCardColor(CardData[pos]) 
-- 			Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 			Number = 0
-- 			Number = Number + 1
-- 			Index[Number]=pos
			
-- 			for i=pos+1,bCardCount do
-- 				if bCardColor==GameLogic.GetCardColor(CardData[i]) then
-- 					SameColorCount = SameColorCount + 1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 				end
-- 				if bCardColor ~= GameLogic.GetCardColor(CardData[i]) or i==bCardCount-1 then				
-- 					SameColorCount = SameColorCount + 1
-- 					Number = Number + 1
-- 					Index[Number]=0
-- 					SameColorCount = SameColorCount + 1
-- 					Number = Number + 1
-- 					Index[Number]=1
-- 					if SameColorCount >= 5 then
-- 						for j=0,SameColorCount do
-- 							j = j + 1
-- 							for k=0,bCardCount do
-- 								k = k + 1
-- 								if self:GetCardLogicValue(CardData[Index[j]])==self:GetCardLogicValue(cbCardData[k])
-- 								    and GameLogic.GetCardColor(CardData[Index[j]])==GameLogic.GetCardColor(cbCardData[k]) then

-- 									--加一色  这里先判断是不是有相同的被保存过了
-- 									local bSave = false;
-- 									for l = 0,j do
-- 										l = l + 1
-- 										if Index[l] == k then
-- 											bSave = true
-- 											break
-- 										end
-- 									end
-- 									if not bSave then									
-- 									   Index[j]=k
-- 										break
-- 									end
-- 								end
-- 							end
-- 						end					
-- 						local SaveIndex=0
-- 						for j=0,SameColorCount do
-- 							j = j + 1
-- 							for k=j+1,SameColorCount do
-- 								if Index[j]>Index[k] then
-- 									SaveIndex=Index[j]
-- 									Index[j]=Index[k]
-- 									Index[k]=SaveIndex
-- 								end
-- 							end
-- 						end
						
-- 						--排列组合出同花
-- 						Type.bFlush=true
-- 						GameLogic.m_combineResult = {}
-- 						local result = {0,0,0,0,0}
-- 						self:combine_increase(Index, 0, result, 5, 5, SameColorCount)
-- 						for j=0,#GameLogic.m_combineResult,5 do
-- 							j = j + 1
-- 							if Type.btFlush >= 200 then
-- 								break
-- 							end
							
-- 							local bFind = false
-- 							for z = 0,Type.btFlush do
-- 								z = z + 1
-- 								if  CardData[Type.cbFlush[z * 5 + 0]] == CardData[GameLogic.m_combineResult[j+0]] and
-- 									CardData[Type.cbFlush[z * 5 + 1]] == CardData[GameLogic.m_combineResult[j+1]] and
-- 									CardData[Type.cbFlush[z * 5 + 2]] == CardData[GameLogic.m_combineResult[j+2]] and
-- 									CardData[Type.cbFlush[z * 5 + 3]] == CardData[GameLogic.m_combineResult[j+3]] and
-- 									CardData[Type.cbFlush[z * 5 + 4]] == CardData[GameLogic.m_combineResult[j+4]] then
								
-- 									bFind = true
-- 									break
-- 								end
-- 							end
-- 							if bFind == false then
-- 								Num[5] = Num[5] + 1
-- 								Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j]
-- 								Num[5] = Num[5] + 1
-- 								Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+1]
-- 								Num[5] = Num[5] + 1
-- 								Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+2]
-- 								Num[5] = Num[5] + 1
-- 								Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+3]
-- 								Num[5] = Num[5] + 1
-- 								Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+4]
-- 								Type.btFlush = Type.btFlush + 1
-- 							end
-- 						end
						
-- 						--从同花中筛选出同花顺
-- 						for j=0,GameLogic.m_combineResult,5 do
-- 							j = j + 1
-- 							if  self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+0]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+1]]) and
-- 								self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+1]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+2]]) and
-- 								self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+2]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+3]]) and
-- 								self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+3]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+4]]) then
							
-- 								if Type.btStraightFlush >= 40 then
-- 									break
-- 								end
							
-- 								local notKingIndex = 0
-- 								if self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+1]]) == GameLogic.CARD_XW then
-- 									notKingIndex = 2																		
-- 								elseif self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+0]]) >= GameLogic.CARD_XW and
-- 										 self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+1]]) < GameLogic.CARD_XW then
								
-- 									notKingIndex = 1
-- 								end
-- 								if ((self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[notKingIndex + j+0]])==14) and
-- 									 (self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[notKingIndex + j+1]])<=5))
-- 									or (4>=(self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[notKingIndex + j+0]])-self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+4]]))) then
								
-- 									local bFind = false
-- 									for z = 0, Type.btStraightFlush do
-- 										z = z + 1	
-- 										if  Type.cbStraightFlush[z * 5 + 0] == GameLogic.m_combineResult[j+0] and
-- 											Type.cbStraightFlush[z * 5 + 1] == GameLogic.m_combineResult[j+1] and
-- 											Type.cbStraightFlush[z * 5 + 2] == GameLogic.m_combineResult[j+2] and
-- 											Type.cbStraightFlush[z * 5 + 3] == GameLogic.m_combineResult[j+3] and
-- 											Type.cbStraightFlush[z * 5 + 4] == GameLogic.m_combineResult[j+4] then									
-- 											bFind = true
-- 											break
-- 										end
-- 									end
-- 									if bFind == false then									
-- 										Type.bStraightFlush=true
-- 										Num[8] = Num[8] + 1
-- 										Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+0]
-- 										Num[8] = Num[8] + 1
-- 										Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+1]
-- 										Num[8] = Num[8] + 1
-- 										Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+2]
-- 										Num[8] = Num[8] + 1
-- 										Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+3]
-- 										Num[8] = Num[8] + 1
-- 										Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+4]
-- 										Type.btStraightFlush = Type.btStraightFlush + 1
-- 									end
-- 								end
-- 							end
-- 						end
-- 					end
-- 					if bCardCount-i < 3 then
-- 						break
-- 					end
-- 					Number=0
-- 					Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 					SameColorCount=1
-- 					Number = Number + 1
-- 					Index[Number]=i
-- 					bCardColor=GameLogic.GetCardColor(CardData[i])
-- 				end
-- 			end
-- 		end
-- 	else
-- 		local SameColorCount=1
-- 		local bCardColor = GameLogic.GetCardColor(CardData[1]) 
-- 		Number = Number + 1
-- 		Index[Number]=0
-- 		--类似这种处翻译都有异议 懂规则的改	
-- 		for i=1,bCardCount do
-- 			if bCardColor==GameLogic.GetCardColor(CardData[i]) then
-- 				SameColorCount = SameColorCount + 1
-- 				Number = Number + 1
-- 				Index[Number]=i
-- 			end
-- 			if bCardColor ~= GameLogic.GetCardColor(CardData[i]) or i==bCardCount-1 then
-- 				if SameColorCount >= 5 then			
-- 					for j=0,SameColorCount do 
-- 						j = j + 1
-- 						for k=0,bCardCount do
-- 							k = k + 1
-- 							if self:GetCardLogicValue(CardData[Index[j]]) == self:GetCardLogicValue(cbCardData[k])
-- 							   and GameLogic.GetCardColor(CardData[Index[j]])==GameLogic.GetCardColor(cbCardData[k]) then
							
-- 								--加一色  这里先判断是不是有相同的被保存过了
-- 								local bSave = false
-- 								for l = 0,j do
-- 									l = l + 1
-- 									if Index[l] == k then									
-- 										bSave = true
-- 										break
-- 									end
-- 								end
								
-- 								if not bSave then								
-- 									Index[j]=k
-- 									break
-- 								end
-- 							end
-- 						end
-- 					end
-- 					local SaveIndex=0
-- 					for j=0,SameColorCount do
-- 						j = j + 1
-- 						for k=j+1,SameColorCount do
-- 							if Index[j]>Index[k] then
-- 								SaveIndex=Index[j]
-- 								Index[j]=Index[k]
-- 								Index[k]=SaveIndex
-- 							end
-- 						end
-- 					end
					
-- 					--排列组合出同花
-- 					Type.bFlush=true
-- 					GameLogic.m_combineResult = {}
-- 					local result = {0,0,0,0,0}
-- 					self:combine_increase(Index, 0, result, 5, 5, SameColorCount)
-- 					for j=0,#GameLogic.m_combineResult,5 do
-- 						j = j + 1
-- 						if Type.btFlush >= 200 then
-- 							break
-- 						end
-- 						local bFind = false
-- 						for z = 0,Type.btFlush do
-- 							z = z + 1
-- 							if  CardData[Type.cbFlush[z * 5 + 0]] == CardData[GameLogic.m_combineResult[j+0]] and
-- 								CardData[Type.cbFlush[z * 5 + 1]] == CardData[GameLogic.m_combineResult[j+1]] and
-- 								CardData[Type.cbFlush[z * 5 + 2]] == CardData[GameLogic.m_combineResult[j+2]] and
-- 								CardData[Type.cbFlush[z * 5 + 3]] == CardData[GameLogic.m_combineResult[j+3]] and
-- 								CardData[Type.cbFlush[z * 5 + 4]] == CardData[GameLogic.m_combineResult[j+4]] then
							
-- 								bFind = true
-- 								break;
-- 							end
-- 						end
-- 						if bFind == false then
-- 							Num[5] = Num[5] + 1
-- 							Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j]
-- 							Num[5] = Num[5] + 1
-- 							Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+1]
-- 							Num[5] = Num[5] + 1
-- 							Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+2]
-- 							Num[5] = Num[5] + 1
-- 							Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+3]
-- 							Num[5] = Num[5] + 1
-- 							Type.cbFlush[Num[5]]=GameLogic.m_combineResult[j+4]
-- 							Type.btFlush = Type.btFlush + 1
-- 						end
-- 					end
-- 					--从同花中筛选出同花顺
-- 					for j=0,#GameLogic.m_combineResult,5 do
-- 						j = j + 1
-- 						if  self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+0]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+1]]) and
-- 							self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+1]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+2]]) and
-- 							self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+2]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+3]]) and
-- 							self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+3]]) ~= self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+4]]) then
						
-- 							if Type.btStraightFlush >= 40 then
-- 								break
-- 							end
							
-- 							if ((self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+0]])==14) and
-- 								 (self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+1]])<=5))
-- 								or (4>=(self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+0]])-self:GetCardLogicValue(cbCardData[GameLogic.m_combineResult[j+4]]))) then
							
-- 								local bFind = false
-- 								for z = 0,Type.btStraightFlush do
-- 									z = z + 1
-- 									if  Type.cbStraightFlush[z * 5 + 0] == GameLogic.m_combineResult[j+0] and
-- 										Type.cbStraightFlush[z * 5 + 1] == GameLogic.m_combineResult[j+1] and
-- 										Type.cbStraightFlush[z * 5 + 2] == GameLogic.m_combineResult[j+2] and
-- 										Type.cbStraightFlush[z * 5 + 3] == GameLogic.m_combineResult[j+3] and
-- 										Type.cbStraightFlush[z * 5 + 4] == GameLogic.m_combineResult[j+4] then
									
-- 										bFind = true
-- 										break;
-- 									end
-- 								end
-- 								if bFind == false then							
-- 									Type.bStraightFlush=true
-- 									Num[8] = Num[8] + 1
-- 									Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+0]
-- 									Num[8] = Num[8] + 1
-- 									Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+1]
-- 									Num[8] = Num[8] + 1
-- 									Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+2]
-- 									Num[8] = Num[8] + 1
-- 									Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+3]
-- 									Num[8] = Num[8] + 1
-- 									Type.cbStraightFlush[Num[8]]=GameLogic.m_combineResult[j+4]
-- 									Type.btStraightFlush = Type.btStraightFlush + 1
-- 								end
-- 							end
-- 						end
-- 					end
-- 				end
-- 				if bCardCount-i < 5 then
-- 					break
-- 				end
-- 				Number=0
-- 				Index={0,0,0,0,0,0,0,0,0,0,0,0,0}
-- 				SameColorCount=1
-- 				Number = Number + 1
-- 				Index[Number]=i
-- 				bCardColor=GameLogic.GetCardColor(CardData[i])
-- 			end
-- 		end	
-- 	end
-- 	return Type
-- end

-- function GameLogic:combine_increase(arr,start,result,count, NUM, arr_len)
-- 	for i = start,arr_len + 1 - count do
-- 		if start == 0 then
-- 			i = i + 1
-- 		end
-- 		result[count - 1] = i
-- 		if count - 1 == 0 then
-- 			for j = NUM - 1,0,-1 do 
-- 				j = j + 1
-- 				table.insert(GameLogic.m_combineResult,arr[result[j]])
-- 		else
-- 			self:combine_increase(arr, i + 1, result, count - 1, NUM, arr_len)
-- 		end
-- 	end
-- end	

-- --分析扑克
-- function GameLogic:AnalyseCard( bCardDataList, bCardCount )
-- 	if bCardCount ~= 3 and bCardCount ~= 5 and bCardCount ~= 13 then
-- 		return
-- 	end
	
-- 	local bCardData = clone(bCardDataList)
-- 	GameLogic:SortCardList(bCardData, bCardCount, GameLogic.enDescend)
-- 	local bSameCount 	   = 1
-- 	local bCardValueTemp   = 0
-- 	local bSameColorCount  = 1
-- 	local bFirstCardIndex  = 1
	
-- 	local AnalyseData = GameLogic.getAnalyseData()
-- 	if ((self:GetCardLogicValue(bCardData[1]) >= GameLogic.CARD_XW)) and self:GetCardLogicValue(bCardData[2]) < GameLogic.CARD_XW then

-- 		local bLogicValue = self:GetCardLogicValue(bCardData[2])
-- 		local bCardColor = GameLogic.GetCardColor(bCardData[2]) 
-- 		bFirstCardIndex=1
-- 		--类似这种处翻译都有异议 懂规则的改	
-- 		for i=2,bCardCount do			
-- 			bCardValueTemp = self:GetCardLogicValue(bCardData[i])			
-- 			if bCardValueTemp==bLogicValue then
-- 				bSameCount = bSameCount + 1
-- 			end
					
-- 			if (bCardValueTemp ~= bLogicValue) or (i==(bCardCount-1)) then
-- 				if bSameCount == 1 then
-- 					break
-- 				elseif bSameCount == 2 then
-- 					AnalyseData.bTwoFirst[AnalyseData.bTwoCount] = bFirstCardIndex
-- 					AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 					break
-- 				elseif bSameCount == 3 then
-- 					AnalyseData.bThreeFirst[AnalyseData.bThreeCount] = bFirstCardIndex 
-- 					AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 					break
-- 				elseif bSameCount == 4 then
-- 					AnalyseData.bFourFirst[AnalyseData.bFourCount] = bFirstCardIndex 
-- 					AnalyseData.bFourCount = AnalyseData.bFourCount + 1 
-- 					break
-- 				elseif bSameCount == 5 then
-- 					AnalyseData.bFiveFirst[AnalyseData.bFiveCount] = bFirstCardIndex 
-- 					AnalyseData.bFiveCount = AnalyseData.bFiveCount + 1
-- 					break
-- 				elseif bSameCount == 6 then
-- 					AnalyseData.bSixFirst[AnalyseData.bSixCount] = bFirstCardIndex 
-- 					AnalyseData.bSixCount = AnalyseData.bSixCount + 1
-- 					break
-- 				elseif bSameCount == 7 then
-- 					AnalyseData.bSevenFirst[AnalyseData.bSevenCount] = bFirstCardIndex
-- 					AnalyseData.bSevenCount = AnalyseData.bSevenCount + 1
-- 					break
-- 				elseif bSameCount == 8 then
-- 					AnalyseData.bEightFirst[AnalyseData.bEightCount]   = bFirstCardIndex 
-- 					AnalyseData.bEightCount = AnalyseData.bEightCount + 1
-- 					break
-- 				end
-- 			end
			
-- 			if bCardValueTemp ~= bLogicValue then			
-- 				if bSameCount==1 then
-- 					if i ~= bCardCount-1 then
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = bFirstCardIndex 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 					else
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = bFirstCardIndex 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = i 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 					end
-- 				else
-- 					if i==bCardCount-1 then
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = i 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 					end
-- 				end
-- 				bSameCount=1
-- 				bLogicValue=bCardValueTemp
-- 				bFirstCardIndex = i 
-- 			end
			
-- 			if GameLogic.GetCardColor(bCardData[i]) ~= bCardColor  then
-- 				bSameColorCount = 1 
-- 			else                                       
-- 				bSameColorCount = bSameColorCount + 1
-- 			end
-- 		end
			
-- 		AnalyseData.bStraight = ((bCardCount-1)==bSameColorCount) and true or false 		
		
-- 		if bCardCount == 3 then  			
-- 			if AnalyseData.bTwoCount ==1 then
-- 				AnalyseData.bTwoCount=0
-- 				AnalyseData.bThreeCount =1
-- 				AnalyseData.bThreeFirst[1]=AnalyseData.bTwoFirst[1]
-- 			end
			
-- 			if AnalyseData.bOneCount == 2 then
-- 				AnalyseData.bOneCount=1
-- 				AnalyseData.bTwoCount=1
-- 				AnalyseData.bTwoFirst[1]=AnalyseData.bOneFirst[1]
-- 				AnalyseData.bOneFirst[1]=AnalyseData.bOneFirst[2]
-- 			end
			
-- 			return AnalyseData 
			
-- 		elseif bCardCount == 5 then  	 
-- 			if AnalyseData.bFourCount==1 then
-- 				AnalyseData.bFourCount = 0
-- 				AnalyseData.bFiveCount = 1
-- 				AnalyseData.bFiveFirst[1] = AnalyseData.bFourFirst[1]
-- 			end
			
-- 			if AnalyseData.bThreeCount == 1 and AnalyseData.bOneCount == 1 then
-- 				AnalyseData.bThreeCount=0
-- 				AnalyseData.bFourCount=1
-- 				AnalyseData.bFourFirst[1]=AnalyseData.bThreeFirst[1]
-- 			elseif AnalyseData.bTwoCount == 2 then
-- 				AnalyseData.bTwoCount=1
-- 				AnalyseData.bThreeCount=1
-- 				AnalyseData.bThreeFirst[1]=AnalyseData.bTwoFirst[1]
-- 				AnalyseData.bTwoFirst[1]=AnalyseData.bTwoFirst[2]
-- 			elseif AnalyseData.bTwoCount==1 and AnalyseData.bOneCount ==2 then
-- 				AnalyseData.bTwoCount=0
-- 				AnalyseData.bThreeCount=1
-- 				AnalyseData.bThreeFirst[1]=AnalyseData.bTwoFirst[1]				
-- 			elseif AnalyseData.bOneCount==4 then
-- 				AnalyseData.bOneCount=3
-- 				AnalyseData.bTwoFirst[1]=AnalyseData.bOneFirst[1]
-- 				AnalyseData.bOneFirst[1]=AnalyseData.bOneFirst[2]
-- 				AnalyseData.bOneFirst[2]=AnalyseData.bOneFirst[3]
-- 				AnalyseData.bOneFirst[3]=AnalyseData.bOneFirst[4]
-- 				AnalyseData.bTwoCount=1
-- 			end
			
-- 			return AnalyseData
			
-- 		elseif bCardCount == 13 then  	 
-- 			if AnalyseData.bOneCount==12 then  --改成大菠萝
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 				AnalyseData.bOneFirst[AnalyseData.bOneCount]=0			
-- 			elseif AnalyseData.bFourCount==2 and AnalyseData.bThreeCount==1 then --改成3炸弹
-- 				AnalyseData.bFourCount = AnalyseData.bFourCount + 1
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount - 1
-- 				AnalyseData.bFourFirst[AnalyseData.bFourCount]=AnalyseData.bThreeFirst[AnalyseData.bThreeCount]	
-- 			elseif AnalyseData.bThreeCount==3 and AnalyseData.bTwoCount==1 && AnalyseData.bOneCount==1 then --改成4三条
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount - 1
-- 				AnalyseData.bThreeFirst[AnalyseData.bThreeCount]=AnalyseData.bTwoFirst[AnalyseData.bTwoCount]
-- 			elseif AnalyseData.bTwoCount == 6 then --改成五对三条
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount - 1
-- 				AnalyseData.bThreeFirst[AnalyseData.bThreeCount] = AnalyseData.bTwoFirst[AnalyseData.bTwoCount]
-- 			elseif AnalyseData.bTwoCount == 4 and AnalyseData.bThreeCount == 1 then ---- 改成五对三条
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 			elseif AnalyseData.bTwoCount == 3 and AnalyseData.bThreeCount ==2 then ----改成五对三条
-- 				AnalyseData.bFourCount = AnalyseData.bFourCount + 1
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount - 1
-- 				AnalyseData.bFourFirst[AnalyseData.bFourCount]=AnalyseData.bThreeFirst[AnalyseData.bThreeCount];
-- 			elseif AnalyseData.bTwoCount == 2 and AnalyseData.bFourCount ==1 and AnalyseData.bThreeCount ==1 then --改成6对半
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 			elseif AnalyseData.bTwoCount == 2 and AnalyseData.bFourCount== 2 then --改成6对半
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount - 1
-- 				AnalyseData.bThreeFirst[AnalyseData.bThreeCount]=AnalyseData.bTwoFirst[AnalyseData.bTwoCount]
-- 			elseif AnalyseData.bFourCount == 2 and AnalyseData.bThreeCount == 1 then --改成6对半
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 			elseif AnalyseData.bTwoCount == 5 and AnalyseData.bOneCount == 2 then --改成6对半
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 			elseif AnalyseData.bTwoCount ==1 and AnalyseData.bFourCount == 2 then --改成6对半
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=AnalyseData.bOneFirst[AnalyseData.bOneCount];
-- 			elseif AnalyseData.bEightCount == 1 then
-- 				AnalyseData.bNineCount = AnalyseData.bNineCount + 1
-- 				AnalyseData.bEightCount = AnalyseData.bEightCount - 1
-- 				AnalyseData.bNineFirst[AnalyseData.bNineCount]=AnalyseData.bEightFirst[AnalyseData.bEightCount]
-- 			elseif AnalyseData.bSevenCount == 1 then
-- 				AnalyseData.bEightCount = AnalyseData.bEightCount + 1
-- 				AnalyseData.bSevenCount = AnalyseData.bSevenCount - 1
-- 				AnalyseData.bEightFirst[AnalyseData.bEightCount]=AnalyseData.bSevenFirst[AnalyseData.bSevenCount]
-- 			elseif (AnalyseData.bSixCount >= 1) then
-- 				AnalyseData.bSevenCount = AnalyseData.bSevenCount + 1
-- 				AnalyseData.bSevenFirst[AnalyseData.bSevenCount]=AnalyseData.bSixFirst[1]
-- 				if AnalyseData.bSixCount > 1 then				
-- 					for l = 0,AnalyseData.bSixCount - 1 do
-- 						l = l + 1
-- 						AnalyseData.bSixFirst[l] = AnalyseData.bSixFirst[l + 1]
-- 					end
-- 				end
-- 			elseif AnalyseData.bFiveCount >= 1 then
-- 				AnalyseData.bSixCount = AnalyseData.bSixCount + 1
-- 				AnalyseData.bSixFirst[AnalyseData.bSixCount]=AnalyseData.bFiveFirst[1]
-- 				if  AnalyseData.bFiveCount > 1 then
-- 					for l = 0,AnalyseData.bFiveCount - 1 do
-- 						l = l + 1
-- 						AnalyseData.bFiveFirst[l] = AnalyseData.bFiveFirst[l + 1]
-- 					end
-- 				end
-- 			end
-- 		end
				
-- 	elseif self:GetCardLogicValue(bCardData[1]) == GameLogic.CARD_XW then
	
-- 		local bLogicValue=self:GetCardLogicValue(bCardData[2])
-- 		local bCardColor = GameLogic.GetCardColor(bCardData[2]) 
-- 		bFirstCardIndex=2
-- 		--类似这种处翻译都有异议 懂规则的改	
-- 		for i=3,bCardCount do				
-- 			bCardValueTemp = self:GetCardLogicValue(bCardData[i])
			
-- 			if bCardValueTemp==bLogicValue then
-- 				bSameCount = bSameCount + 1
-- 			end
			
-- 			if (bCardValueTemp ~= bLogicValue) or (i==(bCardCount-1)) then			
-- 				if bSameCount == 1 then      
-- 					break
-- 				elseif bSameCount == 2 then
-- 					AnalyseData.bTwoFirst[AnalyseData.bTwoCount] = bFirstCardIndex 
-- 					AnalyseData.bTwoCount = AnalyseData.bTwoCoun + 1
-- 					break
-- 				elseif bSameCount == 3 then  
-- 					AnalyseData.bThreeFirst[AnalyseData.bThreeCount] = bFirstCardIndex 
-- 					AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1 
-- 					break
-- 				elseif bSameCount == 4 then       
-- 					AnalyseData.bFourFirst[AnalyseData.bFourCount] = bFirstCardIndex 
-- 					AnalyseData.bFourCount = AnalyseData.bFourCount + 1 
-- 					break			
-- 				elseif bSameCount == 5 then 
-- 					AnalyseData.bFiveFirst[AnalyseData.bFiveCount] = bFirstCardIndex 
-- 					AnalyseData.bFiveCount = AnalyseData.bFiveCount + 1 
-- 					break
-- 				elseif bSameCount == 6 then 
-- 					AnalyseData.bSixFirst[AnalyseData.bSixCount] = bFirstCardIndex 
-- 					AnalyseData.bSixCount = AnalyseData.bSixCount + 1 
-- 					break
-- 				elseif bSameCount == 7 then 
-- 					AnalyseData.bSevenFirst[AnalyseData.bSevenCount] = bFirstCardIndex 
-- 					AnalyseData.bSevenCount = AnalyseData.bSevenCount + 1
-- 					break
-- 				elseif bSameCount == 8 then 
-- 					AnalyseData.bEightFirst[AnalyseData.bEightCount] = bFirstCardIndex 
-- 					AnalyseData.bEightCount = AnalyseData.bEightCount + 1
-- 					break
-- 				end
-- 			end
				
-- 			if bCardValueTemp ~= bLogicValue then
-- 				if bSameCount==1 then
-- 					if i ~= bCardCount-1 then
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = bFirstCardIndex 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1 
-- 					else
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = bFirstCardIndex 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1 
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = i 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1 
-- 					end
-- 				else
-- 					if i==bCardCount-1 then
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = i 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1 
-- 					end
-- 				end
-- 				bSameCount=1
-- 				bLogicValue=bCardValueTemp
-- 				bFirstCardIndex = i 
-- 			end
-- 			if GameLogic.GetCardColor(bCardData[i]) ~= bCardColor then
-- 				bSameColorCount = 1 
-- 			else                                      
-- 				bSameColorCount = bSameColorCount + 1
-- 			end
-- 		end
			
-- 		AnalyseData.bStraight = ((bCardCount-2)==bSameColorCount) and true or false 
		
-- 		if bCardCount == 3 then
-- 			AnalyseData.bOneCount=0
-- 			AnalyseData.bThreeCount =1
-- 			AnalyseData.bThreeFirst[1]=AnalyseData.bOneFirst[1]
-- 			return AnalyseData
-- 		elseif bCardCount == 5 then
-- 			if AnalyseData.bThreeCount==1 then			
-- 				AnalyseData.bThreeCount=0
-- 				AnalyseData.bFiveCount=1
-- 				AnalyseData.bFiveFirst[1]=AnalyseData.bThreeFirst[1]			
-- 			elseif AnalyseData.bTwoCount==1 and AnalyseData.bOneCount==1 then		
-- 				AnalyseData.bTwoCount=0
-- 				AnalyseData.bFourCount=1
-- 				AnalyseData.bFourFirst[1]=AnalyseData.bTwoFirst[1]			
-- 			elseif AnalyseData.bOneCount==3 then	
-- 				AnalyseData.bOneCount=2
-- 				AnalyseData.bThreeCount=1
-- 				AnalyseData.bThreeFirst[1]=AnalyseData.bOneFirst[1]
-- 				AnalyseData.bOneFirst[1]=AnalyseData.bOneFirst[2]
-- 				AnalyseData.bOneFirst[2]=AnalyseData.bOneFirst[3]
-- 				AnalyseData.bOneFirst[3]=AnalyseData.bOneFirst[4]
-- 			end
-- 			return AnalyseData
-- 		elseif bCardCount == 13 then
-- 			if AnalyseData.bOneCount==11 then
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 				AnalyseData.bOneFirst[AnalyseData.bOneCount]=0
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 				AnalyseData.bOneFirst[AnalyseData.bOneCount]=1
-- 			end
			
-- 			if AnalyseData.bEightCount == 1 then
-- 				AnalyseData.bTenCount = AnalyseData.bTenCount + 1
-- 				AnalyseData.bEightCount = AnalyseData.bEightCount - 1
-- 				AnalyseData.bTenFirst[AnalyseData.bTenCount]=AnalyseData.bEightFirst[AnalyseData.bEightCount]		
-- 			elseif AnalyseData.bSevenCount == 1 then
-- 				AnalyseData.bNineCount = AnalyseData.bNineCount + 1
-- 				AnalyseData.bSevenCount = AnalyseData.bSevenCount - 1
-- 				AnalyseData.bNineFirst[AnalyseData.bNineCount]=AnalyseData.bSevenFirst[AnalyseData.bSevenCount]			
-- 			elseif AnalyseData.bSixCount >= 1 then
-- 				AnalyseData.bEightCount = AnalyseData.bEightCount + 1
-- 				AnalyseData.bEightFirst[AnalyseData.bEightCount]=AnalyseData.bSixFirst[1]
-- 				if AnalyseData.bSixCount > 1 then
-- 					for l = 0,AnalyseData.bSixCount - 1 do
-- 						l = l + 1
-- 						AnalyseData.bSixFirst[l] = AnalyseData.bSixFirst[l + 1]
-- 					end
-- 				end
-- 			elseif AnalyseData.bFiveCount >= 1 then
-- 				AnalyseData.bSevenCount = AnalyseData.bSevenCount + 1
-- 				AnalyseData.bSevenFirst[AnalyseData.bSevenCount]=AnalyseData.bFiveFirst[1]
-- 				if AnalyseData.bFiveCount > 1 then
-- 					for l = 0,AnalyseData.bFiveCount - 1 do
-- 						l = l + 1
-- 						AnalyseData.bFiveFirst[l] = AnalyseData.bFiveFirst[l + 1]
-- 					end
-- 				end	
-- 			elseif AnalyseData.bFourCount >= 1 then
-- 				AnalyseData.bSixCount = AnalyseData.bSixCount + 1
-- 				AnalyseData.bSixFirst[AnalyseData.bSixCount]=AnalyseData.bFourFirst[1]
-- 				if AnalyseData.bFourCount > 1 then
-- 					for l = 0,AnalyseData.bFourCount - 1 do
-- 						l = l + 1
-- 						AnalyseData.bFourFirst[l] = AnalyseData.bFourFirst[l + 1]
-- 					end
-- 				end
-- 			elseif AnalyseData.bFourCount==2 and AnalyseData.bThreeCount==1 then
-- 				AnalyseData.bFourCount = AnalyseData.bFourCount + 1
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount - 1
-- 				AnalyseData.bFourFirst[AnalyseData.bFourCount]=AnalyseData.bThreeFirst[AnalyseData.bThreeCount]
-- 			elseif AnalyseData.bFourCount==2 and AnalyseData.bTwoCount==1 then
-- 				AnalyseData.bFourCount = AnalyseData.bFourCount + 1
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount - 1
-- 				AnalyseData.bFourFirst[AnalyseData.bFourCount]=AnalyseData.bTwoFirst[AnalyseData.bTwoCount]
-- 			elseif AnalyseData.bFourCount==1 and AnalyseData.bThreeCount==2 then
-- 				AnalyseData.bFourCount = AnalyseData.bFourCount + 1
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount - 1
-- 				AnalyseData.bFourFirst[AnalyseData.bFourCount]=AnalyseData.bThreeFirst[AnalyseData.bThreeCount]
-- 				AnalyseData.bFourCount = AnalyseData.bFourCount + 1
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount - 1
-- 				AnalyseData.bFourFirst[AnalyseData.bFourCount]=AnalyseData.bThreeFirst[AnalyseData.bThreeCount]
-- 			elseif AnalyseData.bThreeCount==3 and AnalyseData.bTwoCount==1 then
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount - 1
-- 				AnalyseData.bThreeFirst[AnalyseData.bThreeCount++]=AnalyseData.bTwoFirst[AnalyseData.bTwoCount]
-- 			elseif AnalyseData.bThreeCount==3 and AnalyseData.bOneCount==2 then
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bThreeFirst[AnalyseData.bThreeCount++]=AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 			elseif AnalyseData.bThreeCount==2 and AnalyseData.bTwoCount==2 then
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount - 1
-- 				AnalyseData.bThreeFirst[AnalyseData.bThreeCount]=AnalyseData.bTwoFirst[AnalyseData.bTwoCount]
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount - 1
-- 				AnalyseData.bThreeFirst[AnalyseData.bThreeCount]=AnalyseData.bTwoFirst[AnalyseData.bTwoCount]			
-- 			elseif AnalyseData.bTwoCount == 5 and AnalyseData.bOneCount ==1 then
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bThreeFirst[AnalyseData.bThreeCount] = AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 			elseif AnalyseData.bTwoCount== 4 and AnalyseData.bThreeCount==1 then
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount] = 0
-- 			elseif AnalyseData.bTwoCount == 3 and AnalyseData.bThreeCount ==1 then
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 			elseif AnalyseData.bTwoCount == 2 and AnalyseData.bThreeCount ==2 then
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 				AnalyseData.bFourCount = AnalyseData.bFourCount + 1
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount - 1
-- 				AnalyseData.bFourFirst[AnalyseData.bFourCount]=AnalyseData.bThreeFirst[AnalyseData.bThreeCount]
-- 			elseif AnalyseData.bTwoCount ==2 and AnalyseData.bFourCount ==1 and AnalyseData.bThreeCount==1 then
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=0
-- 			elseif (AnalyseData.bTwoCount== 3 and AnalyseData.bFourCount==1) or (AnalyseData.bTwoCount ==1 and AnalyseData.bFourCount ==2) then
-- 				AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bThreeFirst[AnalyseData.bThreeCount] = AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 			elseif (AnalyseData.bTwoCount == 4 and AnalyseData.bOneCount == 3) or (AnalyseData.bFourCount == 2 and AnalyseData.bOneCount == 3) then
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 				AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 				AnalyseData.bOneCount = AnalyseData.bOneCount - 1
-- 				AnalyseData.bTwoFirst[AnalyseData.bTwoCount]=AnalyseData.bOneFirst[AnalyseData.bOneCount]
-- 			end
-- 		end		
-- 	else
-- 		local bLogicValue= self:GetCardLogicValue(bCardData[1])
-- 		local bCardColor = GameLogic.GetCardColor(bCardData[1]) 
-- 		--类似这种处翻译都有异议 懂规则的改	
-- 		for i=1,bCardCount do			
-- 			bCardValueTemp = self:GetCardLogicValue(bCardData[i])
			
-- 			if bCardValueTemp==bLogicValue then
-- 				bSameCount = bSameCount + 1
-- 			end
						
-- 			if (bCardValueTemp ~= bLogicValue) or (i==(bCardCount-1)) then
			
-- 				if bSameCount == 1 then	
-- 					break;
-- 				elseif bSameCount == 2 then	
-- 					AnalyseData.bTwoFirst[AnalyseData.bTwoCount] = bFirstCardIndex 
-- 					AnalyseData.bTwoCount = AnalyseData.bTwoCount + 1
-- 					break
-- 				elseif bSameCount == 3 then	
-- 					AnalyseData.bThreeFirst[AnalyseData.bThreeCount] = bFirstCardIndex 
-- 					AnalyseData.bThreeCount = AnalyseData.bThreeCount + 1
-- 					break
-- 				elseif bSameCount == 4 then		
-- 					AnalyseData.bFourFirst[AnalyseData.bFourCount] = bFirstCardIndex 
-- 					AnalyseData.bFourCount = AnalyseData.bFourCount + 1
-- 					break
-- 				elseif bSameCount == 5 then	
-- 					AnalyseData.bFiveFirst[AnalyseData.bFiveCount] = bFirstCardIndex 
-- 					AnalyseData.bFiveCount = AnalyseData.bFiveCount = 1
-- 					break
-- 				elseif bSameCount == 6 then	
-- 					AnalyseData.bSixFirst[AnalyseData.bSixCount] = bFirstCardIndex 
-- 					AnalyseData.bSixCount = AnalyseData.bSixCount + 1 
-- 					break
-- 				elseif bSameCount == 7 then	
-- 					AnalyseData.bSevenFirst[AnalyseData.bSevenCount] = bFirstCardIndex 
-- 					AnalyseData.bSevenCount = AnalyseData.bSevenCount + 1
-- 					break
-- 				elseif bSameCount == 8 then	
-- 					AnalyseData.bEightFirst[AnalyseData.bEightCount] = bFirstCardIndex 
-- 					AnalyseData.bEightCount = AnalyseData.bEightCount + 1 
-- 					break
-- 				end
-- 			end
					
-- 			if bCardValueTemp ~= bLogicValue then
-- 				if(bSameCount==1) then
-- 					if i ~= bCardCount-1 then
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = bFirstCardIndex 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 					else
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = bFirstCardIndex 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = i 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 					end
-- 				else
-- 					if i==bCardCount-1 then
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = i 
-- 						AnalyseData.bOneCount = AnalyseData.bOneCount + 1
-- 					end
-- 				end
-- 				bSameCount=1
-- 				bLogicValue=bCardValueTemp
-- 				bFirstCardIndex = i 
-- 			end
-- 			if GameLogic.GetCardColor(bCardData[i])~= bCardColor then
-- 				bSameColorCount = 1 
-- 			else									   
-- 				bSameColorCount = bSameColorCount + 1
-- 			end
-- 		end
			
-- 		AnalyseData.bStraight = (bCardCount==bSameColorCount) and true or false 	
-- 	end
	
-- 	return AnalyseData
-- end

-- --比较函数
-- function GameLogic:CompareCard(bInFirstList,bInNextList,bFirstCount,bNextCount,bComperWithOther)

-- 	local bFirstList = clone(bInFirstList)
-- 	local bNextList = clone(bInNextList)
	
-- 	--排序牌组
-- 	self:SortCardList(bFirstList, bFirstCount, GameLogic.enDescend)
-- 	self:SortCardList(bNextList, bNextCount, GameLogic.enDescend)
	
-- 	--分析牌组
-- 	local FirstAnalyseData = GameLogic:AnalyseCard(bFirstList, bFirstCount)
-- 	local NextAnalyseData = GameLogic:AnalyseCard(bNextList, bNextCount)
	
		
-- 	if bFirstCount ~= (FirstAnalyseData.bOneCount+FirstAnalyseData.bTwoCount*2+
-- 					 FirstAnalyseData.bThreeCount*3+FirstAnalyseData.bFourCount*4+
-- 					 FirstAnalyseData.bFiveCount*5+FirstAnalyseData.bSixCount*6+
-- 					 FirstAnalyseData.bSevenCount*7+FirstAnalyseData.bEightCount*8+
-- 					 FirstAnalyseData.bNineCount*9+FirstAnalyseData.bTenCount*10) then
-- 		return -1 
-- 	end

-- 	if bNextCount ~= (NextAnalyseData.bOneCount+NextAnalyseData.bTwoCount*2+
-- 					 NextAnalyseData.bThreeCount*3+NextAnalyseData.bFourCount*4+
-- 					 NextAnalyseData.bFiveCount*5+NextAnalyseData.bSixCount*6+
-- 					 NextAnalyseData.bSevenCount*7+NextAnalyseData.bEightCount*8+
-- 					 NextAnalyseData.bNineCount*9+NextAnalyseData.bTenCount*10) then
-- 		return -1 
-- 	end
   
-- 	if not ((bFirstCount==bNextCount) or (bFirstCount ~= bNextCount and ((3==bFirstCount and 5==bNextCount) or (5==bFirstCount and 3==bNextCount)))) then
-- 		return -1 
-- 	end
			
-- 	local bNextType= self:GetCardType(bNextList,bNextCount)
-- 	local bFirstType=self:GetCardType(bFirstList,bFirstCount)
-- 	if GameLogic.CT_INVALID==bFirstType or GameLogic.CT_INVALID==bNextType then
-- 		return -1 
-- 	end
	
-- 	if true==bComperWithOther then
-- 		if 3==bFirstCount then
-- 			if bNextType==bFirstType then
-- 				if bFirstType == GameLogic.CT_SINGLE then			
-- 					local bAllSame=true 					
-- 					for i=0 ,3  do
-- 						i = i + 1
-- 						if self:GetCardLogicValue(bNextList[i]) ~= self:GetCardLogicValue(bFirstList[i]) then
-- 							bAllSame = false 
-- 							break
-- 						end
-- 					end
					
-- 					if true==bAllSame then
-- 						return 0
-- 					else
-- 						for i=0,3 do
-- 							i = i + 1
-- 							if self:GetCardLogicValue(bNextList[i]) ~= self:GetCardLogicValue(bFirstList[i]) then
-- 								local value = self:GetCardLogicValue(bNextList[i]) > self:GetCardLogicValue(bFirstList[i]) and 1 or -1
-- 								return value
-- 							end
-- 						end								
-- 						return 0 
-- 					end
					
-- 					return 0 			
-- 				elseif bFirstType == GameLogic.CT_ONE_DOUBLE then		
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]]) == self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) then				
-- 						if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]]) ~= self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) then
-- 							local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) and 1 or -1
-- 							return value
-- 						else
-- 							return 0
-- 						end
-- 					else
-- 						local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) and 1 or -1
-- 						return value
-- 					end
-- 				elseif bFirstType == GameLogic.CT_THREE then			
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) then
-- 						return 0
-- 					else
-- 						local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) and 1 or -1	
-- 						return value
-- 					end
-- 				end
-- 			else
-- 				local value = bNextType > bFirstType and 1 or -1
-- 				return value
-- 			end
-- 		elseif 5==bFirstCount then
-- 			if bNextType==bFirstType then
-- 				if bFirstType == GameLogic.CT_SINGLE then							
-- 					local bAllSame=true 					
-- 					for i=0,5 do
-- 						i = i + 1
-- 						if self:GetCardLogicValue(bNextList[i]) ~= self:GetCardLogicValue(bFirstList[i]) then
-- 							bAllSame = false 
-- 							break
-- 						end
-- 					end
					
-- 					if true==bAllSame then
-- 						return 0
-- 					else
-- 						for i=0 ,5 do
-- 							i = i + 1
-- 							if self:GetCardLogicValue(bNextList[i]) ~= self:GetCardLogicValue(bFirstList[i]) then
-- 								local value = self:GetCardLogicValue(bNextList[i]) > self:GetCardLogicValue(bFirstList[i]) and 1 or -1
-- 								return value
-- 							end
-- 						end		
-- 						return 0
-- 					end
					
-- 					return 0 					
-- 				elseif bFirstType == GameLogic.CT_ONE_DOUBLE then			
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) then
-- 						for i=0,3 do
-- 							i = i + 1
-- 							if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[i]]) ~= self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[i]]) then
-- 								local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[i]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[i]]) and 1 or -1
-- 								return value
-- 							end
-- 						end
-- 						return 0
-- 					else
-- 						local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) and 1 or -1
-- 						return value
-- 					end
-- 				elseif bFirstType == GameLogic.CT_FIVE_TWO_DOUBLE then				
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) then
-- 						if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[2]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[2]]) then
-- 							if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[2]]) ~= self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[2]]) then
-- 								local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) and 1 or -1
-- 								return value
-- 							end
							
-- 							return 0
-- 						else						
-- 							local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[2]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[2]]) and 1 or -1
-- 							return value
-- 						end							
-- 					else
-- 						local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) and 1 or -1
-- 						return value
-- 					end
-- 				elseif bFirstType == GameLogic.CT_THREE then			
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]]) == self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) then
-- 						for i=0,2 do
-- 							i = i + 1
-- 							if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[i]]) ~= self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[i]]) then
-- 								local value = (self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[i]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[i]])) and 1 or -1
-- 								return value
-- 							end
-- 						end
						
-- 						return 0
-- 					else
-- 						local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) and 1 or -1
-- 						return value
-- 					end
-- 				elseif bFirstType == GameLogic.CT_FIVE_MIXED_FLUSH_FIRST_A then				
-- 					return 0
-- 				elseif bFirstType == GameLogic.CT_FIVE_MIXED_FLUSH_NO_A then				
-- 					if self:GetCardLogicValue(bNextList[5])==self:GetCardLogicValue(bFirstList[5]) then
-- 						return 0
-- 					else
-- 						local value = self:GetCardLogicValue(bNextList[5]) > self:GetCardLogicValue(bFirstList[5]) and 1 or -1 
-- 						return value
-- 					end
-- 				elseif bFirstType == GameLogic.CT_FIVE_MIXED_FLUSH_BACK_A then				
-- 					return 0
-- 				elseif bFirstType == GameLogic.CT_FIVE_FLUSH then				
-- ---------------------------------------------------------------------------------------暂未翻译----------------------------------------------------------------------------------------
-- 					-- BYTE bFirstListTmp[13], bNextListTmp[13] ;
-- 					-- memcpy(bFirstListTmp , bInFirstList , bFirstCount) ;
-- 					-- memcpy(bNextListTmp , bInNextList , bNextCount) ;
-- 					-- BYTE bFirstValue = (bFirstListTmp[4] & CARD_MASK_VALUE);
-- 					-- BYTE bNextValue = (bNextListTmp[4] & CARD_MASK_VALUE);
-- 					-- BYTE bFirstColor = (bFirstListTmp[4] & CARD_MASK_COLOR) >> 4;
-- 					-- BYTE bNextColor = (bNextListTmp[4] & CARD_MASK_COLOR) >> 4;

-- 					-- bFirstColor = ((bFirstColor + 1) % 4) << 4;
-- 					-- bNextColor = ((bNextColor + 1) % 4) << 4;
-- 					-- bFirstListTmp[4] = bFirstColor | bFirstValue;
-- 					-- bNextListTmp[4] = bNextValue | bNextColor;
-- 					-- return CompareCard(bFirstListTmp, bNextListTmp, bFirstCount, bNextCount, bComperWithOther);

-- 					local bFirstListTmp = bInFirstList
-- 					local bNextListTmp = bInNextList
-- 					local bFirstValue = bit.band(bFirstListTmp[5], GameLogic.CARD_MASK_VALUE)
-- 					local bNextValue = bit.band(bNextListTmp[5], GameLogic.CARD_MASK_VALUE)
-- 					local bFirstColor = bit.rshit( bit.band(bFirstListTmp[5], GameLogic.CARD_MASK_COLOR), 4)
-- 					local bNextColor = bit.rshit( bit.band(bNextListTmp[5], GameLogic.CARD_MASK_COLOR), 4)

-- 					bFirstColor = bit.lshit((bFirstColor + 1) % 4, 4)
-- 					bNextColor = bit.lshit((bNextColor + 1) % 4, 4)
-- 					bFirstListTmp[5] = bit.bor(bFirstColor, bFirstValue)
-- 					bNextListTmp[5] = bit.bor(bNextValue, bNextColor)

-- 					return GameLogic.CompareCard(bFirstListTmp, bNextListTmp, bFirstCount, bNextCount, bComperWithOther)


-- ---------------------------------------------------------------------------------------暂未翻译----------------------------------------------------------------------------------------
-- 				elseif bFirstType == GameLogic.CT_FIVE_THREE_DEOUBLE then				
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]]) == self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) then
-- 						if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) then
-- 							return 0
-- 						end
						
-- 						local value = (self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) and 1 or -1)
-- 						return value					
-- 					else
-- 						local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) and 1 or -1 
-- 						return value
-- 					end
-- 				elseif bFirstType == GameLogic.CT_FIVE_FOUR_ONE then					
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bFourFirst[1]]) == self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFourFirst[1]]) then
-- 						if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) then
-- 							return 0
-- 						end
-- 						local value = (self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) and 1 or -1)
-- 						return value
-- 					else
-- 						local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bFourFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFourFirst[1]]) and 1 or -1 	
-- 						return value
-- 					end					
-- 				elseif bFirstType == GameLogic.CT_FIVE_BOMB then				
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bFiveFirst[1]]) == self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFiveFirst[1]]) then
-- 						return 0
-- 					else
-- 						local value = self:GetCardLogicValue(bNextList[NextAnalyseData.bFiveFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFiveFirst[1]]) and 1 or -1
-- 						return value
-- 					end	
-- 				elseif bFirstType == GameLogic.CT_FIVE_STRAIGHT_FLUSH_NO_A then
-- 					if self:GetCardLogicValue(bNextList[5]) == self:GetCardLogicValue(bFirstList[5]) then
-- 						local bFirstKing = (bFirstList[1] == 0x41 or bFirstList[1] == 0x42)
-- 						local bNextKing = (bNextList[1] == 0x41 or bNextList[1] == 0x42)

-- 						if (bFirstKing == false and bNextKing == false) or (bFirstKing == true and bNextKing == true) then
						
-- 							local color1 = GameLogic.GetCardColor(bNextList[5])
-- 							local color2 = GameLogic.GetCardColor(bFirstList[5])
-- 							local value = color1 == color2 and 0 or (color1 > color2 and 1 or -1)
-- 							return value
-- 						end
-- 						local value = not bNextKing and 1 or -1
-- 						return value
-- 					end
-- 					local value = self:GetCardLogicValue(bNextList[5]) > self:GetCardLogicValue(bFirstList[5]) and 1 or -1
-- 					return value
-- 				elseif bFirstType == GameLogic.CT_FIVE_STRAIGHT_FLUSH_FIRST_A then
-- 				elseif bFirstType == GameLogic.CT_FIVE_STRAIGHT_FLUSH_BACK_A then
-- 					local bFirstKing = (bFirstList[1] == 0x41 or bFirstList[1] == 0x42)
-- 					local bNextKing = (bNextList[1] == 0x41 or bNextList[1] == 0x42)
					
-- 					if (bFirstKing == false and bNextKing == false) or (bFirstKing == true and bNextKing == true) then				
-- 						local color1 = GameLogic.GetCardColor(bNextList[5])
-- 						local color2 = GameLogic.GetCardColor(bFirstList[5])
-- 						local value = color1 == color2 and 0 or (color1 > color2 and 1 or -1)
-- 						return value
-- 					end
					
-- 					local value = not bNextKing and 1 or -1
-- 					return value
-- 			   end				
-- 			else
-- 				local value = bNextType>bFirstType and 1 or -1
-- 				return value
-- 			end
-- 		else
-- 			if bNextType==bFirstType then
-- 				if bFirstType == GameLogic.CT_THIRTEEN_FLUSH then
-- 				elseif bFirstType == GameLogic.CT_THIRTEEN then
-- 					return 0
-- 				elseif bFirstType == GameLogic.CT_SIX_SAME then
-- 					if NextAnalyseData.bSixCount ~= FirstAnalyseData.bSixCount then
-- 						return NextAnalyseData.bSixCount > FirstAnalyseData.bSixCount and 1 or -1
-- 					end
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bSixFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bSixFirst[1]]) and 1 or -1
-- 				elseif bFirstType == GameLogic.CT_SEVEN_SAME then
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bSevenFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bSevenFirst[1]]) and 1 or -1
-- 				elseif bFirstType == GameLogic.CT_EIGHT_SAME then
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bEightFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bEightFirst[1]]) and 1 or -1
-- 				elseif bFirstType == GameLogic.CT_NINE_SAME then
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bNineFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bNineFirst[1]]) and 1 or -1
-- 				elseif bFirstType == GameLogic.CT_TEN_SAME then
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bTenFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTenFirst[1]]) and 1 or -1
-- 				elseif bFirstType == GameLogic.CT_THREE_STRAIGHTFLUSH then
-- 					local AllSame=true
-- 					for i=0,13 do
-- 						i = i + 1
-- 						if self:GetCardLogicValue(bNextList[i])~=self:GetCardLogicValue(bFirstList[i]) then						
-- 							AllSame=false
-- 							return self:GetCardLogicValue(bNextList[i])>self:GetCardLogicValue(bFirstList[i]) and 1 or -1
-- 						end
-- 					end
-- 					if AllSame then
-- 						return 0
-- 					end
-- 					return 0
-- 				elseif bFirstType == GameLogic.CT_THREE_BOMB then
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bFourFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFourFirst[1]]) then
-- 						if self:GetCardLogicValue(bNextList[NextAnalyseData.bFourFirst[2]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFourFirst[2]]) then
-- 							if self:GetCardLogicValue(bNextList[NextAnalyseData.bFourFirst[3]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFourFirst[3]]) then
-- 								if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) then
-- 									return 0
-- 								else
-- 									return self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) and 1 or -1
-- 								end
-- 							else
-- 								return self:GetCardLogicValue(bNextList[NextAnalyseData.bFourFirst[3]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFourFirst[3]]) and 1 or -1
-- 							end
-- 						else
-- 							return self:GetCardLogicValue(bNextList[NextAnalyseData.bFourFirst[2]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFourFirst[2]]) and 1 or -1
-- 						end
-- 					else
-- 						return self:GetCardLogicValue(bNextList[NextAnalyseData.bFourFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFourFirst[1]]) and 1 or -1 	
-- 					end
					
-- 					return 0
-- 				elseif bFirstType == GameLogic.CT_FOUR_THREESAME then
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) then
-- 						if self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[2]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[2]]) then
-- 							if self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[3]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[3]]) then
-- 								if self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[4]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[4]]) then
-- 									if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) then
-- 										return 0
-- 									else
-- 										return self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) and 1 or -1
-- 									end
-- 								else
-- 									return self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[4]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[4]]) and 1 or -1
-- 								end
-- 							else
-- 								return self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[3]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[3]]) and 1 or -1
-- 							end
-- 						else
-- 							return self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[2]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[2]]) and 1 or -1
-- 						end
-- 					else
-- 						return self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) and 1 or -1
-- 					end
					
-- 					return 0					
-- 				elseif bFirstType == GameLogic.CT_FIVEPAIR_THREE then
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) then
-- 						if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[2]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[2]]) then
-- 							if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[3]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[3]]) then
-- 								if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[4]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[4]]) then
-- 									if(self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[5]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[5]])) then
-- 										if self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) then
-- 											return 0
-- 										else
-- 											return self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) and 1 or -1
-- 										end
-- 									else
-- 										return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[5]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[5]]) and 1 or -1
-- 									end
-- 								else
-- 									return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[4]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[4]]) and 1 or -1
-- 								end
-- 							else
-- 								return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[3]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[3]]) and 1 or -1
-- 							end
-- 						else
-- 							return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[2]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[2]]) and 1 or -1
-- 						end
-- 					else
-- 						return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) and 1 or -1
-- 					end
					
-- 					return 0
-- 				elseif bFirstType == GameLogic.CT_SIXPAIR then
-- 					if(self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) then
-- 						if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[2]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[2]]) then
-- 							if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[3]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[3]]) then
-- 								if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[4]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[4]]) then
-- 									if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[5]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[5]]) then
-- 										if Gself:etCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[6]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[6]]) then
-- 											if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) then
-- 												return 0
-- 											else
-- 												return self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) and 1 or -1
-- 											end
-- 										else
-- 											return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[6]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[6]]) and 1 or -1
-- 										end
-- 									else
-- 										return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[5]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[5]]) and 1 or -1
-- 									end
-- 								else
-- 									return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[4]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[4]]) and 1 or -1
-- 								end
-- 							else
-- 								return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[3]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[3]]) and 1 or -1
-- 							end
-- 						else
-- 							return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[2]])>self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[2]]) and 1 or -1
-- 						end
-- 					else
-- 						return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) and 1 or -1
-- 					end
					
-- 					return 0
-- 				elseif bFirstType == GameLogic.CT_THREE_FLUSH then
-- 					local AllSame=true
-- 					for i=0,13 do
-- 						i = i + 1
-- 						if self:GetCardLogicValue(bNextList[i]) ~= self:GetCardLogicValue(bFirstList[i]) then
-- 							AllSame=false
-- 							return self:GetCardLogicValue(bNextList[i])>self:GetCardLogicValue(bFirstList[i]) and 1 or -1
-- 						end
-- 					end
-- 					if AllSame then
-- 						return 0
-- 					end
-- 					return 0
-- 				elseif bFirstType == GameLogic.CT_THREE_STRAIGHT then
-- 					local AllSame=true
-- 					for i=0,13 do
-- 						i = i + 1
-- 						if self:GetCardLogicValue(bNextList[i]) ~= self:GetCardLogicValue(bFirstList[i]) then						
-- 							AllSame=false
-- 							return self:GetCardLogicValue(bNextList[i])>self:GetCardLogicValue(bFirstList[i]) and 1 or -1
-- 						end
-- 					end
-- 					if AllSame then
-- 						return 0
-- 					return 0
-- 				end
-- 			else
-- 				if (bNextType == CT_SIXPAIR or bNextType == CT_THREE_STRAIGHT or bNextType == CT_THREE_FLUSH)
-- 					and (bFirstType == CT_SIXPAIR or bFirstType == CT_THREE_STRAIGHT or bFirstType == CT_THREE_FLUSH) then
-- 						return 0
-- 				end
				
-- 				return bNextType>bFirstType and 1 or -1
-- 			end
-- 		end
-- 	else		
-- 		if bNextType==bFirstType then
-- 			if bFirstType == GameLogic.CT_SINGLE then				
-- 				local bAllSame=true 
-- 				for i=0 ,3  do
-- 					i = i + 1
-- 					if self:GetCardLogicValue(bNextList[i]) ~= self:GetCardLogicValue(bFirstList[i]) then
-- 						bAllSame = false 
-- 						break
-- 					end
-- 				end
				
-- 				if true==bAllSame then
-- 					return 0
-- 				else
-- 					for i=0 ,3  do
-- 						i = i + 1
-- 						if self:GetCardLogicValue(bNextList[i]) ~= self:GetCardLogicValue(bFirstList[i]) then
-- 							return self:GetCardLogicValue(bNextList[i]) > self:GetCardLogicValue(bFirstList[i]) and 1 or -1
-- 						end
-- 					end
-- 					return bNextCount < bFirstCount and 1 or -1
-- 				end
				
-- 				return bNextCount < bFirstCount and 1 or -1
-- 			elseif bFirstType == GameLogic.CT_ONE_DOUBLE then	
-- 				if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) then
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]]) ~= self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) then
-- 						return self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) and 1 or -1
-- 					end
					
-- 					return 0
-- 				else
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) and 1 or -1	
-- 				end
				
-- 				return bNextCount < bFirstCount and 1 or -1
-- 			elseif bFirstType == GameLogic.CT_FIVE_TWO_DOUBLE then
-- 				if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) then
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[2]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[2]]) then
					   
-- 						if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]]) ~= self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) then
-- 							return self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) and 1 or -1	
-- 						end
						
-- 						return 0
-- 					else
-- 						return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[2]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[2]]) and 1 or -1		
-- 					end
-- 				else
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) and 1 or -1	
-- 				end
-- 			elseif bFirstType == GameLogic.CT_THREE then	
-- 				if self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) then
-- 					for i=0,2 do
-- 						i = i + 1
-- 						if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[i]]) ~= self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[i]]) then
-- 							return (self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[i]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[i]])) and 1 or -1	
-- 						end
-- 					end
					
-- 					return 0
-- 				else
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) and 1 or -1	
-- 				end
-- 			elseif bFirstType == GameLogic.CT_FIVE_MIXED_FLUSH_FIRST_A then	
-- 				return 0
-- 			elseif bFirstType == GameLogic.CT_FIVE_MIXED_FLUSH_NO_A then		
-- 				if self:GetCardLogicValue(bNextList[5])==self:GetCardLogicValue(bFirstList[5]) then
-- 					return 0
-- 				else
-- 					return self:GetCardLogicValue(bNextList[5]) > self:GetCardLogicValue(bFirstList[5]) and 1 or -1	
-- 				end
-- 			elseif bFirstType == GameLogic.CT_FIVE_MIXED_FLUSH_BACK_A then		
-- 				return 0
				
-- 			elseif bFirstType == GameLogic.CT_FIVE_FLUSH then
-- ---------------------------------------------------------------------------------------暂未翻译----------------------------------------------------------------------------------------				
-- 				-- BYTE bFirstListTmp[13], bNextListTmp[13] ;
-- 				-- memcpy(bFirstListTmp , bInFirstList , bFirstCount) ;
-- 				-- memcpy(bNextListTmp , bInNextList , bNextCount) ;
-- 				-- BYTE bFirstValue = (bFirstListTmp[4] & CARD_MASK_VALUE);
-- 				-- BYTE bNextValue = (bNextListTmp[4] & CARD_MASK_VALUE);
-- 				-- BYTE bFirstColor = (bFirstListTmp[4] & CARD_MASK_COLOR) >> 4;
-- 				-- BYTE bNextColor = (bNextListTmp[4] & CARD_MASK_COLOR) >> 4;
				
-- 				-- bFirstColor = ((bFirstColor + 1) % 4) << 4;
-- 				-- bNextColor = ((bNextColor + 1) % 4) << 4;
-- 				-- bFirstListTmp[4] = bFirstColor | bFirstValue;
-- 				-- bNextListTmp[4] = bNextValue | bNextColor;
-- 				-- return CompareCard(bFirstListTmp, bNextListTmp, bFirstCount, bNextCount, bComperWithOther)

-- 				local bFirstListTmp = bInFirstList
-- 				local bNextListTmp = bInNextList
-- 				local bFirstValue = bit.band(bFirstListTmp[5], GameLogic.CARD_MASK_VALUE)
-- 				local bNextValue = bit.band(bNextListTmp[5], GameLogic.CARD_MASK_VALUE)
-- 				local bFirstColor = bit.rshit( bit.band(bFirstListTmp[5], GameLogic.CARD_MASK_COLOR), 4)
-- 				local bNextColor = bit.rshit( bit.band(bNextListTmp[5], GameLogic.CARD_MASK_COLOR), 4)

-- 				bFirstColor = bit.lshit((bFirstColor + 1) % 4, 4)
-- 				bNextColor = bit.lshit((bNextColor + 1) % 4, 4)
-- 				bFirstListTmp[5] = bit.bor(bFirstColor, bFirstValue)
-- 				bNextListTmp[5] = bit.bor(bNextValue, bNextColor)

-- 				return GameLogic.CompareCard(bFirstListTmp, bNextListTmp, bFirstCount, bNextCount, bComperWithOther)
-- ---------------------------------------------------------------------------------------暂未翻译----------------------------------------------------------------------------------------
-- 			elseif bFirstType == GameLogic.CT_FIVE_THREE_DEOUBLE then			
-- 				if self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) then
-- 					if GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) then
-- 						return 0
-- 					end
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bTwoFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bTwoFirst[1]]) and 1 or -1	
-- 				else
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bThreeFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bThreeFirst[1]]) and 1 or -1	
-- 				end
-- 			elseif bFirstType == GameLogic.CT_FIVE_FOUR_ONE then	
-- 				if self:GetCardLogicValue(bNextList[NextAnalyseData.bFourFirst[1]]) == self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFourFirst[1]]) then
-- 					if self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]])==self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) then
-- 						return 0
-- 					end
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bOneFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bOneFirst[1]]) and 1 or -1	
-- 				else
-- 					return self:GetCardLogicValue(bNextList[NextAnalyseData.bFourFirst[1]]) > self:GetCardLogicValue(bFirstList[FirstAnalyseData.bFourFirst[1]]) and 1 or -1	
-- 				end
-- 			elseif bFirstType == GameLogic.CT_FIVE_STRAIGHT_FLUSH_NO_A then  
-- 				if self:GetCardLogicValue(bNextList[5]) == self:GetCardLogicValue(bFirstList[5]) then
-- 					local bFirstKing = (bFirstList[1] == 0x41 or bFirstList[1] == 0x42)
-- 					local bNextKing = (bNextList[1 == 0x41 or bNextList[1] == 0x42)
					
-- 					if (bFirstKing == false and bNextKing == false) or (bFirstKing == true and bNextKing == true) then
-- 						local color1 = GetCardColor(bNextList[5])
-- 						local color2 = GetCardColor(bFirstList[5])
-- 						return color1 == color2 and 0 or (color1 > color2 and 1 or -1)
-- 					end
-- 					return (not bNextKing and 1 or -1)	
-- 				end			
-- 				return self:GetCardLogicValue(bNextList[5]) > self:GetCardLogicValue(bFirstList[5]) and 1 or -1					
-- 			end
-- 			elseif bFirstType == GameLogic.CT_FIVE_STRAIGHT_FLUSH_FIRST_A then
-- 			elseif bFirstType == GameLogic.CT_FIVE_STRAIGHT_FLUSH_BACK_A then
-- 				local bFirstKing = (bFirstList[1] == 0x41 or bFirstList[1] == 0x42)
-- 				local bNextKing = (bNextList[1] == 0x41 or bNextList[1] == 0x42)
				
-- 				if (bFirstKing == false and bNextKing == false)  or (bFirstKing == true and bNextKing == true) then
-- 					local color1 = GetCardColor(bNextList[5])
-- 					local color2 = GetCardColor(bFirstList[5])
-- 					return color1 == color2 and 0 or (color1 > color2 and 1 or -1)
-- 				end
-- 				return (not bNextKing and 1 or -1)
-- 			else
-- 				return 0 
-- 			end			
-- 		else
-- 			return bNextType>bFirstType  and 1 or -1
-- 		end
-- 	end
	
-- 	return 0
-- end

-- ------------------------------------------------------------------------------------------------------暂未翻译--------------------------------------------------------------------------
-- -- bool CGameLogic::AppendCard( const BYTE bAppendCard[],BYTE bAppendCount,BYTE bCardData[],BYTE &bCardCount )
-- -- {
-- -- 	assert(bAppendCount+bCardCount<=13);
-- -- 	for(int i=0;i<bAppendCount;i++)
-- -- 	{
-- -- 		bCardData[bCardCount+i]=bAppendCard[i];
-- -- 	}
-- -- 	bCardCount+=bAppendCount;
-- -- 	return true;
-- -- }

-- function GameLogic:AppendCard( bAppendCard, bAppendCount, bCardData, bCardCount )
-- 	assert(bAppendCount+bCardCount <=13)
-- 	for i=1,bAppendCount do
-- 		bCardData[bCardCount+i] = bAppendCard[i]
-- 	end

-- 	bCardCount = bCardCount + bAppendCount

-- 	return true
-- end

-- -- BYTE CGameLogic::GetCardCount( BYTE bCardData[] )
-- -- {
-- -- 	BYTE Number=0;
-- -- 	if(0==GetCardLogicValue(bCardData[1])&&0==GetCardLogicValue(bCardData[2]))
-- -- 	{
-- -- 		return 0;
-- -- 	}
-- -- 	else
-- -- 	{
-- -- 		for(BYTE i=0;i<5;i++)
-- -- 		{
-- -- 			if(GetCardLogicValue(bCardData[i])>0)
-- -- 			{
-- -- 				Number++;
-- -- 			}
-- -- 			else
-- -- 			{
-- -- 				break;
-- -- 			}
-- -- 		}
-- -- 	}
-- -- 	return Number;
-- -- } 

-- function GameLogic:GetCardCount( bCardData )
-- 	local Number = 0
-- 	if (0 == GameLogic.GetCardLogicValue(bCardData[2]) && GameLogic.GetCardLogicValue(bCardData[3])) then
-- 		return 0
-- 	else
-- 		for i=1,5 do
-- 			if GameLogic.GetCardLogicValue(bCardData[i] > 0) then
-- 				Number = Number + 1
-- 			else
-- 				break;
-- 			end
-- 		end
-- 	end

-- 	return Number
-- end

-- -- bool CGameLogic::IsThreeFlushStraight(const BYTE cbCardData[], const BYTE cbCardCount)
-- -- {
-- -- 	--￐ﾣ￑￩ￊ�ﾾ￝
-- -- 	assert(cbCardCount <= 13 || cbCardCount>3);
	
-- -- 	BYTE bCardList[13] = {0};
-- -- 	memcpy(bCardList,cbCardData,sizeof(BYTE)*cbCardCount);
-- -- 	SortCardList(bCardList,cbCardCount);
-- -- 	BYTE bLeftCount = cbCardCount;
-- -- 	BYTE cbStraightFlush[5] = {0};
-- -- 	BYTE bTempCount = 5;

-- function GameLogic:IsThreeFlushStraight( cbCardData, cbCardCount )
-- 	assert(cbCardCount <= 13 or cbCardCount > 3)
-- 	local bCardList = cbCardData
-- 	GameLogic.SortCardList(bCardList,cbCardCount)
-- 	local bLeftCount = cbCardCount
-- 	local cbStraightFlush
-- 	local bTempCount = 5
	
-- 	-- tagAnalyseType tagCardType = GetType(bCardList,bLeftCount);
-- 	-- if (tagCardType.bStraightFlush)
-- 	-- {
-- 	-- 	for (BYTE i = 0;i<tagCardType.btStraightFlush;++i)
-- 	-- 	{
-- 	-- 		memcpy(bCardList,cbCardData,sizeof(bCardList));
-- 	-- 		bLeftCount = 13;
-- 	-- 		SortCardList(bCardList,13);
-- 	-- 		zeromemory(cbStraightFlush,sizeof(cbStraightFlush));
-- 	-- 		cbStraightFlush[0]=bCardList[tagCardType.cbStraightFlush[i*5]];
-- 	-- 		cbStraightFlush[1]=bCardList[tagCardType.cbStraightFlush[i*5+1]];
-- 	-- 		cbStraightFlush[2]=bCardList[tagCardType.cbStraightFlush[i*5+2]];
-- 	-- 		cbStraightFlush[3]=bCardList[tagCardType.cbStraightFlush[i*5+3]];
-- 	-- 		cbStraightFlush[4]=bCardList[tagCardType.cbStraightFlush[i*5+4]];
-- 	local tagCardType = GameLogic.GetType(bCardList,bLeftCount)
-- 	if tagCardType.bStraightFlush then
-- 		for i=1,tagCardType.btStraightFlush do
-- 			bCardList = cbCardData
-- 			bLeftCount = 13
-- 			GameLogic.SortCardList(bCardList,13)
-- 			cbStraightFlush[1] = bCardList[tagCardType.cbStraightFlush[(i - 1)*5] + 1]
-- 			cbStraightFlush[2] = bCardList[tagCardType.cbStraightFlush[(i - 1)*5] + 2]
-- 			cbStraightFlush[3] = bCardList[tagCardType.cbStraightFlush[(i - 1)*5] + 3]
-- 			cbStraightFlush[4] = bCardList[tagCardType.cbStraightFlush[(i - 1)*5] + 4]
-- 			cbStraightFlush[5] = bCardList[tagCardType.cbStraightFlush[(i - 1)*5] + 5]
-- 		end

-- 			-- --ￒￆﾳ�ﾵￚￒﾻﾸ￶ￍﾬﾻﾨￋﾳ
-- 			-- RemoveCard(cbStraightFlush, bTempCount, bCardList, bLeftCount);
-- 			-- bLeftCount -= bTempCount;
			
-- 			-- --ﾱﾸﾷ￝ￊﾣￓ￠ￅￆ
-- 			-- BYTE bLeftCardList[13] = {0};
-- 			-- memcpy(bLeftCardList,bCardList,bLeftCount);
-- 			-- BYTE bLeftCount1 =bLeftCount;
			
-- 			-- tagAnalyseType tagCardType1 = GetType(bCardList,bLeftCount);
-- 		GameLogic.RemoveCard(cbStraightFlush, bTempCount, bCardList, bLeftCount)
-- 		bLeftCount = bTempCount
-- 		local bLeftCardList = bCardList
-- 		local bLeftCount1 = bLeftCount

-- 		local tagCardType1 = GameLogic.GetType(bCardList,bLeftCount)

-- 			-- if (tagCardType1.bStraightFlush)
-- 			-- {
-- 			-- 	for (BYTE j = 0;j<tagCardType1.btStraightFlush;++j)
-- 			-- 	{
-- 			-- 		--ￖ￘￐ￂﾸﾳￖﾵ
-- 			-- 		memcpy(bCardList,bLeftCardList,bLeftCount1);
-- 			-- 		zeromemory(cbStraightFlush,sizeof(cbStraightFlush));
-- 			-- 		bLeftCount =bLeftCount1;
-- 			-- 		cbStraightFlush[0]=bCardList[tagCardType1.cbStraightFlush[j*5]];
-- 			-- 		cbStraightFlush[1]=bCardList[tagCardType1.cbStraightFlush[j*5+1]];
-- 			-- 		cbStraightFlush[2]=bCardList[tagCardType1.cbStraightFlush[j*5+2]];
-- 			-- 		cbStraightFlush[3]=bCardList[tagCardType1.cbStraightFlush[j*5+3]];
-- 			-- 		cbStraightFlush[4]=bCardList[tagCardType1.cbStraightFlush[j*5+4]];
-- 			-- 		--ￒￆﾳ�ﾵￚﾶ￾ﾸ￶ￍﾬﾻﾨￋﾳ
-- 			-- 		RemoveCard(cbStraightFlush, bTempCount, bCardList, bLeftCount);
-- 			-- 		bLeftCount -= bTempCount;
-- 		if tagCardType1.bStraightFlush then
-- 			for j=1,tagCardType1.btStraigtFlush do
-- 				bCardList = bLeftCardList
-- 				bLeftCount = bLeftCount1
-- 				cbStraightFlush[1] = bCardList[tagCardType.cbStraightFlush[(i - 1)*5] + 1]
-- 				cbStraightFlush[2] = bCardList[tagCardType.cbStraightFlush[(i - 1)*5] + 2]
-- 				cbStraightFlush[3] = bCardList[tagCardType.cbStraightFlush[(i - 1)*5] + 3]
-- 				cbStraightFlush[4] = bCardList[tagCardType.cbStraightFlush[(i - 1)*5] + 4]
-- 				cbStraightFlush[5] = bCardList[tagCardType.cbStraightFlush[(i - 1)*5] + 5]
				
-- 				GameLogic.RemoveCard(cbStraightFlush, bTempCount, bCardList, bLeftCount)
-- 				bLeftCount = bTempCount
-- 					-- --ￅ￐ﾶￏￊﾣￓ￠3ￕￅￊￇﾷ￱ￒﾲﾷ￻ﾺￏￍﾬﾻﾨￋﾳ
-- 					-- bool bThreeStraightFlush = false;
-- 					-- SortCardList(bCardList , bLeftCount, enDescend) ;
					
-- 					-- if (GetCardLogicValue(bCardList[0]) >=CARD_XW && GetCardLogicValue(bCardList[1]) <CARD_XW)
-- 					-- {
-- 					-- 	if((GetCardColor(bCardList[1]) == GetCardColor(bCardList[2]))&&
-- 					-- 	   (GetCardLogicValue(bCardList[1])-GetCardLogicValue(bCardList[2])==1

-- 					-- 		|| GetCardLogicValue(bCardList[1])-GetCardLogicValue(bCardList[2])==2
-- 					-- 		|| (GetCardLogicValue(bCardList[1]) == 14 &&GetCardLogicValue(bCardList[2])<=3))
-- 					-- 	   )
-- 					-- 	{
-- 					-- 		bThreeStraightFlush = true;
-- 					-- 	}
-- 					-- }
-- 				local bThreeStraightFlush = false
-- 				GameLogic.SortCardList(bCardList, bLeftCount, enDescend)

-- 				if GameLogic.GetCardLogicValue( bCardList[1] ) >= GameLogic.CARD_XW 
-- 					and GameLogic.GetCardLogicValue( bCardList[2] ) < GameLogic.CARD_XW) then
-- 					if (GameLogic.GetCardColor( bCardList[2] ) == GameLogic.GetCardColor( bCardList[3] )
-- 						and GameLogic.GetCardLogicValue( bCardList[2] ) - GameLogic.GetCardLogicValue(bCardList[3]) == 1
-- 						or GameLogic.GetCardLogicValue(bCardList[2]) - GameLogic.GetCardLogicValue(bCardList[3]) == 2
-- 						or (GameLogic.GetCardLogicValue(bCardList[2]) == 14 and GameLogic.GetCardLogicValue(bCardList[3]) <=3) then
-- 							bThreeStraightFlush =true
-- 					end
-- 				--}
-- 					-- else if (GetCardLogicValue(bCardList[0]) ==CARD_DW && GetCardLogicValue(bCardList[1]) ==CARD_XW)
-- 					-- {
-- 					-- 	bThreeStraightFlush = true;
-- 					-- }
-- 					-- else
-- 					-- {
-- 					-- 	if((GetCardColor(bCardList[0]) == GetCardColor(bCardList[1]) && GetCardColor(bCardList[0]) == GetCardColor(bCardList[2]))&&
-- 					-- 	   ((GetCardLogicValue(bCardList[0])==GetCardLogicValue(bCardList[1])+1 && GetCardLogicValue(bCardList[1])==GetCardLogicValue(bCardList[2])+1)
-- 					-- 		|| (GetCardLogicValue(bCardList[0]) == 14 &&GetCardLogicValue(bCardList[1])==3 &&GetCardLogicValue(bCardList[2])==2)))
-- 					-- 	{
-- 					-- 		bThreeStraightFlush = true;
-- 					-- 	}
-- 					-- }
-- 					-- if (bThreeStraightFlush)
-- 					-- {
-- 					-- 	return true;
-- 					-- }
-- 				elseif GameLogic.GetCardLogicValue(bCardList[1] )== GameLogic.CARD_XW 
-- 					and GameLogic.GetCardLogicValue(bCardList[2]) == GameLogic.CARD_XW then
-- 					bThreeStraightFlush = true
-- 				else
-- 					if GameLogic.GetCardColor(bCardList[1]) == GameLogic.GetCardColor(bCardList[2])
-- 						and GameLogic.GetCardColor(bCardList[1]) == GameLogic.GetCardColor(bCardList[3])
-- 						and GameLogic.GetCardLogicValue(bCardList[1]) == GameLogic.GetCardLogicValue(bCardList[2]) + 1
-- 						and GameLogic.GetCardLogicValue(bCardList[2]) == GameLogic.GetCardLogicValue(bCardList[3]) + 1
-- 						or ( GameLogic.GetCardLogicValue(bCardList[1]) == 14 and GameLogic.GetCardLogicValue(bCardList[2]) ==3 and GameLogic.GetCardLogicValue(bCardList[3]) ==2 )
-- 						then
-- 						bThreeStraightFlush = true
-- 					end
-- 				end
-- 				if bThreeStraightFlush then
-- 					return true
-- 				end
-- 			end
-- 		end
-- 	end
-- 	-- 		}			
-- 	-- 	}
-- 	-- }
	
-- 	-- return false;
-- -- }
-- 	return false
-- end

-- --  bool CGameLogic::RemoveOperateCard(const BYTE bRemoveCard, BYTE bCardData[], BYTE bCardCount)
-- -- {
-- -- 	--ﾼ￬￑￩ￊ�ﾾ￝
-- -- 	assert(1<=bCardCount);
	
-- -- 	--ﾶﾨￒ￥ﾱ￤￁﾿
-- -- 	BYTE bDeleteCount=0,bTempCardData[5];
-- -- 	if (bCardCount>CountArray(bTempCardData)) return false;
-- -- 	memcpy(bTempCardData,bCardData,bCardCount*sizeof(bCardData[0]));
	
-- -- 	--ￖￃ￁￣ￆￋ﾿ￋ
-- -- 	for (BYTE i=0;i<bCardCount;i++)
-- -- 	{
-- -- 		if (bTempCardData[i]==bRemoveCard)
-- -- 		{
-- -- 			bDeleteCount++;
-- -- 			bTempCardData[i]=0;
-- -- 			break;
-- -- 		}
-- -- 	}
-- -- 	if (bDeleteCount!=1) return false;
-- -- 	BYTE bCardPos=0;
-- -- 	zeromemory(bCardData, sizeof(BYTE) * 5);
-- -- 	for (BYTE i=0;i<bCardCount;i++)
-- -- 	{
-- -- 		if (bTempCardData[i]!=0) bCardData[bCardPos++]=bTempCardData[i];
-- -- 	}
	
-- -- 	return true;
-- -- }
-- function GameLogic:RemoveOperateCard( bRemoveCard, bCardData, bCardCount )
-- 	assert(1<=bCardCount)
-- 	local bDeleteCount = 0
-- 	local bTempCardData = bCardData
-- 	if(bCardCount > 5) then
-- 		return false
-- 	end

-- 	for i=1,bCardCount do
-- 		if bTempCardData[i]  == bRemoveCard then
-- 			bDeleteCount = bDeleteCount + 1
-- 			bTempCardData[i] = 0
-- 			break
-- 		end
-- 	end

-- 	if bDeleteCount ~= 1 then return false end

-- 	local bCardPos = 1
-- 	for i=1,bCardCount do
-- 		if bTempCardData[i] ~= 0 then
-- 			bCardData[bCardPos] = bTempCardData[i]
-- 			bCardPos = bCardPos + 1
-- 		end
-- 	end

-- 	return true
-- end


-- -- bool CGameLogic::IsStraight(const BYTE cbCardData[], const BYTE cbCardCount, BYTE cbMaxCardData[], BYTE & bMaxCardCount, BYTE bNeedCCount)
-- -- {
-- -- 	--￐ﾣ￑￩ￊ�ﾾ￝
-- -- 	assert(cbCardCount <= 13 || cbCardCount > 3);
	
-- -- 	--ﾶﾨￒ￥ﾱ￤￁﾿
-- -- 	BYTE bKCount = 0;
-- -- 	std::vector<BYTE> evCardList[15];	--0ￎﾻﾴ￦ￍ￵ￅￆ,1ￎﾻﾱﾣ￁￴,ￆ￤ￋ￻ￎﾻﾰﾴￂ￟ﾼﾭￖﾵﾴ￦ﾷￅ
-- -- 	std::vector<BYTE> evColorList[4];	--ﾷﾽￃﾷﾺ￬ﾺￚ
-- -- 	BYTE bCardArray[13] = {0};
-- -- 	memcpy(bCardArray, cbCardData, sizeof(BYTE)*cbCardCount);
	
-- -- 	SortCardList(bCardArray, cbCardCount, enDescend);
	
-- -- 	--ﾷￖￎ￶ￆￋ﾿ￋ
-- -- 	for (int i = 0; i < cbCardCount; i++)
-- -- 	{
-- -- 		--ﾱﾣﾴ￦ￍ￵ￅￆ
-- -- 		if (bCardArray[i] == 0x41 || bCardArray[i] == 0x42)
-- -- 		{
-- -- 			evCardList[0].push_back(bCardArray[i]);
-- -- 			continue;
-- -- 		}
		
-- -- 		--ﾱﾣﾴ￦ￆ￤ￋ￻
-- -- 		BYTE bLogicNum = GetCardLogicValue(bCardArray[i]);
-- -- 		BYTE bColor = GetCardColor(bCardArray[i]);
		
-- -- 		assert(bLogicNum>1 && bLogicNum<15 && bColor>=0 && bColor<=3);
-- -- --            assert(evCardList[bLogicNum].Find(bCardArray[i]) == NULL);
		
-- -- 		evCardList[bLogicNum].push_back(bCardArray[i]);
-- -- 		evColorList[bColor].push_back(bCardArray[i]);
-- -- 	}
-- function GameLogic:IsStraight( cbCardData, cbCardCount, cbMaxCardData, bMaxCardCount, bNeedCCount )
-- 	assert(cbCardCount <= 13 or cbCardCount > 3)
-- 	local bKCount = 0
-- 	local evCardList
-- 	local evColorList
-- 	local bCardArray = cbCardData
-- 	GameLogic.SortCardList(bCardArray,cbCardCount,enDescend)
-- 	for i=1,cbCardCount do
-- 		if bCardArray[i] == 0x41 or bCardArray[i] == 0x42 then
-- 			table.insert(evCardList[1],bCardArray[i])
-- 		else
-- 			local bLogicNum = GameLogic.GetCardLogicValue(bCardArray[i])
-- 			local bColor = GameLogic.GetCardColor(bCardArray[i])
-- 			assert(bLogicNum > 1 and bLogicNum < 15 and bColor>=0 and bColor<=3)
-- 			table.insert(evCardList[bLogicNum],bCardArray[i])
-- 			table.insert(evColorList[bColor],bCardArray[i])
-- 		end
-- 	end
-- 	-- assert(evCardList[0].size() <= 2);
	
-- 	-- --￑ﾰￕￒￋﾳￗￓ
-- 	-- for (int i = 14; i > bNeedCCount-1; i--)
-- 	-- {
-- 	-- 	BYTE bHaveCard[5] = {0};
-- 	-- 	for (int k = 0; k < bNeedCCount-1; k++)
-- 	-- 		bHaveCard[k] = (evCardList[i-k].size()>0);
-- 	-- 	bHaveCard[bNeedCCount-1] = ( ((i == bNeedCCount)?evCardList[14].size():evCardList[i-bNeedCCount+1].size()) > 0 );
		
-- 	-- 	BYTE bCount = 0;
-- 	-- 	for (int m=0;m<bNeedCCount-1;m++)
-- 	-- 	{
-- 	-- 		bCount += (bHaveCard[m]?1:0) ;
-- 	-- 	}
-- 	assert(#evCardList[1]<=2)
-- 	for i=15,bNeedCCount-1 do
-- 		local bHaveCard
-- 		for k=1,bNeedCCount-1 do
-- 			bHaveCard[k] = (#evCardList[i-k+1] > 0)
-- 		end
-- 		bHaveCard[bNeedCCount] = (i == bNeedCCount+1 and #evCardList[15] or #evCardList[i-bNeedCCount+2] > 0)
-- 		local bCount = 0
-- 		for m=1,bNeedCCount do
-- 			bCount = bCount + (bHaveCard[m] and 1 or 0)
-- 		end
		
-- 		-- if (bCount + evCardList[0].size() >= bNeedCCount)
-- 		-- {
-- 		-- 	assert(bCount>=bNeedCCount-2&&bCount<=bNeedCCount);
-- 		-- 	int j = 0;
-- 		-- 	for (; j < bNeedCCount - bCount; j++)
-- 		-- 	{
-- 		-- 		cbMaxCardData[j] = evCardList[0].at(j);
-- 		-- 	}
-- 		-- 	for (int k = 0; k < bNeedCCount-1; k++)
-- 		-- 	{
-- 		-- 		if (bHaveCard[k])
-- 		-- 			cbMaxCardData[j++] = evCardList[i-k].front();
-- 		-- 	}
			
-- 		-- 	BYTE bFirstCardNum = ( (i == bNeedCCount)?14:i-bNeedCCount+1 );
-- 		-- 	if (bHaveCard[bNeedCCount-1])
-- 		-- 		cbMaxCardData[bNeedCCount-1] = evCardList[bFirstCardNum].front();
			
-- 		-- 	bMaxCardCount = bNeedCCount;
			
-- 		-- 	return true;
-- 		-- }

-- 		if bCount + #evCardList[1] >= bNeedCCount then
-- 			assert(bCount >= bNeedCCount - 2 and bCount <= bNeedCCount)
-- 			for j=1,bNeedCCount - bCount + 1 do
-- 				cbMaxCardData[j] = evCardList[1][j]
-- 			end
-- 			for k=1,bNeedCCount do
-- 				if bHaveCard[k] then
-- 					cbMaxCardData[j] = evCardList[i - k][1]
-- 				end
-- 			end

-- 			local bFirstCardNum  = (i == bNeedCCount and 14 or i-bNeedCCount+1)
-- 			if bHaveCard[bNeedCCount] then
-- 				cbMaxCardData[bNeedCCount] = evCardList[bFirstCardNum][1]
-- 			end

-- 			bMaxCardCount = bNeedCCount
-- 			return true
-- 		end
-- 	end

-- 	-- }
-- 	-- return false;
-- 	return false
-- end
-- -- }

-- -- BYTE CGameLogic::SelectTypeCard(BYTE cbType, BYTE ShootIndex[])
-- -- {
-- -- 	switch (cbType)
-- -- 	{
-- -- 	case 1: --duizi
-- -- 	{
-- -- 		for (BYTE i = 0; i < 40; ++i)
-- -- 		{
-- -- 			if (m_bType.bbOnePare[i] == false)
-- -- 			{
-- -- 				if (m_bType.cbOnePare[i * 2] == 0 && m_bType.cbOnePare[i * 2 + 1] == 0)
-- -- 				{
-- -- 					zeromemory(m_bType.bbOnePare, sizeof(m_bType.bbOnePare));
-- -- 					i = 0;
-- -- 				}
-- -- 				ShootIndex[0] = m_bType.cbOnePare[i * 2];
-- -- 				ShootIndex[1] = m_bType.cbOnePare[i * 2 + 1];
-- -- 				m_bType.bbOnePare[i] = true;
-- -- 				return 2;
-- -- 			}
-- -- 		}
-- -- 		return 0;
-- -- 	}
-- function GameLogic:SelectTypeCard( cbType, ShootIndex )
-- 	if cbType == 1 then
-- 		for i=1,40 do
-- 			if m_bType.bbOnePare[i] == false then
-- 				if m_bType.cbOnePare[(i-1)*2+1] == 0 and m_bType.cbOnePare[(i-1)*2+2] == 0 then
-- 					m_bType.bbOnePare = {}
-- 					i=1
-- 				end
-- 				ShootIndex[1] = m_bType.cbOnePare[(i-1)*2 + 1]
-- 				ShootIndex[2] = m_bType.cbOnePare[(i-1)*2 + 2]
-- 				m_bType.bbOnePare[i] = true
-- 				return 2
-- 			end
-- 		end
-- 		return 0

-- 	-- case 2: --liang dui
-- 	-- {
-- 	-- 	for (BYTE i = 0; i < 40; ++i)
-- 	-- 	{
-- 	-- 		if (m_bType.bbTwoPare[i] == false)
-- 	-- 		{
-- 	-- 			if (m_bType.cbTwoPare[i * 4] == 0 && m_bType.cbTwoPare[i * 4 + 1] == 0)
-- 	-- 			{
-- 	-- 				zeromemory(m_bType.bbTwoPare, sizeof(m_bType.bbTwoPare));
-- 	-- 				i = 0;
-- 	-- 			}
-- 	-- 			ShootIndex[0] = m_bType.cbTwoPare[i * 4];
-- 	-- 			ShootIndex[1] = m_bType.cbTwoPare[i * 4 + 1];
-- 	-- 			ShootIndex[2] = m_bType.cbTwoPare[i * 4 + 2];
-- 	-- 			ShootIndex[3] = m_bType.cbTwoPare[i * 4 + 3];
-- 	-- 			m_bType.bbTwoPare[i] = true;
-- 	-- 			return 4;
-- 	-- 		}
-- 	-- 	}
-- 	-- 	return 0;
-- 	-- }
-- 	elseif cbType == 2 then
-- 		for i=1,40 do
-- 			if m_bType.bbTwoPare[i] == false then
-- 				if m_bType.cbTwoPare[(i-1)*4 + 1] == 0 and m_bType.cbTwoPare[(i-1)*4 + 2] == 0 then
-- 					m_bType.bbTwoPare = {}
-- 					i = 1
-- 				end
-- 				ShootIndex[1] = m_bType.cbTwoPare[(i-1)*4 + 1]
-- 				ShootIndex[2] = m_bType.cbTwoPare[(i-1)*4 + 2]
-- 				ShootIndex[3] = m_bType.cbTwoPare[(i-1)*4 + 3]
-- 				ShootIndex[4] = m_bType.cbTwoPare[(i-1)*4 + 4]
-- 				m_bType.bbTwoPare = true
-- 				return 4
-- 			end
-- 		end
-- 		return 0

-- 	-- case 3: --san tiao
-- 	-- {
-- 	-- 	for (BYTE i = 0; i < 40; ++i)
-- 	-- 	{
-- 	-- 		if (m_bType.bbThreeSame[i] == false)
-- 	-- 		{
-- 	-- 			if (m_bType.cbThreeSame[i * 3] == 0 && m_bType.cbThreeSame[i * 3 + 1] == 0)
-- 	-- 			{
-- 	-- 				zeromemory(m_bType.bbThreeSame, sizeof(m_bType.bbThreeSame));
-- 	-- 				i = 0;
-- 	-- 			}
-- 	-- 			ShootIndex[0] = m_bType.cbThreeSame[i * 3];
-- 	-- 			ShootIndex[1] = m_bType.cbThreeSame[i * 3 + 1];
-- 	-- 			ShootIndex[2] = m_bType.cbThreeSame[i * 3 + 2];
-- 	-- 			m_bType.bbThreeSame[i] = true;
-- 	-- 			return 3;
-- 	-- 		}
-- 	-- 	}
-- 	-- 	return 0;
-- 	-- }
-- 	elseif cbType == 3 then
-- 		for i=1,40 do
-- 			if m_bType.bbThreeSame[i] == false then
-- 				if m_bType.cbThreeSame[(i-1)*3 + 1] == 0 and m_bType.cbThreeSame[(i-1)*3 + 2] == 0 then
-- 					m_bType.bbThreeSame = {}
-- 					i = 0
-- 				end
-- 				ShootIndex[1] = m_bType.cbThreeSame[(i-1)*3+1]
-- 				ShootIndex[2] = m_bType.cbThreeSame[(i-1)*3+2]
-- 				ShootIndex[3] = m_bType.cbThreeSame[(i-1)*3+3]
-- 				m_bType.bbThreeSame[i] = true
-- 				return 3
-- 			end
-- 		end
-- 		return 0

-- 	-- case 4: --shunzi
-- 	-- {
-- 	-- 	for (BYTE i = 0; i < 40; ++i)
-- 	-- 	{
-- 	-- 		if (m_bType.bbStraight[i] == false)
-- 	-- 		{
-- 	-- 			if (m_bType.cbStraight[i * 5] == 0 && m_bType.cbStraight[i * 5 + 1] == 0)
-- 	-- 			{
-- 	-- 				zeromemory(m_bType.bbStraight, sizeof(m_bType.bbStraight));
-- 	-- 				i = 0;
-- 	-- 			}
-- 	-- 			ShootIndex[0] = m_bType.cbStraight[i * 5];
-- 	-- 			ShootIndex[1] = m_bType.cbStraight[i * 5 + 1];
-- 	-- 			ShootIndex[2] = m_bType.cbStraight[i * 5 + 2];
-- 	-- 			ShootIndex[3] = m_bType.cbStraight[i * 5 + 3];
-- 	-- 			ShootIndex[4] = m_bType.cbStraight[i * 5 + 4];
-- 	-- 			m_bType.bbStraight[i] = true;
-- 	-- 			return 5;
-- 	-- 		}
-- 	-- 	}
-- 	-- 	return 0;
-- 	-- }
-- 	elseif cbType == 4 then
-- 		for i=1,40 do
-- 			if m_bType.bbStraight[i] == false then
-- 				if m_bType.cbStraight[(i-1)*5 + 1] == 0 and m_bType.cbStraight[(i-1)*3 + 2] == 0 then
-- 					m_bType.bbStraight = {}
-- 					i = 0
-- 				end
-- 				ShootIndex[1] = m_bType.cbStraight[(i-1)*5+1]
-- 				ShootIndex[2] = m_bType.cbStraight[(i-1)*5+2]
-- 				ShootIndex[3] = m_bType.cbStraight[(i-1)*5+3]
-- 				ShootIndex[4] = m_bType.cbStraight[(i-1)*5+4]
-- 				ShootIndex[5] = m_bType.cbStraight[(i-1)*5+5]
-- 				m_bType.bbThreeSame[i] = true
-- 				return 5
-- 			end
-- 		end
-- 		return 0
-- 	-- case 5: --tong hua
-- 	-- {
-- 	-- 	for (int i = 0; i < 200; ++i)
-- 	-- 	{
-- 	-- 		if (m_bType.bbFlush[i] == false)
-- 	-- 		{
-- 	-- 			if (m_bType.cbFlush[i * 5] == 0 && m_bType.cbFlush[i * 5 + 1] == 0)
-- 	-- 			{
-- 	-- 				zeromemory(m_bType.bbFlush, sizeof(m_bType.bbFlush));
-- 	-- 				i = 0;
-- 	-- 			}
-- 	-- 			ShootIndex[0] = m_bType.cbFlush[i * 5];
-- 	-- 			ShootIndex[1] = m_bType.cbFlush[i * 5 + 1];
-- 	-- 			ShootIndex[2] = m_bType.cbFlush[i * 5 + 2];
-- 	-- 			ShootIndex[3] = m_bType.cbFlush[i * 5 + 3];
-- 	-- 			ShootIndex[4] = m_bType.cbFlush[i * 5 + 4];
-- 	-- 			m_bType.bbFlush[i] = true;
-- 	-- 			return 5;
-- 	-- 		}
-- 	-- 	}
-- 	-- 	return 0;
-- 	-- }
-- 	elseif cbType == 5 then
-- 		for i=1,200 do
-- 			if m_bType.bbFlush[i] == false then
-- 				if m_bType.cbFlush[(i-1)*5 + 1] == 0 and m_bType.cbFlush[(i-1)*5 + 2] == 0 then
-- 					m_bType.bbFlush = {}
-- 					i = 0
-- 				end
-- 				ShootIndex[1] = m_bType.cbFlush[(i-1)*5+1]
-- 				ShootIndex[2] = m_bType.cbFlush[(i-1)*5+2]
-- 				ShootIndex[3] = m_bType.cbFlush[(i-1)*5+3]
-- 				ShootIndex[4] = m_bType.cbFlush[(i-1)*5+4]
-- 				ShootIndex[5] = m_bType.cbFlush[(i-1)*5+5]
-- 				m_bType.bbFlush[i] = true
-- 				return 5
-- 			end
-- 		end
-- 		return 0

-- 	-- case 6: --hulu
-- 	-- {
-- 	-- 	for (BYTE i = 0; i < 40; ++i)
-- 	-- 	{
-- 	-- 		if (m_bType.bbGourd[i] == false)
-- 	-- 		{
-- 	-- 			if (m_bType.cbGourd[i * 5] == 0 && m_bType.cbGourd[i * 5 + 1] == 0)
-- 	-- 			{
-- 	-- 				zeromemory(m_bType.bbGourd, sizeof(m_bType.bbGourd));
-- 	-- 				i = 0;
-- 	-- 			}
-- 	-- 			ShootIndex[0] = m_bType.cbGourd[i * 5];
-- 	-- 			ShootIndex[1] = m_bType.cbGourd[i * 5 + 1];
-- 	-- 			ShootIndex[2] = m_bType.cbGourd[i * 5 + 2];
-- 	-- 			ShootIndex[3] = m_bType.cbGourd[i * 5 + 3];
-- 	-- 			ShootIndex[4] = m_bType.cbGourd[i * 5 + 4];
-- 	-- 			m_bType.bbGourd[i] = true;
-- 	-- 			return 5;
-- 	-- 		}
-- 	-- 	}
-- 	-- 	return 0;
-- 	-- }
-- 	elseif cbType == 6 then
-- 		for i=1,40 do
-- 			if m_bType.bbGourd[i] == false then
-- 				if m_bType.cbGourd[(i-1)*5 + 1] == 0 and m_bType.cbGourd[(i-1)*5 + 2] == 0 then
-- 					m_bType.bbGourd = {}
-- 					i = 0
-- 				end
-- 				ShootIndex[1] = m_bType.cbGourd[(i-1)*5+1]
-- 				ShootIndex[2] = m_bType.cbGourd[(i-1)*5+2]
-- 				ShootIndex[3] = m_bType.cbGourd[(i-1)*5+3]
-- 				ShootIndex[4] = m_bType.cbGourd[(i-1)*5+4]
-- 				ShootIndex[5] = m_bType.cbGourd[(i-1)*5+5]
-- 				m_bType.bbGourd[i] = true
-- 				return 5
-- 			end
-- 		end
-- 		return 0

-- 	-- case 7: --zhadan
-- 	-- {
-- 	-- 	for (BYTE i = 0; i < 40; ++i)
-- 	-- 	{
-- 	-- 		if (m_bType.bbFourSame[i] == false)
-- 	-- 		{
-- 	-- 			if (m_bType.cbFourSame[i * 4] == 0 && m_bType.cbFourSame[i * 4 + 1] == 0)
-- 	-- 			{
-- 	-- 				zeromemory(m_bType.bbFourSame, sizeof(m_bType.bbFourSame));
-- 	-- 				i = 0;
-- 	-- 			}
-- 	-- 			ShootIndex[0] = m_bType.cbFourSame[i * 4];
-- 	-- 			ShootIndex[1] = m_bType.cbFourSame[i * 4 + 1];
-- 	-- 			ShootIndex[2] = m_bType.cbFourSame[i * 4 + 2];
-- 	-- 			ShootIndex[3] = m_bType.cbFourSame[i * 4 + 3];
-- 	-- 			m_bType.bbFourSame[i] = true;
-- 	-- 			return 4;
-- 	-- 		}
-- 	-- 	}
-- 	-- 	return 0;
-- 	-- }
-- 	elseif cbType == 7 then
-- 		for i=1,40 do
-- 			if m_bType.bbFourSame[i] == false then
-- 				if m_bType.cbFourSame[(i-1)*4 + 1] == 0 and m_bType.cbFourSame[(i-1)*4 + 2] == 0 then
-- 					m_bType.bbFourSame = {}
-- 					i = 0
-- 				end
-- 				ShootIndex[1] = m_bType.cbFourSame[(i-1)*4+1]
-- 				ShootIndex[2] = m_bType.cbFourSame[(i-1)*4+2]
-- 				ShootIndex[3] = m_bType.cbFourSame[(i-1)*4+3]
-- 				ShootIndex[4] = m_bType.cbFourSame[(i-1)*4+4]
-- 				m_bType.bbFourSame[i] = true
-- 				return 4
-- 			end
-- 		end
-- 		return 0


-- 	-- case 8: --tonghuashun
-- 	-- {
-- 	-- 	for (BYTE i = 0; i < 40; ++i)
-- 	-- 	{
-- 	-- 		if (m_bType.bbStraightFlush[i] == false)
-- 	-- 		{
-- 	-- 			if (m_bType.cbStraightFlush[i * 5] == 0 && m_bType.cbStraightFlush[i * 5 + 1] == 0)
-- 	-- 			{
-- 	-- 				zeromemory(m_bType.bbStraightFlush, sizeof(m_bType.bbStraightFlush));
-- 	-- 				i = 0;
-- 	-- 			}
-- 	-- 			ShootIndex[0] = m_bType.cbStraightFlush[i * 5];
-- 	-- 			ShootIndex[1] = m_bType.cbStraightFlush[i * 5 + 1];
-- 	-- 			ShootIndex[2] = m_bType.cbStraightFlush[i * 5 + 2];
-- 	-- 			ShootIndex[3] = m_bType.cbStraightFlush[i * 5 + 3];
-- 	-- 			ShootIndex[4] = m_bType.cbStraightFlush[i * 5 + 4];
-- 	-- 			m_bType.bbStraightFlush[i] = true;
-- 	-- 			return 5;
-- 	-- 		}
-- 	-- 	}
-- 	-- 	return 0;
-- 	-- }
-- 	elseif cbType == 8 then
-- 		for i=1,40 do
-- 			if m_bType.bbStraightFlush[i] == false then
-- 				if m_bType.cbStraightFlush[(i-1)*5 + 1] == 0 and m_bType.cbStraightFlush[(i-1)*5 + 2] == 0 then
-- 					m_bType.bbStraightFlush = {}
-- 					i = 0
-- 				end
-- 				ShootIndex[1] = m_bType.cbStraightFlush[(i-1)*5+1]
-- 				ShootIndex[2] = m_bType.cbStraightFlush[(i-1)*5+2]
-- 				ShootIndex[3] = m_bType.cbStraightFlush[(i-1)*5+3]
-- 				ShootIndex[4] = m_bType.cbStraightFlush[(i-1)*5+4]
-- 				ShootIndex[5] = m_bType.cbStraightFlush[(i-1)*5+5]
-- 				m_bType.bbStraightFlush[i] = true
-- 				return 5
-- 			end
-- 		end
-- 		return 0

-- 	-- case 9: --
-- 	-- {
-- 	-- 	for (BYTE i = 0; i < 40; ++i)
-- 	-- 	{
-- 	-- 		if (m_bType.bbFiveSame[i] == false)
-- 	-- 		{
-- 	-- 			if (m_bType.cbFiveSame[i * 5] == 0 && m_bType.cbFiveSame[i * 5 + 1] == 0)
-- 	-- 			{
-- 	-- 				zeromemory(m_bType.bbFiveSame, sizeof(m_bType.bbFiveSame));
-- 	-- 				i = 0;
-- 	-- 			}
-- 	-- 			ShootIndex[0] = m_bType.cbFiveSame[i * 5];
-- 	-- 			ShootIndex[1] = m_bType.cbFiveSame[i * 5 + 1];
-- 	-- 			ShootIndex[2] = m_bType.cbFiveSame[i * 5 + 2];
-- 	-- 			ShootIndex[3] = m_bType.cbFiveSame[i * 5 + 3];
-- 	-- 			ShootIndex[4] = m_bType.cbFiveSame[i * 5 + 4];
-- 	-- 			m_bType.bbFiveSame[i] = true;
-- 	-- 			return 5;
-- 	-- 		}
-- 	-- 	}
-- 	-- 	return 0;
-- 	-- }
-- 	elseif cbType == 9 then
-- 		for i=1,40 do
-- 			if m_bType.bbFiveSame[i] == false then
-- 				if m_bType.cbFiveSame[(i-1)*5 + 1] == 0 and m_bType.cbFiveSame[(i-1)*5 + 2] == 0 then
-- 					m_bType.bbFiveSame = {}
-- 					i = 0
-- 				end
-- 				ShootIndex[1] = m_bType.cbFiveSame[(i-1)*5+1]
-- 				ShootIndex[2] = m_bType.cbFiveSame[(i-1)*5+2]
-- 				ShootIndex[3] = m_bType.cbFiveSame[(i-1)*5+3]
-- 				ShootIndex[4] = m_bType.cbFiveSame[(i-1)*5+4]
-- 				ShootIndex[5] = m_bType.cbFiveSame[(i-1)*5+5]
-- 				m_bType.bbFiveSame[i] = true
-- 				return 5
-- 			end
-- 		end
-- 		return 0
-- 	else
-- 		return 0
-- 	end
-- 	-- default:
-- 	-- {
-- 	-- 	return 0;
-- 	-- }
-- 	-- }
-- 	return 0
-- end
-- 	return 0;
-- }
-- function  GameLogic:AnalyseCardNew(bCardData, bCardCount, AnalyseData)
-- {
-- 	--排列扑克
-- 	local CardData = clone(bCardData)
-- 	self:SortCardList(CardData , bCardCount , CGameLogic.enDescend) 

-- 	--变量定义
-- 	local bSameCount = 1, bCardValueTemp = 0, bSameColorCount = 0, bFirstCardIndex = 0;	

-- 	--ASSERT(3==bCardCount || 5==bCardCount||13==bCardCount) ;

-- 	--设置结果
-- 	--memset(&AnalyseData, 0, sizeof(AnalyseData));

-- 	local byIndexNoGui = bCardCount;
-- 	for (BYTE i=0; i<bCardCount; i++)
-- 	{
-- 		if (GetCardLogicValue(bCardData[i]) >= CARD_XW)
-- 		{
-- 			AnalyseData.byGuiCout++;
-- 		}
-- 		else
-- 		{
-- 			byIndexNoGui = i;
-- 			break;
-- 		}
-- 	}
-- 	if (byIndexNoGui == bCardCount)
-- 	{--全鬼
-- 		AnalyseData.byQuanGuiFlag = TRUE;
-- 		AnalyseData.bStraight = true ;
-- 		switch (bCardCount)
-- 		{
-- 		case 3:
-- 			{
-- 				bCardData[bFirstCardIndex] =  Card_Hong_1;
-- 				AnalyseData.bThreeFirst[AnalyseData.bThreeCount] = bFirstCardIndex;
-- 				AnalyseData.bThreeCount++;
-- 				break;
-- 			}
-- 		case 5:
-- 			{
-- 				bCardData[bFirstCardIndex] =  Card_Hong_1;
-- 				AnalyseData.bFiveFirst[AnalyseData.bFiveCount] = bFirstCardIndex;
-- 				AnalyseData.bFiveCount ++;
-- 				break;
-- 			}
-- 		case 13:
-- 			{
-- 				return;
-- 			}
-- 		}
-- 		return;
-- 	}

-- 	bSameColorCount = 1;
-- 	bFirstCardIndex = byIndexNoGui;
-- 	BYTE byHaveFlag = 0;
-- 	if (byIndexNoGui+1 >= bCardCount)
-- 	{
-- 		AnalyseData.bOneFirst[AnalyseData.bOneCount] = bFirstCardIndex;
-- 		AnalyseData.bOneCount++;
-- 		byHaveFlag = 1;
-- 	}
-- 	else
-- 	{
-- 		BYTE bLogicValue = GetCardLogicValue(bCardData[byIndexNoGui]);
-- 		BYTE bCardColor = GetCardColor(bCardData[byIndexNoGui]);
-- 		--扑克分析
-- 		for (BYTE i = byIndexNoGui+1; i<bCardCount; i++)
-- 		{
-- 			--获取扑克
-- 			bCardValueTemp = GetCardLogicValue(bCardData[i]);

-- 			if (bCardValueTemp == bLogicValue) bSameCount++;

-- 			--保存结果
-- 			if ((bCardValueTemp != bLogicValue) || (i == (bCardCount - 1)))
-- 			{
-- 				if (bSameCount > byHaveFlag)
-- 				{
-- 					byHaveFlag = bSameCount;
-- 				}
-- 				switch (bSameCount)
-- 				{
-- 				case 1:
-- 					break;
-- 				case 2:
-- 					{
-- 						AnalyseData.bTwoFirst[AnalyseData.bTwoCount] = bFirstCardIndex;
-- 						AnalyseData.bTwoCount++;
-- 						break;
-- 					}
-- 				case 3:
-- 					{
-- 						AnalyseData.bThreeFirst[AnalyseData.bThreeCount] = bFirstCardIndex;
-- 						AnalyseData.bThreeCount++;
-- 						break;
-- 					}
-- 				case 4:
-- 					{
-- 						AnalyseData.bFourFirst[AnalyseData.bFourCount] = bFirstCardIndex;
-- 						AnalyseData.bFourCount++;
-- 						break;
-- 					}
-- 				case 5:
-- 					{
-- 						AnalyseData.bFiveFirst[AnalyseData.bFiveCount] = bFirstCardIndex;
-- 						AnalyseData.bFiveCount++;
-- 						break;
-- 					}
-- 				case 6:
-- 					{
-- 						AnalyseData.bSixFirst[AnalyseData.bSixCount] = bFirstCardIndex;
-- 						AnalyseData.bSixCount++;
-- 						break;
-- 					}
-- 				case 7:
-- 					{
-- 						AnalyseData.bSevenFirst[AnalyseData.bSevenCount] = bFirstCardIndex;
-- 						AnalyseData.bSevenCount++;
-- 						break;
-- 					}
-- 				case 8:
-- 					{
-- 						AnalyseData.bEightFirst[AnalyseData.bEightCount] = bFirstCardIndex;
-- 						AnalyseData.bEightCount++;
-- 						break;
-- 					}
-- 				}
-- 			}

-- 			if (bCardValueTemp != bLogicValue)
-- 			{
-- 				if (bSameCount == 1)
-- 				{
-- 					if (i != bCardCount - 1)
-- 					{
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = bFirstCardIndex;
-- 						AnalyseData.bOneCount++;
-- 					}
-- 					else
-- 					{
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = bFirstCardIndex;
-- 						AnalyseData.bOneCount++;
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = i;
-- 						AnalyseData.bOneCount++;
-- 					}
-- 				}
-- 				else
-- 				{
-- 					if (i == bCardCount - 1)
-- 					{
-- 						AnalyseData.bOneFirst[AnalyseData.bOneCount] = i;
-- 						AnalyseData.bOneCount++;
-- 					}
-- 				}
-- 				bSameCount = 1;
-- 				bLogicValue = bCardValueTemp;
-- 				bFirstCardIndex = i;
-- 			}
-- 			if (GetCardColor(bCardData[i]) != bCardColor) bSameColorCount = 1;
-- 			else                                       ++bSameColorCount;
-- 		}
-- 	}
	
-- 	AnalyseData.bStraight = ((bCardCount - AnalyseData.byGuiCout) == bSameColorCount) ? true : false;

-- 	if (AnalyseData.byGuiCout == 0)
-- 	{
-- 		return ;
-- 	}
-- 	switch (bCardCount)
-- 	{
-- 	case 3:  
-- 	case 5:  
-- 		{
-- 			AnalyseCardNew_step2(byHaveFlag,AnalyseData);
-- 			return;
-- 		}
-- 	case 13:
-- 		{
-- 			return;
-- 		}
-- 	}
-- 	return;
-- }


-- void CGameLogic::AnalyseCardNew_step2(BYTE byHaveFlag, tagAnalyseData& AnalyseData)
-- {
-- 	switch(byHaveFlag)
-- 	{
-- 	case 1:
-- 		{
-- 			if (AnalyseCardNew_step3(byHaveFlag+AnalyseData.byGuiCout,AnalyseData.bOneFirst[0], AnalyseData))
-- 			{
-- 				for (BYTE i=1;i<=AnalyseData.bOneCount;i++)
-- 				{
-- 					AnalyseData.bOneFirst[i-1] = AnalyseData.bOneFirst[i];
-- 				}
-- 				AnalyseData.bOneCount--;
-- 			}

-- 			break;
-- 		}
-- 	case 2:
-- 		{
-- 			if (AnalyseCardNew_step3(byHaveFlag+AnalyseData.byGuiCout,AnalyseData.bTwoFirst[0], AnalyseData))
-- 			{
-- 				for (BYTE i=1;i<=AnalyseData.bTwoCount;i++)
-- 				{
-- 					AnalyseData.bTwoFirst[i-1] = AnalyseData.bTwoFirst[i];
-- 				}
-- 				AnalyseData.bTwoCount--;
-- 			}
-- 			break;
-- 		}
-- 	case 3:
-- 		{
-- 			if (AnalyseCardNew_step3(byHaveFlag+AnalyseData.byGuiCout,AnalyseData.bThreeFirst[0], AnalyseData))
-- 			{
-- 				for (BYTE i=1;i<=AnalyseData.bThreeCount;i++)
-- 				{
-- 					AnalyseData.bThreeFirst[i-1] = AnalyseData.bThreeFirst[i];
-- 				}
-- 				AnalyseData.bThreeCount--;
-- 			}
-- 			break;
-- 		}
-- 	case 4:
-- 		{
-- 			if (AnalyseCardNew_step3(byHaveFlag+AnalyseData.byGuiCout,AnalyseData.bFourFirst[0], AnalyseData))
-- 			{
-- 				for (BYTE i=1;i<=AnalyseData.bFourCount;i++)
-- 				{
-- 					AnalyseData.bFourFirst[i-1] = AnalyseData.bFourFirst[i];
-- 				}
-- 				AnalyseData.bFourCount--;
-- 			}
-- 			break;
-- 		}
-- 	}
-- }
-- BYTE CGameLogic::AnalyseCardNew_step3(BYTE byHaveFlag,BYTE byIndex, tagAnalyseData& AnalyseData)
-- {
-- 	switch(byHaveFlag)
-- 	{
-- 	case 2:
-- 		{
-- 			AnalyseData.bTwoFirst[AnalyseData.bTwoCount] = byIndex;
-- 			AnalyseData.bTwoCount++;
-- 			return TRUE;
-- 		}
-- 	case 3:
-- 		{
-- 			AnalyseData.bThreeFirst[AnalyseData.bThreeCount] = byIndex;
-- 			AnalyseData.bThreeCount++;
-- 			return TRUE;
-- 		}
-- 	case 4:
-- 		{
-- 			AnalyseData.bFourFirst[AnalyseData.bFourCount] = byIndex;
-- 			AnalyseData.bFourCount++;
-- 			return TRUE;
-- 		}
-- 	case 5:
-- 		{
-- 			AnalyseData.bFiveFirst[AnalyseData.bFiveCount] = byIndex;
-- 			AnalyseData.bFiveCount++;
-- 			return TRUE;
-- 		}
-- 	}
-- 	return FALSE;
-- }
for i=1,3 do
	print("hello2 world"..i)
end
print("hello2 world")
--return GameLogic


