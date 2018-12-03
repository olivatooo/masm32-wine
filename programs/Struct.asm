include libs/Irvine32.inc

Coord STRUCT 
	X word ? 
	Y word ? 
Coord ENDS 
Triangle STRUCT 
	Vertex1 COORD <> 
	Vertex2 COORD <> 
	Vertex3 COORD <> 
Triangle ENDS 

.data
	a Triangle 100 dup (<<0,0>,,>)
.code


main PROC

	exit
main ENDP
END main
