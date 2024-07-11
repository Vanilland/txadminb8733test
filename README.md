 ![Image](https://github.com/Vanilland/txadminb8733test/blob/main/image.png)

```
8883 X
8859 X
8823 X
8733 X
8695 O
8552 O
8214 O
```

# English
artifacts b8733 and above bug

It seems that from fx: b8733, when using TriggerClientEvent to trigger an event on the source client in the server's playerJoining event, it does not execute.

3 different ways to solve this problem.

Use fx: 8695

Set playerId to -1 in TriggerClientEvent in playerJoining, which is sent to all users, but for some reason it works even when there is only one player

Execute addSuggestion in the client-side script

tested Linux
https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/

# Japanese

Fivemのartifacts 8733からox_libのコマンドなどのヘルプが表示しなくなった
原因調査や対策の為のプロジェクト

# 原因

サーバーのスクリプト内でプレイヤー参加時(playerJoining)

サーバーのスクリプトから繋いできたクライアントへイベントを送る処理(TriggerClientEvent)にて

sourceを指定しているとエラーは発生せず、処理が行われない

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
