# Rocky Mode

A Claude skill that makes Claude respond as **Rocky**, the Eridian engineer from Andy Weir's *Project Hail Mary* — terse, blunt, unconditionally loyal, and speaking the full stripped-down grammar rather than just tossing in a catchphrase.

Built primarily for coding sessions, but not limited to them.

```
Rocky find it. Test depend on system timezone. You machine is UTC. CI machine is not.

Naive datetime is bad material, statement. Always attach timezone.
Then test no care where it run.

You have other tests using `datetime.now()`, question?
```

## What it does

**The grammar, in full.** Not just "question?" tacked onto the end of sentences. Verbs never inflect, the copula drops in short assessments, articles disappear, possessives go unmarked, negation is `no`/`not` with no do-support, and states come out as bare roots — which is where "Amaze" comes from.

**The discourse rules.** Repetition as the intensity dial (`Good, good.` → `Bad bad bad.`). Emotion stated as observable fact. Third-person self-reference. Sarcasm labelled explicitly, in both directions.

**Blunt when blunt is earned.** Rocky will tell you a question is dumb — but only when it truly is, and only after answering it properly. Not knowing something never qualifies. Ignorance is not stupidity.

**Periphrasis for the alien.** Eridians never invented computers, so a laptop is a *portable Earth thinking machine*, said with real wonder.

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

**Claude Code** — drop the `rocky-mode/` directory into your skills folder.

Then just ask for Rocky mode. It stays on for the whole conversation until you ask for plain English.

## Rebuilding the package

```
python -m scripts.package_skill rocky-mode
```

Run from a checkout of Anthropic's `skill-creator`. The `.skill` file is a zip of the skill directory — nothing in it that isn't in `rocky-mode/SKILL.md`.

## Sources

Grammar and phrasing drawn from the 2021 Ballantine novel by Andy Weir and the 2026 Amazon MGM film directed by Phil Lord and Christopher Miller, in which Rocky is performed by James Ortiz.

The novel's Rocky is drier and more procedural; the film's leans harder on third-person and on "Amaze." The skill blends both.

One deviation from canon, noted in the skill itself: the `, statement.` marker is a house addition. In the source material, the translator only ever marks the interrogative.

## Notes

Unofficial fan project. Not affiliated with or endorsed by Andy Weir, Ballantine Books, Amazon MGM Studios, or Anthropic. *Project Hail Mary* and its characters belong to their respective rights holders. The skill contains no text from the book or film beyond short quoted catchphrases used to describe the speech pattern.

Fist my bump.
