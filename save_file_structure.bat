@echo off
REM このスクリプトはMyJavaBlogSiteリポジトリのファイル構造をテキスト化し、C:\testMcpに保存します

REM 出力ディレクトリの作成
mkdir C:\testMcp 2>nul

echo MyJavaBlogSite リポジトリのファイル構造 > C:\testMcp\file_structure.txt
echo 作成日時: %date% %time% >> C:\testMcp\file_structure.txt
echo -------------------------------------------- >> C:\testMcp\file_structure.txt
echo. >> C:\testMcp\file_structure.txt

echo MyJavaBlogSite/ >> C:\testMcp\file_structure.txt
echo ├── .mvn/ >> C:\testMcp\file_structure.txt
echo │   └── wrapper/ >> C:\testMcp\file_structure.txt
echo │       └── maven-wrapper.properties >> C:\testMcp\file_structure.txt
echo ├── src/ >> C:\testMcp\file_structure.txt
echo │   └── main/ >> C:\testMcp\file_structure.txt
echo │       ├── java/ >> C:\testMcp\file_structure.txt
echo │       │   └── com/ >> C:\testMcp\file_structure.txt
echo │       │       └── example/ >> C:\testMcp\file_structure.txt
echo │       │           └── blogsite/ >> C:\testMcp\file_structure.txt
echo │       │               ├── controller/ >> C:\testMcp\file_structure.txt
echo │       │               │   └── PostController.java >> C:\testMcp\file_structure.txt
echo │       │               ├── model/ >> C:\testMcp\file_structure.txt
echo │       │               │   └── Post.java >> C:\testMcp\file_structure.txt
echo │       │               ├── repository/ >> C:\testMcp\file_structure.txt
echo │       │               │   └── PostRepository.java >> C:\testMcp\file_structure.txt
echo │       │               ├── service/ >> C:\testMcp\file_structure.txt
echo │       │               │   └── PostService.java >> C:\testMcp\file_structure.txt
echo │       │               └── BlogsiteApplication.java >> C:\testMcp\file_structure.txt
echo │       └── resources/ >> C:\testMcp\file_structure.txt
echo │           ├── templates/ >> C:\testMcp\file_structure.txt
echo │           │   ├── layout/ >> C:\testMcp\file_structure.txt
echo │           │   │   └── base.html >> C:\testMcp\file_structure.txt
echo │           │   ├── error.html >> C:\testMcp\file_structure.txt
echo │           │   ├── index.html >> C:\testMcp\file_structure.txt
echo │           │   ├── post-detail.html >> C:\testMcp\file_structure.txt
echo │           │   └── post-form.html >> C:\testMcp\file_structure.txt
echo │           └── application.properties >> C:\testMcp\file_structure.txt
echo ├── .gitignore >> C:\testMcp\file_structure.txt
echo ├── mvnw >> C:\testMcp\file_structure.txt
echo ├── mvnw.cmd >> C:\testMcp\file_structure.txt
echo ├── pom.xml >> C:\testMcp\file_structure.txt
echo ├── README.md >> C:\testMcp\file_structure.txt
echo ├── run_and_save.bat >> C:\testMcp\file_structure.txt
echo └── save_file_structure.bat >> C:\testMcp\file_structure.txt
echo. >> C:\testMcp\file_structure.txt
echo. >> C:\testMcp\file_structure.txt

echo ファイル構造が正常にC:\testMcp\file_structure.txtに保存されました。

echo -------------------------------------------- >> C:\testMcp\file_structure.txt
echo 各ファイルの説明: >> C:\testMcp\file_structure.txt
echo. >> C:\testMcp\file_structure.txt
echo 1. .mvn/wrapper/maven-wrapper.properties >> C:\testMcp\file_structure.txt
echo    - Maven Wrapperの設定ファイル >> C:\testMcp\file_structure.txt
echo. >> C:\testMcp\file_structure.txt
echo 2. src/main/java/com/example/blogsite/ >> C:\testMcp\file_structure.txt
echo    - BlogsiteApplication.java - アプリケーションのメインクラス >> C:\testMcp\file_structure.txt
echo    - controller/PostController.java - 投稿管理用コントローラー >> C:\testMcp\file_structure.txt
echo    - model/Post.java - 投稿データのモデルクラス >> C:\testMcp\file_structure.txt
echo    - repository/PostRepository.java - データベース操作のインターフェース >> C:\testMcp\file_structure.txt
echo    - service/PostService.java - ビジネスロジックを実装するサービス >> C:\testMcp\file_structure.txt
echo. >> C:\testMcp\file_structure.txt
echo 3. src/main/resources/ >> C:\testMcp\file_structure.txt
echo    - templates/ - Thymeleafテンプレートファイル >> C:\testMcp\file_structure.txt
echo      - layout/base.html - 共通レイアウト >> C:\testMcp\file_structure.txt
echo      - error.html - エラーページ >> C:\testMcp\file_structure.txt
echo      - index.html - ホームページ >> C:\testMcp\file_structure.txt
echo      - post-detail.html - 投稿詳細ページ >> C:\testMcp\file_structure.txt
echo      - post-form.html - 投稿フォーム >> C:\testMcp\file_structure.txt
echo    - application.properties - アプリケーション設定ファイル >> C:\testMcp\file_structure.txt
echo. >> C:\testMcp\file_structure.txt
echo 4. .gitignore - Gitの管理対象外ファイル設定 >> C:\testMcp\file_structure.txt
echo 5. mvnw, mvnw.cmd - Maven Wrapperスクリプト >> C:\testMcp\file_structure.txt
echo 6. pom.xml - Mavenプロジェクト設定 >> C:\testMcp\file_structure.txt
echo 7. README.md - プロジェクト説明 >> C:\testMcp\file_structure.txt
echo 8. run_and_save.bat - ビルド実行と結果保存スクリプト >> C:\testMcp\file_structure.txt
echo 9. save_file_structure.bat - ファイル構造保存スクリプト >> C:\testMcp\file_structure.txt

pause