#pragma once


enum
{
};


#pragma pack(push,1)

#pragma pack(pop)

class CEmpty
{
public:
	CEmpty();
	CEmpty(const CEmpty& rhs);

	~CEmpty(void);
	
	CEmpty& operator=(const CEmpty& rhs);

	CEmpty* operator&();
	const CEmpty* operator&() const;
private:
		
};
