What the video is really teaching

The core message is not “use Claude-specific tricks.” It is: treat the coding AI as an agentic teammate, not as autocomplete. The recurring practices tied to your linked video are: start with codebase Q&A, teach the agent your tools and conventions, have it explore and plan before coding, use TDD and other feedback loops so it can iterate against a target, keep repo knowledge in a durable instructions file, use screenshots/images for visual tasks, and run independent work in parallel when it is safe to do so.

A second important idea is that these tools are most effective when they can verify themselves. In the transcript I could access, Boris emphasizes that the agent does much better when it has something concrete to iterate against: unit tests, integration tests, screenshots, simulator output, or another validation target. He also recommends letting the agent gather context first and only then do heavier reasoning.

The third big idea is durable context beats repeated prompting. In the Boris material, that shows up as CLAUDE.md, reusable commands, and tool instructions. The same principle ports cleanly to Copilot: put stable project rules in files, not in people’s heads.

What transfers directly to Copilot and Copilot CLI

A lot transfers directly, not approximately.

GitHub Copilot coding agent can work from GitHub Issues, the agents page, Copilot Chat, the GitHub CLI, and IDEs/tools that support MCP; it works by doing the task and raising a PR for human review. Sessions can be tracked from the agents page, VS Code, JetBrains, the CLI, Raycast, and session logs.

Copilot CLI now has a documented plan mode. In interactive mode, Shift+Tab cycles into plan mode so Copilot builds a structured implementation plan before writing code. The CLI also supports autopilot for more autonomous execution, and /fleet for splitting a multi-step implementation plan across subagents when the work can run in parallel.

Copilot also has first-class support for the “durable context” pattern. GitHub documents repository-wide instructions in .github/copilot-instructions.md, path-specific instructions in .github/instructions/**/*.instructions.md, and agent instructions through AGENTS.md; GitHub also notes that a root CLAUDE.md or GEMINI.md can be used as agent instructions. Prompt files (*.prompt.md) in .github/prompts give you reusable task-specific prompts, and custom agents / agent skills let you specialize behavior further.

Visual workflows also transfer. GitHub’s coding agent can process images attached to issues or Copilot Chat prompts, and the default MCP servers for coding agent include GitHub and Playwright, which is a strong match for UI and QA-heavy flows.

Where the mapping is not 1:1

The exact Claude UI details do not all map cleanly. Claude’s repo memory / command UX is not identical to Copilot’s. In Copilot, the closest durable equivalents are custom instructions, prompt files, custom agents, and skills rather than a single magical memory surface. That means the principle ports well, but the implementation surface is different.

Team tutorial: how I would use Copilot based on this video
1) Standardize the repo first

Before the team leans on Copilot heavily, set up the repo so the agent knows how your team works. For Copilot, that means:

.github/copilot-instructions.md

.github/instructions/backend.instructions.md

.github/instructions/frontend.instructions.md

AGENTS.md

