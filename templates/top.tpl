<html>
    <head>
        <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″ />
        <link rel="stylesheet" href="index.css">
        <title>銀行演習</title>
    </head>
    <body>
        <h2>表示件数：{$row_count}</h2>
        <table border='1'>
            <tr>
                <th>口座番号</th>
                <th>預金種別</th>
                <th>氏名（漢字）</th>
                <th>氏名（カタカナ）</th>
                <th>作成日付</th>
                <th>flg_active</th>
            </tr>
            {foreach $rows as $a} 
            <tr>
                <td>{$a['number']}</td>
                <td>{typeprint($a['type'])}</td>
                <td>{$a['name_full']}</td>
                <td>{$a['name_kana']}</td>
                <td>{$a['create_date']}</td>
                <td>{$a['flg_active']}</td>
            </tr>
            {/foreach}
        </table>
        <div class="box">
            <h2>口座開設フォーム</h2>
            <form action = "result_account.php" method="POST">
                <ul>
                    <li class="account">
                        <lebel>預金種別　　　　：</lebel>
                        <input type="radio" name=deposit_type value=1 checked="">普通預金
                        <input type="radio" name=deposit_type value=2>当座預金
                        <input type="radio" name=deposit_type value=3>定期預金
                        <input type="radio" name=deposit_type value=4>貯蓄預金
                    </li>
                    <li class="account">
                        <lebel>預金者名　　　　：</lebel>
                        <input type="text" name=name_full placeholder="お名前">
                    </li>
                    <li class="account">
                        <lebel>預金者名（カナ）：</lebel>
                        <input type="text" name=name_kana placeholder="お名前（カナ）">
                        <div id=error_text></div>
                    </li>
                    <li>
                        <button type="submit" value="">口座登録</button>
                    </li>
                </ul>
            </form>
        </div>
        <div class="box">
            <h2>入出金記録フォーム</h2>
            <form action = "result_transaction.php" method="POST">
                <ul>
                    <li class="transaction">
                        <label>利用支店： 138</label>
                    </li>
                    <li class="transaction">
                        <label>口座番号：</label>
                        <select name="number">
                            {foreach $rows as $a}
                            <option value="{$a['number']}">{$a['number']}</option>
                            {/foreach}
                        </select>
                    </li>
                    <li class="transaction">
                        <label>取引内容：</label>
                        <input type="radio" name="transaction" value="1" checked="">窓口現金預入
                        <input type="radio" name="transaction" value="2">窓口現金引出
                    </li>
                    <li class="transaction">
                        <label>取引備考：</label>
                        <input type="text" name="remarks">（備考がある場合のみ記入）
                    </li>
                    <li class="transaction">
                        <label>取引金額：</label>
                        <input type="text" name="money">
                    </li>
                    <li>
                        <button type="submit" value="">入出金を記録</button></button>
                    </li>
                </ul>
            </form>
        </div>
        <div class="box">
            <h2>入出金記録確認フォーム</h2>
            <form action = "result_check_money.php" method="POST">
                <ul>
                    <li class="transaction">
                        <label>利用支店： 138</label>
                    </li>
                    <li class="transaction">
                        <label>口座番号：</label>
                        <select name="number">
                            {foreach $rows as $a}
                            <option value="{$a['number']}">{$a['number']}</option>
                            {/foreach}
                        </select>
                    </li>
                    <li>
                        <button type="submit" value="">確認</button></button>
                    </li>
                </ul>
            </form>
        </div>
        <div class="box">
            <h2>銀行振込フォーム</h2>
            <form action = "result_transfer.php" method="POST">
                <ul>
                    <li class="transfer">
                        <label>利用支店　　　： 138</label>
                    </li>
                    <li class="transfer">
                        <label>振込元口座番号：</label>
                        <select name="yuan_number">
                            {foreach $rows as $a}
                            <option value="{$a['number']}">{$a['number']}</option>
                            {/foreach}
                        </select>
                    </li>
                    <li class="transfer">
                        <label>振込先口座番号：</label>
                        <select name="prior_number">
                            {foreach $rows as $a}
                            <option value="{$a['number']}">{$a['number']}</option>
                            {/foreach}
                        </select>
                    </li>
                    <li class="transfer">
                        <label>振込金額　　　：</label>
                        <input type="text" name="transfer_money">
                    </li>
                    <li>
                        <button type="submit" value="">振込</button>
                    </li>
                </ul>
            </form>
        </div>
    </body>
</html>
