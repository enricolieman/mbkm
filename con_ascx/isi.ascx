<!-- #INCLUDE file ="conlintar2022.ascx" -->
<script runat="server">
  dim F_Val as boolean

  sub page_load ( o as object, e as eventargs)
	  if not page.ispostback then
         txtuserid.Attributes.Add("autocomplete", "off") 
	  end if 
  end sub

  sub btnsubmit_click(obj as object, e as eventargs)
	  if validasi = False Then
	     exit sub
	  end if
	  Session("idlintar") = trim(txtuserid.text)
	  response.redirect("utama.aspx")
  end sub

  Function validasi() as Boolean
      Dim F_val as Boolean
      F_val = True
	  
     labelerr.text = "Login gagal, ada kesalahan user id dan/atau Password."
	  if isnumeric(txtuserid.text) = false then
         F_val = False
	  end if 
 	  
	  qry="SELECT nik_bag,nik_thn,nik_urut,nama,passwd,nikgabung " & _
          "FROM tkarya " & _
          "WHERE (nikgabung ='" & txtuserid.text & "') " 
      isidata(qry,"rsckuser")
	  tutup()
	  if dtlist.rows.count <> 0 Then
         if dtlist.rows(0)("passwd") = txtpasswd.text Then
		    F_val = true
	        labelerr.text = ""
	     Else
		    F_val = False    
		 End if
	  else
         F_val = False
	  end if
	  dtlist.clear

      Return F_val  
  End Function
    
    function valid(str as string) as boolean
       dim i as integer
       dim c as integer
       
       for i = 1 to len(str)
           c = asc(mid(str,i,1))
           if c=60 or c=62 or c=33 then
              return false
           end if
           
           if (c >= 65 and c <= 90) or (c >= 97 and c <= 122) or (c >= 48 and c <= 57) then
           else
              return false
           end if    
       next i
       return true
    end function

</script>

    <div id="isi">
	  <center>
	  <div class="isi_login_ppn">
	     <br>
         <form runat="server">  
		 <table align="center"  border="0" width="50%">
		    <tr align="left">
			   <td colspan="3" align="center"><b>LOGIN SISTEM</b></td>
			</tr>
		    <tr align="right">
			   <td width="170px"><b>User ID</b></td>
			   <td align="center" width="10px"><b>:</b></td>
			   <td align="left" width="170px"> 
                  <asp:textbox id="txtUserid" runat="server" width="100px" MaxLength="10" BorderStyle="Solid" BorderColor="#000000"></asp:textbox></td>
			   </tr>
		    <tr align="right">
			   <td width="170px"><b>Password</b></td>
			   <td align="center" width="10px"><b>:</b></td>
			   <td align="left" width="170px"> 
                 <asp:textbox id="txtpasswd" runat="server" width="100px" textmode="password" MaxLength="10" BorderStyle="Solid" BorderColor="#000000" >
                 </asp:textbox>
               </td>
			</tr>
		    <tr align="center">
			   <td colspan="3" style="padding-top:5px;">
                <asp:button id="btnsubmit" onclick="btnsubmit_click" runat="server" text="Login"></asp:button></td>
			</tr>
		    <tr align="center">
			   <td colspan="3"><asp:Label id="labelerr" runat="server"  Text="" forecolor="Red"></asp:Label></td>
			</tr>
		 </table>
         </form>
	  </div>
      </center>
	</div>
