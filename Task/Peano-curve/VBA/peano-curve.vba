Const WIDTH = 243 'a power of 3 for a evenly spaced curve
Dim n As Long
Dim points() As Single
Dim flag As Boolean
'Store the coordinate pairs (x, y) generated by Peano into
'a SafeArrayOfPoints with lineto. The number of points
'generated depend on WIDTH. Peano is called twice. Once
'to count the number of points, and twice to generate
'the points after the dynamic array has been
'redimensionalised.
'VBA doesn't have a lineto method. Instead of AddLine, which
'requires four parameters, including the begin pair of
'coordinates, the method AddPolyline is used, which is
'called from main after all the points are generated.
'This creates a single object, whereas AddLine would
'create thousands of small unconnected line objects.
Private Sub lineto(x As Integer, y As Integer)
    If flag Then
        points(n, 1) = x
        points(n, 2) = y
    End If
    n = n + 1
End Sub
Private Sub Peano(ByVal x As Integer, ByVal y As Integer, ByVal lg As Integer, _
    ByVal i1 As Integer, ByVal i2 As Integer)
    If (lg = 1) Then
        Call lineto(x * 3, y * 3)
        Exit Sub
    End If
    lg = lg / 3
    Call Peano(x + (2 * i1 * lg), y + (2 * i1 * lg), lg, i1, i2)
    Call Peano(x + ((i1 - i2 + 1) * lg), y + ((i1 + i2) * lg), lg, i1, 1 - i2)
    Call Peano(x + lg, y + lg, lg, i1, 1 - i2)
    Call Peano(x + ((i1 + i2) * lg), y + ((i1 - i2 + 1) * lg), lg, 1 - i1, 1 - i2)
    Call Peano(x + (2 * i2 * lg), y + (2 * (1 - i2) * lg), lg, i1, i2)
    Call Peano(x + ((1 + i2 - i1) * lg), y + ((2 - i1 - i2) * lg), lg, i1, i2)
    Call Peano(x + (2 * (1 - i1) * lg), y + (2 * (1 - i1) * lg), lg, i1, i2)
    Call Peano(x + ((2 - i1 - i2) * lg), y + ((1 + i2 - i1) * lg), lg, 1 - i1, i2)
    Call Peano(x + (2 * (1 - i2) * lg), y + (2 * i2 * lg), lg, 1 - i1, i2)
End Sub
Sub main()
    n = 1: flag = False
    Call Peano(0, 0, WIDTH, 0, 0) 'Start Peano recursion to count number of points
    ReDim points(1 To n - 1, 1 To 2)
    n = 1: flag = True
    Call Peano(0, 0, WIDTH, 0, 0) 'Start Peano recursion to generate and store points
    ActiveSheet.Shapes.AddPolyline points 'Excel assumed
End Sub