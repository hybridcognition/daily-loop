# Memory Architecture Improvement Proposal

## Research Summary

Based on 2025 best practices for LLM agent memory architecture, modern systems implement:

**Three-tier memory structure:**
1. **Working Memory** (short-term): Current context within session
2. **Episodic Memory**: Time-stamped experiences ("Last Tuesday I helped debug X")
3. **Semantic Memory**: Factual knowledge, patterns, learned principles

**Key principles:**
- Self-organizing through "Intelligent Decay" (consolidate, prune based on relevance)
- Atomic memory units with rich contextual links
- Never rely on LLM weights for facts - externalize everything
- Balance structure with flexibility for evolution

## Proposed Solution - Within Existing Files

**No new files. Add instructions to existing structure:**

### 1. claude.md - Add "Memory Management Principles"
Location: After Core Principles section (line 106-115)

**What to add:**
- Permission to evolve memory structure (create subdirs, new file types, consolidate)
- Intelligent decay rules (archive logs >30 days, consolidate repetitive patterns)
- Cross-reference permission (link related insights across files)
- Memory type guidance: episodic (logs/), semantic (notes/decisions.md), working (pending_actions.md)

### 2. memory.md - Add "Self-Organization Rules"
Location: After "Notes for Agent" section (line 82-88)

**What to add:**
- When to create new files (thresholds: >50 related items, new category emerges)
- When to consolidate files (duplicate patterns, obsolete tracking)
- How to structure subdirectories (by category: insights/, patterns/, archived/)
- How to maintain cross-references (consistent linking format)
- Permission to update memory.md structure itself when system evolves

### 3. notes/decisions.md - Enhance to "Learning & Patterns"
**What to add (as header instructions):**
- Capture not just decisions but patterns observed
- Link to related episodes in logs/
- Extract reusable principles
- Mark patterns for consolidation when 3+ instances occur

### 4. overview.md - Add "Progress Insights" section
**What to add:**
- Space for agent to extract patterns from completed work
- Link successes to approaches used
- Identify what's working vs what's not
- Evolve strategy based on evidence

## Core Insight

Current system is a **filing cabinet** (rigid storage). Proposal transforms it into **living memory** (self-organizing system) by:
- Giving agent permission to restructure
- Defining when/how to evolve
- Maintaining structure while allowing growth
- Working within existing 14 files - no explosion

## Implementation Approach

1. Add instruction blocks to 4 existing files (not create new ones)
2. Each block: 5-10 lines, specific rules
3. Total addition: ~40 lines across existing structure
4. Maintains simplicity while enabling rich self-organization

## Why This Works

- Respects "don't add more markdown files" constraint
- Builds on proven 2025 agent memory patterns
- Gives explicit permission + rules for evolution
- Balances structure with adaptability
- Scales with project complexity naturally
