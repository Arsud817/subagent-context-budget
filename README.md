# subagent-context-budget

An orchestrator skill for preparing concise, complete subagent prompts and keeping test output out of the conversation unless a failure needs diagnosis.

## Install

```sh
git clone https://github.com/Arsud817/subagent-context-budget.git
cd subagent-context-budget
./install.sh
```

By default, the installer places the skill in `~/.agents/skills/subagent-context-budget/`. To choose another skills root:

```sh
./install.sh /path/to/skills
```

The skill is an instruction file; an agent runtime must support loading skills from the chosen directory for it to take effect. The installer does not modify runtime configuration.
