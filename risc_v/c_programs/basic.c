int foo(int a, int b)
{
	if(a > b)
		return a + b;
	else 
		return a - b;
}

int bar_1(int a, int b)
{
	return foo(a, b) * 2;
}

int main()
{
	foo(1, 2);
	return 0;
}