.github/prompts/*.prompt.md

.github/agents/*.agent.md

copilot-setup-steps.yml for pre-installing dependencies in the agent environment.

For a .NET + Angular team, I would split instructions by path: backend rules under .github/instructions/api.instructions.md, frontend rules under .github/instructions/web.instructions.md, and keep the repo-wide file short and stable: build/test/lint commands, coding standards, architecture guardrails, and definition of done. GitHub explicitly warns against overloading one giant instruction file for large repos.

A good baseline for .github/copilot-instructions.md is:

# Build and validation
- Backend: dotnet restore && dotnet test
- Frontend: npm ci && npm test && npm run lint

# Rules
- Do not change public API contracts without updating tests and docs.
- Prefer minimal diffs over broad refactors.
- Reuse existing utilities before introducing new abstractions.

# Definition of done
- All relevant tests pass
- New behavior has tests
- PR summary explains risk and rollback
2) Start every non-trivial local task in Copilot CLI plan mode

This is the cleanest port of Boris’s “plan first” habit. Open the repo root, start copilot, hit Shift+Tab, and keep Copilot in plan mode until you agree on approach, edge cases, touched files, tests, and rollback. GitHub documents this directly for Copilot CLI.

Use prompts like:

Plan the smallest safe change to add rate limiting to the public API. List touched files, tests to add, and migration risks.

Plan the refactor only. Do not write code yet.

Create a test-first plan for fixing the intermittent timeout in order processing.

3) Use codebase Q&A before edits

This is one of the strongest takeaways from the Boris material, and it maps perfectly. The first move should often be a question, not an implementation prompt. Boris explicitly recommends code-based Q&A and says it dramatically shortened onboarding. GitHub’s own prompt library also includes an onboarding-plan prompt pattern.

Good team prompts:

Where is auth enforced end to end?

What is the existing pattern for adding a new MediatR handler?

Explain how retries and circuit breaking are configured.

What did I change this week in this repo?

4) Force target-based iteration

Do not ask Copilot to “just fix it.” Ask it to create a target first: failing unit test, integration test, Playwright scenario, or screenshot-based acceptance condition. That is directly aligned with the Boris guidance and with GitHub’s own test-generation and visual-input features.

Good prompts:

Write failing unit tests first for the bug described in ISSUE-421. Do not implement yet.

Generate a Playwright regression test for this checkout flow from the attached screenshot and issue steps.

Review this component against the attached mockup and tell me what must change before implementation.

5) Use GitHub Issues for larger tasks, not giant chat prompts

For larger features or bug fixes, create a real issue and assign it to Copilot. GitHub’s coding agent is built for that flow. The issue should contain the goal, acceptance criteria, non-goals, affected area, validation steps, and screenshots/logs where relevant.

Very important nuance: when you assign an issue to Copilot, it gets the issue title, body, current comments, and any extra instructions at assignment time. GitHub’s docs say later comments added to the issue are not picked up, so any additional clarification should go on the PR once Copilot opens it. That matters a lot for QA handoffs.

6) Review via PR comments, not by restarting the whole task

Once Copilot opens a PR, iterate there. GitHub recommends reviewing the PR thoroughly, batching review comments, and using @copilot when you want it to react to a comment. Copilot remembers prior PR context on subsequent sessions, so the loop gets faster.

Good PR comments:

@copilot add a regression test for the null payload case and avoid changing the public response contract.

@copilot keep the existing ErrorHandler utility instead of adding new try/catch logic.

@copilot this fixes the happy path only; add negative cases for expired tokens and invalid tenant IDs.

7) Parallelize only independent work

The Boris advice about “multi-Claude” maps well to Copilot CLI /fleet and to multiple Copilot sessions. GitHub documents /fleet as a way to speed up a multi-step implementation plan by assigning parts to subagents. Use it for separable work: implementation, tests, docs, migration script, review pass.

Use prompts like:

/fleet Implement this approved plan, splitting implementation, tests, and docs where possible.

/fleet Execute the plan, but do not let subagents touch the same files.

8) Keep humans in charge of risk

GitHub is explicit that PRs created by Copilot still need human review, and GitHub Actions workflows do not run automatically when Copilot pushes changes. A user with write access has to approve and run them, and you should be especially careful with changes under .github/workflows/. Copilot CLI also asks you to trust the folder you are in, and broad autopilot permissions can let it run the same shell commands you can run.

My rule for teams: never merge an AI-generated PR without a human checking:

workflow files

auth / security / secrets

migrations

public API changes

test quality, not just test count

Best practices for Developers

For design and implementation

Start with plan mode for anything that touches architecture, multiple files, or contracts. Use plan mode in Copilot CLI rather than letting it jump straight to code.

Make Copilot explain the existing pattern before changing it. That keeps it anchored to your codebase instead of generic best practices. This is straight from the “codebase Q&A first” idea.

Ask for tests first, then implementation. GitHub’s prompt library has a generate-unit-tests pattern, and Boris’s workflow explicitly recommends target-based iteration.

Use custom instructions plus path-specific instructions so backend and frontend conventions do not bleed into each other.

Create at least one custom agent for “implementation” and one for “review.” GitHub supports custom agents across coding agent and CLI.

For local work in Copilot CLI

Use @file references aggressively to keep prompts concrete. GitHub documents this for Copilot CLI.

Use the default CLI agents intentionally: Explore for reading, Task for tests/builds, Code-review for a second pass, and General-purpose for bigger reasoning-heavy tasks.

Use narrow permissions, not blanket approval. --allow-all-tools is powerful and risky.

For PRs

Treat Copilot like a junior-to-mid engineer with great speed and uneven judgment: request changes in PR comments, batch feedback, and keep acceptance criteria explicit. GitHub’s workflow is built around that loop.

Run Copilot code review or use a review prompt file before asking humans for final approval. GitHub supports code review on GitHub.com, mobile, VS Code, Visual Studio, Xcode, and JetBrains.

Best practices for QA

For bug reporting

Make the issue assignment-quality from the start: exact repro steps, expected vs actual, environment, logs, screenshots, severity, and what test should catch this in the future. Because Copilot only ingests the issue/comments present at assignment time, incomplete issues create worse PRs.

For UI bugs, attach screenshots or design references instead of only describing the problem in words. GitHub explicitly supports visual inputs for coding agent tasks.

For regression prevention

Ask for a failing regression test first: unit, integration, or Playwright depending on bug type. That is the cleanest way to operationalize the video’s feedback-loop principle.

Use Copilot code review or a dedicated review prompt to focus on negative cases, flaky behavior, missing assertions, accessibility, and contract regressions. GitHub’s review prompt examples and code-review feature are built for this.

For PR verification

Review the session log when something looks odd. GitHub exposes live and past session logs specifically so you can understand Copilot’s approach.

Put additional clarifications on the PR with @copilot, not back on the issue. Batch review comments so Copilot responds once to the full set.

Manually inspect workflow changes and any secrets-adjacent edits before allowing workflows to run. GitHub calls this out directly.

What I would standardize for your team next week

Repo instructions

.github/copilot-instructions.md

.github/instructions/api.instructions.md

.github/instructions/web.instructions.md

AGENTS.md


Prompt files

onboarding-plan.prompt.md

review-code.prompt.md

generate-unit-tests.prompt.md

bug-triage.prompt.md
GitHub ships examples for onboarding, code review, and unit test generation.

Custom agents

dev-implementer.agent.md

qa-verifier.agent.md

security-review.agent.md


Setup file

copilot-setup-steps.yml so the agent can build/test fast in its ephemeral environment.

CLI norms

Plan mode by default for non-trivial tasks

/fleet only for independent sub-work

Narrow tool permissions

No autopilot on sensitive repos without explicit justification.

Metrics

issue-to-PR time

number of PR review cycles

% of AI PRs with added tests

% of AI PRs requiring workflow/manual rollback
GitHub’s CLI best-practices guide explicitly suggests measuring workflow outcomes like issue-to-PR time, review cycles, and test improvements.

My distilled rule set for your team

Ask questions before asking for code

Plan before coding

Tests or screenshots before trusting

Put stable rules in files

Use PR comments as the refinement loop

Parallelize only independent work

Keep humans on approvals and risky changes

That is the part of the Claude/boris workflow that ports very cleanly to Copilot

Here’s the merged operating model I’d give your team.

1. Make plan-first the default for anything non-trivial

For your team, “non-trivial” means any change that touches multiple files, changes API behavior, alters a stored procedure or DB contract, changes Angular layout/theme behavior, or has production impact. Omer’s gist says plan mode should be the default for these cases, and both Claude repos reinforce that with explicit planning, gated phases, and handoff plans. This also transfers cleanly to Copilot CLI, which now has a real plan mode and recommends planning before coding.

My adaptation for you is simple: for medium+ changes, do RPI:

Research: where is the existing pattern, what contracts are affected, what could break?

Plan: smallest safe slice, tests, rollback.

Implement: one slice at a time, with verification after each slice.

That comes straight from shanraisshan’s RPI workflow and lines up almost perfectly with Omer’s checklist template.

2. No “done” without a verification story

This is the single best idea across all three sources. Omer says never mark complete without evidence and defines done as behavior matching criteria plus tests/lint/typecheck/build, plus a short verification story. ykdojo pushes the same idea through tests, visual diffing, draft PRs, and “double-check every claim.” shanraisshan also pushes phase gates and explicit tests in planning.

For your stack, that means:

Backend bug fix: repro, root cause, regression test, build/test, manual check against the affected endpoint or job.

Stored procedure change: parameter contract checked, result shape checked, timeout/perf risk noted, rollback noted.

Angular change: visual verification, keyboard/focus/accessibility check, theme compliance check, responsive behavior check.

QA signoff: expected vs actual, regression coverage, verification evidence.

3. Keep AI instructions short, layered, and repo-local

Both Claude repos push for concise instruction files, and ykdojo is explicit that you should start simple and only add repeated guidance over time. GitHub Copilot supports repository-wide instructions in .github/copilot-instructions.md, path-specific instructions in .github/instructions/*.instructions.md, and prompt files in .github/prompts/*.prompt.md in both VS Code and Visual Studio; Copilot CLI can also use AGENTS.md and additional instruction directories. GitHub also warns against conflicting layered instructions because behavior can become non-deterministic.

That means your Azure DevOps repos should still contain a .github folder purely as a local AI instruction convention. Hosting in Azure Repos does not prevent that local editor behavior. My recommendation is:

.github/
  copilot-instructions.md
  instructions/
    backend.instructions.md
    frontend.instructions.md
    sql.instructions.md
    couchbase.instructions.md
    tests.instructions.md
  prompts/
    bugfix.prompt.md
    pr-review.prompt.md
    api-contract-review.prompt.md
    sql-sp-change.prompt.md
    angular-theme-review.prompt.md
docs/ai/
  lessons.md
4. Prefer task-specific workflows over generic “personas”

One of the best repo0 takeaways is “don’t create vague generic agents like backend engineer or QA; make them feature- or task-specific.” In Claude land that means commands, subagents, and skills. In your world, that maps better to prompt files and focused instruction files than to a zoo of anthropomorphic agents.

So instead of “backend engineer agent,” use:

sql-sp-change.prompt.md

api-contract-review.prompt.md

incident-root-cause.prompt.md

angular-theme-review.prompt.md

qa-regression.prompt.md

That is more specific, easier to review, and much easier to keep aligned with your actual architecture.

5. Backend repos: optimize for Visual Studio, contracts, and data boundaries

Visual Studio supports repo-wide and path-specific Copilot custom instructions, and Copilot prompt files are available there in preview. Copilot code review in Visual Studio requires version 17.14 or later and can review local changes directly in the IDE.

For your backend services, I would encode these rules in the repo:

Follow the existing .NET Core / .NET Framework toolkit patterns before inventing new abstractions.

Preserve API contracts unless the task explicitly includes a contract/versioning change.

Prefer existing EF access patterns for ordinary data access.

Treat stored procedures as intentional architecture, not as something to “clean up” unless there is an explicit redesign task.

For SQL or Couchbase changes, require an integration-style verification step because those are boundary layers, and Omer’s gist explicitly recommends integration tests at DB/network boundaries.

The backend review mantra I’d enforce is: Would a staff engineer approve this diff and the verification story? That line from the gist is exactly the right bar for enterprise microservices.

6. Frontend repos: optimize for VS Code, theme discipline, and visual verification

VS Code supports repo-wide instructions, path-specific instructions, and AGENTS.md for agent workflows. It also supports Copilot code review on uncommitted changes directly from Source Control. Microsoft’s Azure DevOps MCP Server is now generally available, and Microsoft’s release notes specifically position it as a way for GitHub Copilot in VS Code to access Azure DevOps work items, pull requests, builds, test plans, and more.

For your Angular repos, I’d be very explicit:

Use the custom theme and its primitives like .grid.

Do not replace theme behavior with ad hoc CSS unless the task is to change the theme itself.

Preserve accessibility, error states, empty states, focus flow, and predictable interactions.

Use screenshots/mockups/evidence for UI bugs, because both the Claude repos and Omer’s gist strongly favor visual verification and accessibility-aware review.

One very practical rule from ykdojo that I’d make standard for frontend work: when AI generates too much code or over-abstracts a component, ask it directly to simplify and explain every non-obvious line. That habit is worth institutionalizing.

7. QA should adopt the bugfix template more than the devs

Of the three sources, the gist is strongest for QA process. Its bug-fix flow is reproduce → isolate root cause → fix → add regression coverage → verify, and it even gives a bugfix template with repro, expected/actual, root cause, regression coverage, and risk/rollback notes. That is a great Azure DevOps bug/work-item template.

I’d adapt it for your team as:

Repro steps

Expected vs actual

Service / endpoint / screen

Data conditions

Suspected layer: UI / API / DB / build / environment

Regression test to add

Verification performed

Risk / rollback

QA can also benefit a lot from the Azure DevOps MCP server in VS Code because Microsoft explicitly calls out generating test cases from work item descriptions and accessing builds/test plans/work items.

8. Parallelize only independent work

All three sources like parallelism, but the safe version is narrower than many people assume. Omer says use subagents for exploration, pattern discovery, triage, and research with concrete deliverables. ykdojo recommends multitasking, worktrees, and background tasks. GitHub’s /fleet docs say the same thing in Copilot land: parallel work only helps when the plan has separable parts.

For your team, parallelize only when the tasks are independent:

one agent/session exploring existing patterns,

one reviewing risks,

one drafting tests,

one implementing in a separate worktree.

Do not parallelize same-file edits or tightly coupled refactors.

9. Keep a lightweight lessons log, but don’t turn product repos into scratchpads

The gist’s tasks/lessons.md idea is excellent. I would keep the durable lessons in the repo, and keep the ephemeral task checklists in Azure DevOps work items or PR descriptions unless the task is unusually complex. That keeps the audit trail without polluting every repo with temporary AI scratch files.

A good docs/ai/lessons.md for your services would capture things like:

stored proc quirks,

API backward-compatibility traps,

Couchbase key/TTL rules,

theme/layout do-not-break rules,

known flaky test patterns,

build pipeline gotchas.

10. Make “least privilege” and command auditing part of the standard

This is where enterprise teams usually get sloppy with AI tools. Omer’s gist says never introduce secrets into code/logs/chat and prefer least privilege. ykdojo explicitly warns about approved commands after a case where a user’s home directory was wiped. shanraisshan’s permissive config is exactly why this needs to be policy, not personal preference.

For your team I would make these non-negotiable:

no broad auto-approval on developer machines by default,

no committed secrets or tokenized URLs in AI config,

no auto-running package managers, git push, or destructive shell commands without explicit review,

periodic review of approved commands and MCP servers,

keep the MCP server list small.

