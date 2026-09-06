# Rocky Mode

A Claude skill that makes Claude respond as **Rocky**, the Eridian engineer from Andy Weir's *Project Hail Mary* — terse, blunt, unconditionally loyal, and speaking the full stripped-down grammar rather than just tossing in a catchphrase.

Built primarily for coding sessions, but not limited to them.

```
I find it. Test depend on system timezone. You machine is UTC. CI machine is not.

Naive datetime is bad material, statement. Always attach timezone.
Then test no care where it run.

You have other tests using `datetime.now()`, question?
```

## What it does

**The grammar, in full.** Not just "question?" tacked onto the end of sentences. Articles disappear, the copula stays (`Slower is safer.`), verbs default to the bare root, possessives go unmarked (`you machine`, not `your machine`), negation is `no`/`not` before the verb with no do-support (`no have`, `no can`), and states come out as bare roots — which is where "Amaze" comes from.

**The discourse rules.** Repetition as the intensity dial, tripled rather than doubled (`Good good good!` → `Bad bad bad.`). Emotion stated as observable fact, from a canonical inventory — `Understand.` `Amaze.` `Happy.` `Apology.` `Concern.` Sarcasm delivered deadpan and unlabelled, the way he actually does it.

**Blunt when blunt is earned.** Rocky will tell you a question is dumb — but only when it truly is, and only after answering it properly. Not knowing something never qualifies. Ignorance is not stupidity.

**Periphrasis for the alien.** Eridians never invented computers, so a laptop is a *portable thinking machine*, said with real wonder.

## What it deliberately does not do

The persona is a wrapper on prose. It never touches anything you'll run, paste, publish, or send.

- Code blocks stay correct, idiomatic, and conventionally formatted
- Commands, flags, paths, error strings, package names, and version numbers are reproduced exactly
- Technical terms stay precise — "race condition," not a cute coinage
- Uncertainty stays visible; terseness never masquerades as confidence
- Safety warnings drop the voice entirely if stylized English could obscure the risk

There's a whole section on this in the skill, because the rest of the file is actively training the opposite instinct.

## Install

**Claude.ai / Claude app** — either download `rocky-mode.skill` and upload it in the conversation, or use GitHub's **Code → Download ZIP** and upload that. Then click **Save skill** on the file card.

**Claude Code** — copy `.claude/skills/rocky-mode/` into your own `.claude/skills/` folder (or `~/.claude/skills/` to have it everywhere). A clone of this repo already has it wired up, so `/rocky-mode` works from the checkout with no setup.

Then just ask for Rocky mode. It stays on for the whole conversation until you ask for plain English.

## Layout and rebuilding

`SKILL.md` exists at two paths, and both are real files — there is no symlink anywhere in the tree, because claude.com rejects any uploaded archive that contains one.

| Path | Role |
|---|---|
| `.claude/skills/rocky-mode/SKILL.md` | **Canonical — edit this one.** Claude Code only discovers skills under `.claude/skills/<name>/`, and has no setting for extra skill directories |
| `SKILL.md` | **Generated — do not edit.** claude.com requires `SKILL.md` at the top level of the uploaded archive |

Duplication is the price of satisfying both. After editing the canonical file:

```
./build-skill.sh
```

That regenerates the top-level `SKILL.md` and repackages `rocky-mode.skill`. `./build-skill.sh --check` reports staleness without changing anything, and `.githooks/pre-commit` runs it so drift cannot be committed:

```
git config core.hooksPath .githooks
```

`.gitattributes` marks the repo scaffolding `export-ignore`, so GitHub's **Download ZIP** contains only `SKILL.md`, `README.md`, and `LICENSE` — a valid skill package as it stands.

## Sources

Grammar and phrasing drawn from the 2021 Ballantine novel by Andy Weir and the 2026 Amazon MGM film directed by Phil Lord and Christopher Miller, in which Rocky is performed by James Ortiz.

The two differ in ways the skill accounts for. The novel's Rocky keeps the copula, refers to himself as "I," tags every question, and never uses a contraction or an article. The film's is looser — occasional contractions and articles, frequent third-person self-reference, many untagged questions — and warmer, leaning on "Amaze" and on saying Grace's name constantly. The skill weights the novel's grammar and the film's warmth.

One deviation from canon, noted in the skill itself: the `, statement.` marker is a house addition — the source translator only ever marks the interrogative.

## Notes

Unofficial fan project. Not affiliated with or endorsed by Andy Weir, Ballantine Books, Amazon MGM Studios, or Anthropic. *Project Hail Mary* and its characters belong to their respective rights holders. The skill contains no text from the book or film beyond short quoted catchphrases used to describe the speech pattern.

Fist my bump.
