<?
	echo("<FONT SIZE=5>�Խ��� ����</FONT><P>"); // ������� ������ FONT �±׷� ũ�⸦ ������ �������� ��µǵ��� �ߴ�.
	echo("
		<form name='inputform' method='POST' action='$PHP_SELF'>
		<textarea rows=7 cols=50 name=string></textarea>
		<br><br>
		<input type='submit' value='����ϱ�'>
		<input type='reset' value='�ٽñ���'>
		</form>
	"); /* textarea�±׷� �Է�â�� rows�� cols�� ��� ���� ũ�⸦ ������ ����� ���⿡ �Էµ� ���� string������ ����ȴ�.
	submit�� �����ϴ� ��ư�� value�� ������ ������ ��Ÿ���� submit�� �����ϸ� ������ form���¿� ����(����Ʈ�������(method='POST') ������ php��(action='$PHP_SELF')) �Էµ� ���� �����Ѵ�.
	�̴� $_POST["string"]���� ���������. reset�� �����ϴ� ��ư�� value�� ������ ������ ��Ÿ���� reset�� �����ϸ� form������ ������ ������ �ʰ� ������������ ���ư���.
	*/
	echo("<A HREF='Board_main.php'><FONT SIZE=4>�ǵ��� ����</FONT></A>"); // A�±׷� ������ ������ HREF�ڿ� ������ ������ ����ǵ��� ��ũ�� �����ߴ�.
	$string=$_POST["string"]; // $string �������� $POST_["string"]������ �����Ͽ���.
	if($string){
		$filename="data.txt";
		$fp=fopen($filename,"w");
		fwrite($fp,"$string",strlen($string));
		fclose($fp);
		echo("<meta http-equiv='Refresh' content='0; URL=http://127.0.0.1/Board_main.php'>");

	}/*form���º���($_POST["string"])�� ��������� $string���� �����Ǿ ���� ���ǹ��� �����ϰ� �ȴ�.
	�׷��� $filename�� ����Ǿ��ִ� ���ϸ��� "w"(����)���� ���� ���Ͽ� $string�� ����Ǿ��ִ� ���� �ۼ��Ѵ�.
	�� ������ ������ 0�ʸ��� URL�ڿ� ���� ��ũ�� �ٷ� ����ǵ��� meta�±׸� ����Ͽ���.*/
?>		