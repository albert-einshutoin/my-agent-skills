# 🛠 Agent Skills for Professional OSS Development

このリポジトリは、**Anthropic Agent Skills** 規格に基づいた、AIエージェント（Claude Code, GitHub Copilot, Cursor等）専用の高度な機能拡張セットです。Rust開発、OSS運用、アクセシビリティ、セキュリティに特化したワークフローを自動化します。

## 📂 Repository Structure

各スキルはリポジトリルートの `skills/` 配下に独立して配置されており、AIエージェントが自動的に認識・実行できるように設計されています。既存プロジェクトの `.github` と衝突しない構成です。

```text
skills/
├── issue-architect/       # Issue作成とタスク設計
├── gitflow-manager/       # ブランチ管理・リリース・タグ打ち
├── pr-author-pro/         # PR説明文の自動生成（A11y/Security監査付）
├── changelog-historian/   # コミットログからのCHANGELOG生成
└── oss-dependency-guardian/ # 脆弱性とライセンスの監視

```

---

## 🚀 Getting Started

### 1. クローンしてすぐ使う

リポジトリをクローンし、AIエージェント（Cursor や Claude Code など）でこのフォルダを開けば、`skills/` 配下のスキルは追加設定なしで利用できます。

```bash
git clone https://github.com/YOUR_ORG/my-agent-skills.git
cd my-agent-skills
# このフォルダを Cursor 等で開く。エージェントが skills/ 内のスキルを認識します
```

エージェントにスキル名を指定して使わせる（例：「Issue Architect スキルで … の Issue を作成して」）か、下記の [Skills Guide](#-skills-guide) を参照してください。

### 2. 他のプロジェクトから使う

利用したいプロジェクトのルートから、このリポジトリの `skills` をシンボリックリンクで参照します。

**A. 自分のプロジェクトで `.github/skills` に置きたい場合（ツールがこのパスを参照する場合）：**

```bash
# プロジェクトのルートで実行（.github が無ければ作成）
mkdir -p .github
ln -s /path/to/my-agent-skills/skills .github/skills
```

**B. プロジェクトルートに `skills` として置く場合：**

```bash
# プロジェクトのルートで実行
ln -s /path/to/my-agent-skills/skills skills
```

そのプロジェクトをエージェントで開くと、リンクしたスキルがワークスペース内で利用されます。

### 3. 必要条件

これらのスキルは以下のツールを活用します。

* **GitHub CLI (`gh`)**: PR作成やCI状態の監視に使用。
* **Rust Toolchain (`cargo`)**: `cargo-audit` やテストの実行に使用。
* **Node.js**: `npm audit` やバージョン同期の確認に使用。

---

## 🛠 Skills Guide

### 1. Issue Architect

**「新しい機能を提案したい」「バグを見つけた」**
AIがテンプレートに沿って、再現手順や期待される動作を網羅した高品質なIssueを作成し、適切なラベルを付与します。

### 2. Gitflow Manager

**「新しい機能を実装し始めて」「リリース v1.2.0 を準備して」**
developからのブランチ切り出し、Conventional Commitsに準拠したコミット、そしてタグ打ちを自動化します。特に **Cargo.toml と package.json のバージョン同期** を徹底的に検証します。

### 3. PR Author Pro

**「PRを作成して」**
差分を分析し、アクセシビリティ（A11y）やセキュリティ（CDN/WAF）への影響を自動検知してPR本文に盛り込みます。

### 4. Changelog Historian

**「今回のリリースの変更点をまとめて」**
前回のタグからのコミットを解析し、ユーザー向けのセマンティックな `CHANGELOG.md` を生成・更新します。

### 5. OSS Dependency Guardian

**「依存関係に問題がないかチェックして」**
リリース前に、脆弱性（Security）とライセンス（Compliance）を監査します。GPLライセンスの混入や深刻な脆弱性を検知すると、リリースを停止するガードレールとして機能します。

---

## 🛡 Best Practices & Guardrails

* **Manual Merge Prohibited**: 全ての変更はPRを経由し、CIがパスすることを確認してください。
* **Atomic Skills**: 1つのタスクに対して、AIに複数のスキルを組み合わせて使うよう指示してください。
* 例：「Issue #1 を元にブランチを作成し、実装が終わったら PR Author スキルで説明文を書いて」

---

## 📄 License

MIT License
