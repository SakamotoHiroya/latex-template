# LaTeX 環境（Dev Container + VS Code + latexmk + GitHub Actions）

## 必要なもの
- Docker Desktop（または OrbStack など）
- VS Code + 拡張機能「Dev Containers」

## 使い方
1. このフォルダを VS Code で開く
2. コマンドパレット → **Dev Containers: Reopen in Container**
   （初回は TeX Live イメージの取得に数分かかります）
3. `main.tex` を保存すると自動で latexmk が走り、`out/main.pdf` が生成されます
   - PDF プレビュー: `Ctrl+Alt+V`（Mac は `Cmd+Option+V`）
   - SyncTeX: PDF 上で `Ctrl/Cmd+クリック` → ソースへジャンプ

ターミナルから手動でビルドする場合:
```bash
latexmk        # ビルド
latexmk -c     # 中間ファイル削除
latexmk -C     # PDF も含めて削除
latexmk -pvc   # 監視モード
```

## 構成
| ファイル | 役割 |
|---|---|
| `.devcontainer/devcontainer.json` | コンテナ定義（`texlive/texlive` イメージ）と LaTeX Workshop 設定 |
| `.latexmkrc` | ビルド設定（LuaLaTeX / biber / 出力先 `out/`） |
| `.github/workflows/build.yml` | push・PR 時に同じイメージでビルドし PDF を Artifact に保存 |
| `main.tex`, `refs.bib` | サンプル文書 |

## エンジンの切り替え
既定は LuaLaTeX（`ltjsarticle`）。upLaTeX（`jsarticle` 等）を使う場合は `.latexmkrc` のコメントに従って切り替え、
文書クラスを `\documentclass[uplatex,dvipdfmx]{jsarticle}` などに変更してください。

## GitHub Actions
- `main` への push / PR: PDF を Artifacts（`pdf`）として保存
- `v*` タグの push（例 `git tag v1.0 && git push --tags`）: GitHub Release に PDF を添付
- 失敗時は `out/*.log` が `log` Artifact として残ります
