# main.s
* -4 = result
* -8 = buffer
* -12 = i (итерируемая переменная)
* -24 = start_time
* -34 = end_time
* -100032 = string
* -100036 = input type
* -100052 = argc
* -100064 = argv <br/>

# fillStringManual.s
* -4 = buffer
* -24 = указатель на array <br/>

# fillStringFile.s
* -4 = buffer
* -16 = input
* -24 = указатель на array
* -32 = inputFile <br/>

# generation.c
* -4 = index (итерируемая переменная)
* -8 = buffer
* -52 = seed
* -48 = указатель на set
* -72 = указатель на array <br/>

# function.s
* -4 = index
* -8 = counter
* -24 = указатель на array
* -28 = buffer <br/>

# writeStringFile.s
* -8 = output
* -20 = result
* -32 = outputFile 
