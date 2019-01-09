<?
	echo("<FONT SIZE=5>게시판 읽기<P></FONT>");
	$filename="data.txt"; 
	$fp=fopen($filename,"r"); //filename변수에 저장된 문자열에 해당하는 파일을 "r"(읽기모드)로 연다
	$board_string=fread($fp,filesize($filename)); //파일을 읽어들어 문자열을 $board_string에 저장한다.
	fclose($fp); // 파일을 닫는다.
	echo("<textarea rows=7 cols=50 style='font-size:18px'>$board_string</textarea><P>"); 
	//문자가 들어갈 창을 설정하기 위해 textarea태그를 하고 rows로 행의 수를, cols로 열의 수를 지정하고 style속성으로 폰트사이즈를 지정하였다.
	//태그 사이에는 $board_string을 넣어 이 변수에 저장되어있는 문자열이 textarea태그 영향을 받아 페이지에 출력되도록 하였다.
	echo("<A HREF='Board_main.php'><FONT SIZE=4>되돌아 가기</FONT></A>"); // A태그를 통해 누르면 HREF 뒤에 있는 문서로 연결되도록 한다. 
?>