<?
	echo("<FONT SIZE=5>�Խ��� �б�<P></FONT>");
	$filename="data.txt"; 
	$fp=fopen($filename,"r"); //filename������ ����� ���ڿ��� �ش��ϴ� ������ "r"(�б���)�� ����
	$board_string=fread($fp,filesize($filename)); //������ �о��� ���ڿ��� $board_string�� �����Ѵ�.
	fclose($fp); // ������ �ݴ´�.
	echo("<textarea rows=7 cols=50 style='font-size:18px'>$board_string</textarea><P>"); 
	//���ڰ� �� â�� �����ϱ� ���� textarea�±׸� �ϰ� rows�� ���� ����, cols�� ���� ���� �����ϰ� style�Ӽ����� ��Ʈ����� �����Ͽ���.
	//�±� ���̿��� $board_string�� �־� �� ������ ����Ǿ��ִ� ���ڿ��� textarea�±� ������ �޾� �������� ��µǵ��� �Ͽ���.
	echo("<A HREF='Board_main.php'><FONT SIZE=4>�ǵ��� ����</FONT></A>"); // A�±׸� ���� ������ HREF �ڿ� �ִ� ������ ����ǵ��� �Ѵ�. 
?>