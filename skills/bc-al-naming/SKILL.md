---
name: bc-al-naming
description: "Use when: creating new AL objects, fields, or actions. Enforces 30-character max naming rule and suffix conventions for BC extensions. Covers object names, table/page extension fields and actions, AppSourceCop suffix lookup."
argument-hint: "Apply when generating or reviewing AL object/field/action names"
user-invocable: true
---
# BC AL Naming Rules

## When to Use
- Creating new AL objects (tables, pages, codeunits, enums, reports, queries, etc.)
- Adding fields or actions to table extensions or page extensions
- Reviewing AL code for naming compliance
- Any time an agent generates a new AL identifier that appears in the app manifest

## Procedure

1. **Enforce the 30-character limit (including suffix and spaces):**
   - Count all characters in the quoted identifier including the suffix and any separating space.
   - Maximum allowed: **30 characters**.
   - If a name exceeds 30 characters, shorten the base name. Prefer abbreviation over truncation. Keep readability.

2. **Require ToolTip on every new field:**
   - Every new field (whether in a new table or a table extension) must have a `ToolTip` property.
   - The ToolTip text must begin with **"Specify"** (not "Specifies").
   - Example: `ToolTip = 'Specify the number of loyalty points earned by this customer.';`

## Examples

Given suffix = `ABC`:

```al
// Object name: "Loyalty Points Setup ABC" = 24 chars ✓
table 70100 "Loyalty Points Setup ABC" { ... }

// Table extension field: "Special Instructions ABC" = 25 chars ✓
tableextension 70100 "Sales Header ABC" extends "Sales Header"
{
    fields
    {
        field(70100; "Special Instructions ABC")
        {
            Caption = 'Special Instructions';
            ToolTip = 'Specify the special instructions for this sales order.';
            DataClassification = CustomerContent;
        }
    }
}

// Too long — WRONG: "Customer Loyalty Tier Override ABC" = 34 chars ✗
// Shortened: "Cust. Loyalty Tier Ovrd ABC" = 28 chars ✓
```

## Quick Reference

- Max length: **30 characters** (total, including affix)
- ToolTip: required on all new fields, must start with **"Specify"**
