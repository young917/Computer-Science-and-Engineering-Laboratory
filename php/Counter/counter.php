<?
	$filename="counter.txt"; // ���ϸ��� $filename������ �����Ѵ�
	$fp=fopen($filename,"r"); // ������ "r"(�б�)���� ����
	$count=fread($fp,filesize($filename)); // $filename�� ����Ű�� ������ �� ũ�⸸ŭ �о�� $count������ �����Ѵ�
	fclose($fp); // ������ �ݴ´�
	if(!$_COOKIE[ip])
	{
		$count=$count+1;
		$fp=fopen($filename,"w");
		fwrite($fp,"$count");
		fclose($fp);
		SetCookie("ip",1,0);
	} /* cookie�� �����Ǿ������� ���ǹ��� ���� �ʰ� �����Ǿ����� ������ ���ǹ��� �� $count�������� �ϳ��ø���
	$filename�� ����Ű�� ������ "w"(����)���� ��� $count�� ����Ǿ��ִ� ���� ���Ͽ� ����
	������ �ݰ� �� �ڵ尡 ������ ������� �ʴ� ������������ ������ ������ ip�� 1�� �����صΰ� ���������� ������ ���������� 0�� �����Ѵ�
	*/
	echo("<FONT SIZE=9>�湮�� �� :</FONT>"); // �湮�� ���� FONT�±׷� ���ϴ� ũ���� ������ ��Ÿ������ �Ѵ�
	$string=(string)$count; // $count�� ����Ǿ��ִ� ���� ���ڷ� $string�� �����Ѵ�.
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
	}/*$i�� �ε����� ����Ű�� ������ $string�� ����� ���ڱ���-1���� �����Ѵ�.
	$ch=substr($string,$i,1)�� $string�� $i�ε������� �����Ͽ� 1���ڸ�ŭ�� $ch�� �����Ѵ�.�� $string���� $i�ε����� �ش��ϴ� ���ڸ� $ch�� �����Ѵ�
	$ch ���ڿ� ���� �ٸ� ���̽��� �� �˸��� �̹����� �������� ǥ���Ѵ�.	*/
?>