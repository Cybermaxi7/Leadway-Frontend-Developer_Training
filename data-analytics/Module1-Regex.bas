Attribute VB_Name = "Module1"
Sub SeparateNamesAndNumbers(dataRange As Range)

  Dim regex As Object
  Dim cell As Range

  ' Create a regular expression object
  Set regex = CreateObject("VBScript.RegExp")
  regex.Pattern = "(\w+)([0-9]+)" ' Pattern to capture name and number

  ' Loop through each cell in the data range
  For Each cell In dataRange
    Set Match = regex.Execute(cell.Value)  ' Attempt to match the pattern

    ' Check if there's a match
    If Match.Count > 0 Then
      ' Extract the name and number
      cell.Value = Match(0)  ' Place the entire matched string in the current cell (initially)
      cell.Offset(0, 1).Value = Match(1)  ' Place the number in the cell to the right
      ' Clear the original matched string (optional for a cleaner output)
      cell.Value = ""  ' Uncomment this line if you want only names in the original column
    Else
      ' Handle no match case (optional: leave cells blank or enter an error message)
      ' cell.Value = "No match" ' Example for handling no match
    End If
  Next cell

  ' Clean up
  Set regex = Nothing

End Sub

