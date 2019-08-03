<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath() %>/resources/css/memberDrop.css">
</head>
<body>


<div class="main-container">
   <p class="top_txt">회원 탈퇴</p>
   <hr id="hrBar">
   <div class="c_header">
      <h2 id="top_info">탈퇴 안내</h2>
      <p class="contxt">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요</p>
   </div>
   <div class="del_section">
      <h2 class="h_dropout">사용하고 계신 아이디(<em>${member.id }</em>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</h2>
      <p class="dropout_dsc"><em>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</em>하오니 신중하게 선택하시기 바랍니다.</p>
      
      <h3 class="h_dropout" style="margin-top:52px;">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h3>
      <p class="dropout_dsc">회원정보 및 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
                        삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p>
                        
                        
      <table cellspacing="0" border="1" class="tbl_type">
      <colgroup>
         <col width="145"><col width="*">
      </colgroup>
      
      <tbody id="tblBullet1"> 
      <tr style="display: table-row;">
         <th scope="row">회원정보</th>
         <td>회원가입시 등록되어있던 회원정보 삭제</td>
      </tr>
      
      <tr style="display: table-row;">
         <th scope="row">이용내용</th>
         <td>이용기록 삭제</td>
      </tr>

        <tr style="display: table-row;">
            <th scope="row">쇼핑</th>
            <td>쇼핑 이용내역 삭제</td>
        </tr>
         <tr style="display: table-row;">
         <th scope="row">호텔</th>
         <td>호텔 이용내역 삭제</td>
      </tr>
      </tbody>
      </table>   
      
      <h3 class="h_dropout" style="margin-top:52px;">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h3>
      <p class="dropout_dsc">
         게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다. <br>
         삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다. <br>
         탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
      </p>      
      
      
      <table cellspacing="0" border="1" class="tbl_type">
      <colgroup>
         <col width="145"><col width="*">
      </colgroup>
      <tbody id="tblBullet2"> 
      <tr style="display: table-row;">
         <th scope="row">축제후기</th>
         <td>게시물 및 댓글</td>
      </tr>
      <tr style="display: table-row;">
         <th scope="row">축제</th>
         <td>댓글</td>
      </tr>
      <tr style="display: none;">
         <th scope="row">자유게시판, 미팅</th>
         <td>게시물 및 댓글</td>
      </tr>
      <tr style="display: none;">
         <th scope="row">지역명소</th>
         <td>댓글</td>
      </tr>
      </tbody>
      </table>                  
      
      <div class="dropout_agree_area">
         <p class="contxt" style="padding:0px">
            <strong> 탈퇴 후에는 아이디 <em>${member.id }</em> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
                 <br>
                게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br> 
            </strong>
         </p>
         <div class="dropout_agreechk_area">
            <input type="checkbox" id="dropoutAgree" name="dropoutAgree" >
            <label for="dropoutAgree"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></label>
         </div>
      </div>
      
      <div class="btn_area_w">
         <span>비밀번호 확인 </span><input type="password" name="pwd" id="pwd" value="" placeholder="비밀번호 입력">
         <p class="btn_area">
            <button onclick="goto_agree()" class="btn_submit">확인</button>
         </p>
      </div>
   </div>
</div><!-- main-container  -->
<form action="myMemberDropAf.do" method="post" id="frmDrop" onsubmit="return nullchk()">
   <input type="hidden" value="${member.id }" name="id">
</form>
<script type="text/javascript">
function goto_agree(){
   $("#frmDrop").submit();
}
function nullchk(){
   var chkbox  = $("#dropoutAgree").prop("checked");
   
   if(chkbox != true){
      alert("안내사항에 동의 해주시기 바랍니다.");
      $("#dropoutAgree").focus();
      return false;
   }
   var pwd = $("#pwd").val();
   if(pwd == "" || pwd == null){
      alert("비밀번호를 입력해주세요");
      $("#pwd").focus();
      return false;
   }
   var memPwd = "${member.pwd}";
   alert(pwd);
   alert(memPwd);
   if(pwd != memPwd){
      alert("패스워드가 맞지 않습니다.");
      return false;
   }
   return true;
}
</script>
</body>
</html>