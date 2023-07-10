
OUTPUT_FORMAT(elf32-i386)
ENTRY(start)
SECTIONS
{
	. = 0x100000; /* start mem adress = 1mb */
	.text : {*(.text)} 
	.data : {*(.data)}
	.bss  : {*(.bss)} /* uninitialized data */
}