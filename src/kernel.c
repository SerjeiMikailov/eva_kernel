
/*
*
*   Eva project
*
*/

#define WHITE_TXT 0x07 

void k_clear_screen();
unsigned int k_printf(char *message, unsigned int line);

void k_main() 
{
	k_clear_screen();

	k_printf("----------------", 0);
	k_printf("-              -", 1);
	k_printf("-  Eva Kernel  -", 2);
	k_printf("-              -", 3);
	k_printf("----------------", 4);

	k_printf("Project EVA V1.1", 6);
}

void k_clear_screen()
{
	char *vidmem = (char *) 0xb8000;
	unsigned int i=0;
	while(i < (80*25*2))
	{
		vidmem[i]=' ';
		i++;
		vidmem[i]=WHITE_TXT;
		i++;
	}
}

unsigned int k_printf(char *message, unsigned int line)
{
	char *vidmem = (char *) 0xb8000;
	unsigned int i=0;

	i=(line*80*2);

	while(*message!=0)
	{
		if(*message=='\n')
		{
			line++;
			i=(line*80*2);
			message++;
		} else {
			vidmem[i]=*message;
			message++;
			i++;
			vidmem[i]=WHITE_TXT;
			i++;
		};
	};

	return(1);
}
