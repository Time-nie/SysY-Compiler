const float k=2.0;
float a=2.0,b=20.0; 
int c[3]={1,2,3};  
float func(int d)
{
	c[1]=a*d;
	c[2]=c[0]%d;
	return -k+c[1]+c[2];
}
int main()
{
	int i,d;
	i=0;        
	d=getint();      //调用SysY库函数getint()
	while(i<10)      
	{
		a=a+3;
		if(b/a==0&&a>21)   
		{
			break;
		}
		i=i+1;			
	}
	putint(func(d));     //调用SysY库函数putint(int)
	return 0;
}
