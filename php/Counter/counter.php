<?
	$filename="counter.txt"; // 파일명을 $filename변수에 저장한다
	$fp=fopen($filename,"r"); // 파일을 "r"(읽기)모드로 연다
	$count=fread($fp,filesize($filename)); // $filename이 가르키는 파일을 그 크기만큼 읽어들어서 $count변수에 저장한다
	fclose($fp); // 파일을 닫는다
	if(!$_COOKIE[ip])
	{
		$count=$count+1;
		$fp=fopen($filename,"w");
		fwrite($fp,"$count");
		fclose($fp);
		SetCookie("ip",1,0);
	} /* cookie가 설정되어있으면 조건문을 들어가지 않고 설정되어있지 않으면 조건문을 들어가 $count변수값을 하나올리고
	$filename이 가르키는 파일을 "w"(쓰기)모드로 열어서 $count에 저장되어있는 수를 파일에 쓴다
	파일을 닫고 이 코드가 끝나도 사라지지 않는 전역변수같은 역할의 변수인 ip에 1을 저장해두고 웹페이지가 닫히면 없어지도록 0을 설정한다
	*/
	echo("<FONT SIZE=9>방문자 수 :</FONT>"); // 방문자 수를 FONT태그로 원하는 크기의 문구로 나타나도록 한다
	$string=(string)$count; // $count에 저장되어있는 수를 문자로 $string에 저장한다.
	for($i=0;$i<strlen($string);$i++){
		$ch=substr($string,$i,1);
		switch($ch){
		case 0:echo("<IMG SRC='php counter/0.jpg'>");break;
		case 1:echo("<IMG SRC='php counter/1.jpg'>");break;
		case 2:echo("<IMG SRC='php counter/2.jpg'>");break;
		case 3:echo("<IMG SRC='php counter/3.jpg'>");break;
		case 4:echo("<IMG SRC='php counter/4.jpg'>");break;
		case 5:echo("<IMG SRC='php counter/5.jpg'>");break;
		case 6:echo("<IMG SRC='php counter/6.jpg'>");break;
		case 7:echo("<IMG SRC='php counter/7.jpg'>");break;
		case 8:echo("<IMG SRC='php counter/8.jpg'>");break;
		case 9:echo("<IMG SRC='php counter/9.jpg'>");break;
		}
	}/*$i는 인덱스를 가르키는 변수로 $string에 저장된 글자길이-1까지 증가한다.
	$ch=substr($string,$i,1)로 $string의 $i인덱스부터 시작하여 1글자만큼을 $ch에 저장한다.즉 $string에서 $i인덱스에 해당하는 문자를 $ch에 저장한다
	$ch 문자에 따라 다른 케이스로 들어가 알맞은 이미지를 페이지에 표시한다.	*/
?>