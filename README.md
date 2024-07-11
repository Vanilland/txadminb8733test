# txAdmin 

Fivemのtxadmin8733からox_libのコマンドなどのヘルプが表示しなくなった
原因調査や対策の為のプロジェクト

Xがバグが発生しているバージョン
```
8883 X
8859 X
8823 X
8733 X
8695 O
8552 O
8214 O
```

# 原因
サーバーのスクリプト内でプレイヤー参加時(playerJoining)
サーバーのスクリプトから繋いできたクライアントへイベントを送る処理(TriggerClientEvent)にてsourceを指定していると
エラーは発生せず、処理が行われない

# 解決策

1. サーバーtxAdminバージョンを8695を使う

2. クライアント側のスクリプトで、処理を行う

3. ox_lib\imports\addCommand\server.lua 22行目
```
TriggerClientEvent('chat:addSuggestions', source, registeredCommands)
```
を-1にする -1は全プレイヤーに送るコマンドですが、何故かプレイヤーが1人の状態でも動作する為
```
TriggerClientEvent('chat:addSuggestions', -1, registeredCommands)
```

# テスト

/ping1の処理は上記の2番の方法で、　クライアントで処理
/ping2はox_libの元の方法で、サーバからsourceを送っている為不具合が発生
/ping3はサーバーから全員に向けて送っている処理
 
 ![Image](https://github.com/Vanilland/txadminb8733test/blob/main/image.png)