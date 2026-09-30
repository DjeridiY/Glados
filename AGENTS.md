# Glados

Two Haskell interpreters built with Stack: `lisp/` (Scheme subset) and `maryl/` (C-like language compiled to Maryl ASM, then run by a VM).

- One gate: `make check` at the root = hspec for both packages with `-Werror`, then `maryl/test/compiler.sh` (every program must print ✅).
- Maryl CLI: `cd maryl && stack build && ./glados build prog.mrl -o out.masm && ./glados run out.masm` (exit code = value returned by `start`, 84 on error).
- Pipeline: `Parsing/ParserAst.hs` → `Eval/` (type checks, constant folding) → `Compiler/` → `VirtualMachine/`.
- Tests: hspec specs mirror `src/` under `test/`; end-to-end programs live in `maryl/test/test_files/*.mrl` and are listed in `test/compiler.sh`.
  `*.mrl` is gitignored: add new programs with `git add -f`.
- Fix the cause in the right stage; never weaken an existing spec or program. Prefer the smallest diff; no comments restating code.
