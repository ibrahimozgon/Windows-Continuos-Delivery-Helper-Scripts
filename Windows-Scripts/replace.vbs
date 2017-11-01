' We use this for replacing development config file values with production values.'
'1 value to be changed'
'2 future value' 
Const ForReading = 1

Const ForWriting = 2

strFileName = Wscript.Arguments(0)

strOldText = Wscript.Arguments(1)

strNewText = Wscript.Arguments(2)

strNewFileName = Wscript.Arguments(3)


Set objFSO = CreateObject("Scripting.FileSystemObject")

Set objFile = objFSO.OpenTextFile(strFileName, ForReading)


strText = objFile.ReadAll

objFile.Close

strNewText = Replace(strText, strOldText, strNewText)


Set objFile = objFSO.CreateTextFile(strNewFileName, ForWriting)

objFile.WriteLine strNewText

objFile.Close