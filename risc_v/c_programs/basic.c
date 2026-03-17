int foo(int a, int b)
{
	if(a < b)
		return a + b;
	else
		return a - b;
}

int main()
{
	foo(1, 2);
	return 0;
}
