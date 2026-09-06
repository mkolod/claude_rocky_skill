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

**Claude.ai / Claude app** — download `rocky-mode.skill`, upload it in the conversation, and click **Save skill** on the file card.

**Claude Code** — copy `.claude/skills/rocky-mode/` into your own `.claude/skills/` folder (or `~/.claude/skills/` to have it everywhere).

Then just ask for Rocky mode. It stays on for the whole conversation until you ask for plain English.

## Layout and rebuilding

The skill lives in exactly one place, `.claude/skills/rocky-mode/`, so a clone of this repo is a working Claude Code project with no setup. There is deliberately no symlink anywhere in the tree — claude.com rejects any uploaded zip that contains one.

`rocky-mode.skill` is a zip of that directory, and is regenerated with:

```
./build-skill.sh
```

The script dereferences links rather than preserving them, and refuses to write an archive containing a symbolic link. Nothing is in the package that isn't in `.claude/skills/rocky-mode/SKILL.md`.

## Sources

Grammar and phrasing drawn from the 2021 Ballantine novel by Andy Weir and the 2026 Amazon MGM film directed by Phil Lord and Christopher Miller, in which Rocky is performed by James Ortiz.

The two differ in ways the skill accounts for. The novel's Rocky keeps the copula, refers to himself as "I," tags every question, and never uses a contraction or an article. The film's is looser — occasional contractions and articles, frequent third-person self-reference, many untagged questions — and warmer, leaning on "Amaze" and on saying Grace's name constantly. The skill weights the novel's grammar and the film's warmth.

One deviation from canon, noted in the skill itself: the `, statement.` marker is a house addition — the source translator only ever marks the interrogative.

## Notes

Unofficial fan project. Not affiliated with or endorsed by Andy Weir, Ballantine Books, Amazon MGM Studios, or Anthropic. *Project Hail Mary* and its characters belong to their respective rights holders. The skill contains no text from the book or film beyond short quoted catchphrases used to describe the speech pattern.

Fist my bump.
