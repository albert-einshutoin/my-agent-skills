# 🛠 Agent Skills for Professional OSS Development

This repository provides a set of **Anthropic Agent Skills**–compliant extensions for AI agents (Claude Code, GitHub Copilot, Cursor, etc.). It automates workflows focused on Rust development, OSS operations, accessibility, and security.

## 📂 Repository Structure

Each skill lives under `.github/skills/` as a self-contained unit so that AI agents can discover and run them automatically.

```text
.github/skills/
├── issue-architect/       # Issue creation and task design
├── gitflow-manager/       # Branch management, releases, and tagging
├── pr-author-pro/         # Auto-generated PR descriptions (with A11y/Security audit)
├── changelog-historian/   # CHANGELOG generation from commit history
└── oss-dependency-guardian/ # Vulnerability and license monitoring

```

---

## 🚀 Getting Started

### 1. Installation

Clone this repository or create a symbolic link from your project to use the skills.

```bash
# Run from your project root
ln -s /path/to/my-agent-skills/.github/skills .github/skills

```

### 2. Prerequisites

These skills rely on the following tools:

* **GitHub CLI (`gh`)**: Used for creating PRs and checking CI status.
* **Rust Toolchain (`cargo`)**: Used for `cargo-audit` and running tests.
* **Node.js**: Used for `npm audit` and version-sync checks.

---

## 🛠 Skills Guide

### 1. Issue Architect

**"I want to propose a new feature" / "I found a bug"**  
The AI creates high-quality issues from templates, including reproduction steps and expected behavior, and applies appropriate labels.

### 2. Gitflow Manager

**"Start implementing a new feature" / "Prepare release v1.2.0"**  
Automates branching from `develop`, commits following Conventional Commits, and tagging. It strictly validates **version alignment between Cargo.toml and package.json**.

### 3. PR Author Pro

**"Create a PR"**  
Analyzes diffs and automatically detects impact on accessibility (A11y) and security (CDN/WAF), then incorporates that into the PR body.

### 4. Changelog Historian

**"Summarize changes for this release"**  
Parses commits since the last tag and generates or updates a user-friendly, semantic `CHANGELOG.md`.

### 5. OSS Dependency Guardian

**"Check dependencies for issues"**  
Before release, audits vulnerabilities (Security) and licenses (Compliance). Acts as a guardrail that blocks release when GPL license contamination or critical vulnerabilities are detected.

---

## 🛡 Best Practices & Guardrails

* **Manual Merge Prohibited**: All changes must go through a PR, and CI must pass before merge.
* **Atomic Skills**: For a single task, instruct the AI to combine multiple skills as needed.
* Example: "Create a branch from Issue #1, implement the changes, then use the PR Author skill to write the description."

---

## 📄 License

MIT License
