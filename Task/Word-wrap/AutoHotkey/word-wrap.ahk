MsgBox, % "72`n" WrapText(Clipboard, 72) "`n`n80`n" WrapText(Clipboard, 80)
return

WrapText(Text, LineLength) {
    StringReplace, Text, Text, `r`n, %A_Space%, All
    while (p := RegExMatch(Text, "(.{1," LineLength "})(\s|\R+|$)", Match, p ? p + StrLen(Match) : 1))
        Result .= Match1 ((Match2 = A_Space || Match2 = A_Tab) ? "`n" : Match2)
    return, Result
}
