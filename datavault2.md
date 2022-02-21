# Data Vault 2.0 Training Notes

## Three Foundational Pillars

 - Methodology
   - Consistent
   - Repeatable
   - Pattern Based
   - Implementation belongs in this pillar
 - Architecture
   - Multi-tier
   - Scalable
   - Supports nosql
 - Modelling
   - Flexible
   - Scalable (Big Data)
   - Hub & spoke

## Exam Warnings
 - Remember the difference between a `standard` and a `best practice`
 - Standards are required
 - Best practices are based on recommendation but not necessarily required
 - Multi choice points can have point deduction if incorrect options are selected
 - All answers are worth 1 point
 - Practitioner level exam

## Architecture
 -

## Hard and Soft Rules

Be prepared to give/understand examples of each of these

### Hard Rules
 - Any rule that does not change content of individual fields or grain
 - examples
   - Data Type alignment
   - tagging
   - deduping
   - \[de\]normalization

### Soft Rules
 - Change/interprets data
 - Grain of data changes
 - examples
   - Aggregation
   - Concatenation
   - Coalesce and consolidate

# Entity Types

## Hubs
 - Hubs are a unique list of BK

## Link
 - Unique list of relationships
 - Shows keys that relate to each other / or at least related to each other at some point in time, doesn't matter when

## Satellite
 - Descriptive data (over time)
 - Hash diff driven
 - You can have a satellite on top of a link or a hub
 - Relationships are business rules and satellites can capture when relationships changed
