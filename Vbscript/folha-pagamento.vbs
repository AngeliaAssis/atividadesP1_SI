salMin = 1621

qtdSalarios = CDbl(InputBox("Digite a quantidade de salarios:"))

salBruto = qtdSalarios * salMin

If salBruto <= 1621 Then
    inss = salBruto * 0.075
ElseIf salBruto <= 2902.84 Then
    inss = salBruto * 0.09
ElseIf salBruto <= 4354.27 Then
    inss = salBruto * 0.12
Else
    inss = salBruto * 0.14
End If

salLiquido = salBruto - inss

MsgBox "Salario Bruto: R$ " & salBruto & vbCrLf & _
       "INSS: R$ " & inss & vbCrLf & _
       "Salario Liquido: R$ " & salLiquido