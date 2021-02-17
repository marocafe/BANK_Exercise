<html>
    <head>
        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″ />
        <link rel="stylesheet" href="index.css">
        <title>入出金記録確認</title>
    </head>
    <body>
        <h2>取引回数：{$row_count}回</h2>
        <table border='1'>
            <tr>
                <th>ID</th>
                <th>利用支店</th>
                <th>口座番号</th>
                <th>記録日時</th>
                <th>取引内容</th>
                <th>取引備考</th>
                <th>取引金額</th>
            </tr>
            {foreach $rows as $a} 
            <tr>
                <td>{$a['id']}</td>
                <td>{$a['CDSHITEN']}</td>
                <td>{$a['CDnumber']}</td>
                <td>{$a['timestamp']}</td>
                <td>{typeprint($a['type'])}</td>
                <td>{$a['remarks']}</td>
                <td>{$a['amount']}</td>
            </tr>
            {/foreach}
        </table>
        <div>残高は：{$sum_money}円です</div>
        <input type="button" value="メインページに戻る" onclick="history.back();">
    </body>
</html>
