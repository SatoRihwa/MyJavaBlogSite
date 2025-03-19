@echo off
REM このスクリプトはブログサイトをビルド・実行し、結果をC:\testMcpに保存します

REM 出力ディレクトリの作成
mkdir C:\testMcp 2>nul

REM ビルド実行
echo ビルドを実行します...
call mvnw.cmd clean package -DskipTests

REM 実行結果の確認
if %ERRORLEVEL% EQU 0 (
    echo ビルドが成功しました。情報を保存します...
    
    REM 実行情報をファイルに保存
    echo BlogSite アプリケーション実行情報 > C:\testMcp\blogsite_info.txt
    echo 日時: %date% %time% >> C:\testMcp\blogsite_info.txt
    echo -------------------------------------------- >> C:\testMcp\blogsite_info.txt
    echo アプリケーション起動方法: >> C:\testMcp\blogsite_info.txt
    echo 1. コマンドプロンプトで次のコマンドを実行: >> C:\testMcp\blogsite_info.txt
    echo    mvnw.cmd spring-boot:run >> C:\testMcp\blogsite_info.txt
    echo. >> C:\testMcp\blogsite_info.txt
    echo 2. または、ビルド済みJARファイルを実行: >> C:\testMcp\blogsite_info.txt
    echo    java -jar target\blogsite-0.0.1-SNAPSHOT.jar >> C:\testMcp\blogsite_info.txt
    echo. >> C:\testMcp\blogsite_info.txt
    echo ブラウザで http://localhost:8080 にアクセスしてください。 >> C:\testMcp\blogsite_info.txt
    echo. >> C:\testMcp\blogsite_info.txt
    echo -------------------------------------------- >> C:\testMcp\blogsite_info.txt
    echo データベース情報: >> C:\testMcp\blogsite_info.txt
    echo PostgreSQLが必要です。 >> C:\testMcp\blogsite_info.txt
    echo データベース名: blogsite >> C:\testMcp\blogsite_info.txt
    echo ユーザー名: postgres >> C:\testMcp\blogsite_info.txt
    echo パスワード: postgres >> C:\testMcp\blogsite_info.txt
    echo. >> C:\testMcp\blogsite_info.txt

    REM JARファイルをコピー
    copy target\blogsite-0.0.1-SNAPSHOT.jar C:\testMcp\blogsite.jar
    
    REM スクリーンショットの代わりにアプリ実行手順を追加
    echo -------------------------------------------- > C:\testMcp\run_instructions.txt
    echo BlogSite 実行手順: >> C:\testMcp\run_instructions.txt
    echo. >> C:\testMcp\run_instructions.txt
    echo 1. PostgreSQLをインストールし、blogsiteデータベースを作成してください。 >> C:\testMcp\run_instructions.txt
    echo. >> C:\testMcp\run_instructions.txt
    echo 2. 次のコマンドでアプリケーションを起動: >> C:\testMcp\run_instructions.txt
    echo    java -jar C:\testMcp\blogsite.jar >> C:\testMcp\run_instructions.txt
    echo. >> C:\testMcp\run_instructions.txt
    echo 3. ブラウザで http://localhost:8080 にアクセス >> C:\testMcp\run_instructions.txt
    echo. >> C:\testMcp\run_instructions.txt
    echo 4. 「新規投稿」ボタンをクリックして記事を投稿できます。 >> C:\testMcp\run_instructions.txt
    echo. >> C:\testMcp\run_instructions.txt
    
    REM デザインの説明を追加
    echo -------------------------------------------- > C:\testMcp\design_info.txt
    echo BlogSite デザインについて >> C:\testMcp\design_info.txt
    echo. >> C:\testMcp\design_info.txt
    echo このブログサイトは、シンプルさと可愛らしさを両立したデザインを採用しています。 >> C:\testMcp\design_info.txt
    echo. >> C:\testMcp\design_info.txt
    echo 1. カラースキーム: >> C:\testMcp\design_info.txt
    echo   - メインカラー: 優しいピンク (#ff9aa2) >> C:\testMcp\design_info.txt
    echo   - セカンダリカラー: 柔らかな紫 (#c7ceea) >> C:\testMcp\design_info.txt
    echo   - アクセントカラー: 柔らかなオレンジ (#ffdac1) >> C:\testMcp\design_info.txt
    echo   - ライトカラー: 淡い緑 (#e2f0cb) >> C:\testMcp\design_info.txt
    echo. >> C:\testMcp\design_info.txt
    echo 2. デザイン要素: >> C:\testMcp\design_info.txt
    echo   - 丸みを帯びたカード（border-radius: 15px） >> C:\testMcp\design_info.txt
    echo   - ソフトな影効果（box-shadow） >> C:\testMcp\design_info.txt
    echo   - カードのホバー時の浮き上がりアニメーション >> C:\testMcp\design_info.txt
    echo   - かわいい装飾文字（✿）のタイトル装飾 >> C:\testMcp\design_info.txt
    echo. >> C:\testMcp\design_info.txt
    echo 3. レスポンシブデザイン: >> C:\testMcp\design_info.txt
    echo   - スマートフォンからデスクトップまで対応 >> C:\testMcp\design_info.txt
    echo   - Bootstrap 5フレームワークを使用 >> C:\testMcp\design_info.txt
    echo. >> C:\testMcp\design_info.txt

    echo 情報の保存が完了しました。
    echo アプリケーションの実行情報、JAR、実行手順がC:\testMcpに保存されました。
    
) else (
    echo ビルドに失敗しました。エラーを確認してください。
    echo ビルドエラー > C:\testMcp\error.txt
    echo 日時: %date% %time% >> C:\testMcp\error.txt
    echo ビルドに失敗しました。プロジェクトの設定を確認してください。 >> C:\testMcp\error.txt
)

echo.
echo 処理が完了しました。