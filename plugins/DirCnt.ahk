/*
 Author:        majkinetor
 Version:       1.0
 Description:   Calculates file number in the directory. Can not show real time preview.
 Usage:         DirCnt.N
                N - Number of decimal places.
 */
DirCnt: 
    #Res := DirCnt(#3)
return

DirCnt_GetFields:
    #Res = *
return


DirCnt(No) {
    global
    static c
    
    if (#flag = "prev")     ;Disable real time preview. There is no way to know file number before iterating preceding list.
       return "###"

    if (#no = 1)
        c := Object()
    
    if !IsObject(c[#fd])
         c[#fd] := Object("cnt", 1)
    else c[#fd].cnt := c[#fd].cnt + 1

    res := c[#fd].cnt
    if (x := No-StrLen(c[#fd].cnt)) > 0
        res := SubStr("0000000000000000", 1, x) res

    return res
}