<?
	echo("<FONT SIZE=5>게시판 쓰기</FONT><P>"); // 쓰고싶은 문구를 FONT 태그로 크기를 지정해 페이지에 출력되도록 했다.
	echo("
		<form name='inputform' method='POST' action='$PHP_SELF'>
		<textarea rows=7 cols=50 name=string></textarea>
		<br><br>
		<input type='submit' value='등록하기'>
		<input type='reset' value='다시기입'>
		</form>
	"); /* textarea태그로 입력창을 rows와 cols로 행과 열의 크기를 지정해 만들고 여기에 입력된 글은 string변수에 저장된다.
	submit을 수행하는 버튼은 value에 지정된 문구로 나타나고 submit을 수행하면 지정한 form형태에 따라(포스트방법으로(method='POST') 지금의 php에(action='$PHP_SELF')) 입력된 값을 저장한다.
	이는 $_POST["string"]으로 만들어진다. reset을 수행하는 버튼은 value에 지정된 문구로 나타나고 reset을 수행하면 form형태의 변수를 만들지 않고 시작지점으로 돌아간다.
	*/
	echo("<A HREF='Board_main.php'><FONT SIZE=4>되돌아 가기</FONT></A>"); // A태그로 문구를 누르면 HREF뒤에 지정된 문서로 연결되도록 링크를 설정했다.
	$string=$_POST["string"]; // $string 변수값을 $POST_["string"]값으로 설정하였다.
	if($string){
		$filename="data.txt";
		$fp=fopen($filename,"w");
		fwrite($fp,"$string",strlen($string));
		fclose($fp);
		echo("<meta http-equiv='Refresh' content='0; URL=http://127.0.0.1/Board_main.php'>");

	}/*form형태변수($_POST["string"])이 만들어지면 $string값이 지정되어서 위의 조건문을 만족하게 된다.
	그러면 $filename에 저장되어있는 파일명을 "w"(쓰기)모드로 열고 파일에 $string에 저장되어있는 글을 작성한다.
	이 수행이 끝나면 0초만에 URL뒤에 나온 링크로 바로 연결되도록 meta태그를 사용하였다.*/
?>		