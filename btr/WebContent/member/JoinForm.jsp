<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
table {
	margin: 0 auto;
	
}

h2 {
 	text-align: center;
}

</style>

</head>

<body>
	<h2>ȸ������ ���</h2>
	
	
	<form action="MemberJoinPro.me" method="post">  <!--
	
	 action�� ���������ּ� 
	 
	 proc.do?gubun=1 ��� �ؼ� 
	 
	 sevlet ���� ���� �� ���� �� 2������ �� �̷��� ����
	 
	 -->
	
		<table width="500" border="1" bordercolor="black">
		
			
			
			<tr height="50">
			
				<td width="150" align="center">���̵�</td>
				<td width="150" align="center">
					<input type="text" name="id" size="40" placeholder="���̵� ��������">
				</td>
				
			</tr>
			
			<tr height="50">
			
				<td width="150" align="center">�н�����</td>
				<td width="150" align="center">
					<input type="password" name="pass" size="40" placeholder="��й�ȣ�� ��������">
				</td>
				
			</tr>
			
			<tr height="50">
			
				<td width="150" align="center">�̸�</td>
				<td width="150" align="center">
					<input type="text" name="name" size="40" placeholder="�̸� ��������">
				</td>
				
			</tr>
			
			
			<tr height="50">
			
				<td width="150" align="center">����</td>
				<td width="150" align="center">
					<input type="text" name="age" size="40" >
				</td>
				
			</tr>
			
			<tr height="50">
			
				<td width="150" align="center">����</td>
				<td width="150" align="center">
					<select name="gender" >
						<option value="��">��</option>
						<option value="��">��</option>
					
					</select>
				</td>
				
			</tr>
			
			
			<tr height="50">
			
				<td width="150" align="center">�̸���</td>
				<td width="150" align="center">
					<input type="email" name="email" size="40" >
				</td>
				
			</tr>
			
			<tr height="50">
			
				<td width="150" align="center">��ȭ��ȣ</td>
				<td width="150" align="center">
					<input type="tel" name="phone" size="40" >
				</td>
				
			</tr>
			
			<tr height="50">
			
				<td width="150" align="center">��ȣ����</td>
				<td width="150" align="center">
				
					<select name="type" >
					
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="��ȭ">��ȭ</option>
						<option value="����">����</option>
					
					</select>
				</td>
				
			</tr>
		
			
	
	
			
			<tr height="50">
				<td align="center" colspan="2">
					<input type="submit" value="ȸ������">
					<input type="reset" value="���">
				</td>
			</tr>
			
		
		
		</table>
	
	
	</form>





</body>

















</html>