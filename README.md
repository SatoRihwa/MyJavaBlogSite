# BlogSite

シンプルで可愛らしいブログサイト

## 概要
このプロジェクトは、Javaと PostgreSQLを使用した個人ブログ（日記）サイトです。シンプルながら可愛らしいデザインを採用しています。

## 技術スタック
- Java 17
- Spring Boot 3.2.3
- PostgreSQL 15
- Thymeleaf
- Bootstrap 5

## 機能
- ブログ投稿の作成、表示、更新、削除
- シンプルで使いやすいインターフェース
- レスポンシブデザイン

## プロジェクト構成
```
src/
  ├── main/
  │   ├── java/com/example/blogsite/
  │   │   ├── controller/       - コントローラークラス
  │   │   ├── model/            - エンティティモデル
  │   │   ├── repository/       - データアクセスレイヤー
  │   │   ├── service/          - ビジネスロジック
  │   │   └── BlogsiteApplication.java - メインクラス
  │   │
  │   └── resources/
  │       ├── templates/        - Thymeleafテンプレート
  │       │   ├── layout/       - 共通レイアウト
  │       │   ├── index.html    - ホームページ
  │       │   ├── post-form.html - 投稿フォーム
  │       │   └── post-detail.html - 投稿詳細ページ
  │       │
  │       ├── static/           - 静的リソース
  │       └── application.properties - アプリケーション設定
```

## デザイン特徴
このブログサイトは、シンプルでありながら可愛らしさを追求したデザインを実装しています：

- 優しいパステルカラーを基調としたカラースキーム
- 丸みを帯びたカードデザインと柔らかな影効果
- アニメーション効果でインタラクティブ感を向上
- かわいい装飾文字（✿）の使用
- スマートフォンからデスクトップまで対応するレスポンシブデザイン

## セットアップ方法
1. GitHubからプロジェクトをクローンします
   ```
   git clone https://github.com/SatoRihwa/MyJavaBlogSite.git
   cd MyJavaBlogSite
   ```

2. PostgreSQLをインストールし、`blogsite`データベースを作成します
   ```sql
   CREATE DATABASE blogsite;
   ```

3. `src/main/resources/application.properties`の設定を確認します
   - データベースの接続情報を必要に応じて変更してください

4. プロジェクトをビルドして実行します
   ```
   ./mvnw spring-boot:run
   ```

5. ブラウザで `http://localhost:8080` にアクセスします

## 実行結果
実行結果は `C:\testMcp` ディレクトリに保存されます。`run_and_save.bat` スクリプトを実行することで、ビルド結果や実行情報などがこのディレクトリに保存されます。

## ライセンス
MIT