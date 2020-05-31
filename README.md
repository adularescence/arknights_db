## Arknights Base Skills DB
Schema, relation creation, and insertion queries for a bunch of Operators' Base skills.

I (think) I have added all the Operators and skills as of the "Code of Brawl" Event (May 31, 2020).

Data is copied from https://aceship.github.io/AN-EN-Tags/akhrchars.html.

### Usage
Copy and paste the contents of:

- `relation_creation.sql`
- `skill_insertion.sql`
- `operator_insertion.sql`

into your database of choice, in that order.

##### General query:

I use `PostgreSQL 12.2`, dunno how it would look for other SQL implementations:
```
SELECT op_name, elite, skill_name,
    comma, separated, attributes, of, interest // see Attributes of Interest / Attribute Meanings
FROM skill NATURAL JOIN operator
WHERE
    op_name IN ('your', 'available', 'operators') AND
    (elite = 0 OR elite = 1 OR elite = 2) AND // filter by elite level
    skill_type = 'one of the skill types' // see Skill Types
ORDER BY <attribute to order by> DESC
LIMIT <# of Operators>;
```

<details>
<summary>Skill Types</summary>

- `'hq'`: Control Center
- `'power'`: Power Plant
- `'factory'`: Factory
- `'trade'`: Trading Post
- `'dorm'`: Dormitory
- `'reception'`: Reception Room
- `'workshop'`: Workshop
- `'office'`: Office
- `'training'`: Training Room
</details>

<details>
<summary>Attributes of Interest / Attribute Meanings</summary>

`'hq'` attributes:
- `efficiency`: all Trade Posts' order acquisition efficiency modifier
- `all_morale`: morale consumed per hour modifier , for all Control Center Operators
- `notes`: special conditions

`'power'` attributes:
- `efficiency`: drone recharge rate modifier

`'factory'` attributes:
- `metal_efficiency`: Precious Metal productivity modifier
- `record_efficiency`: Battle Record productivity modifier
- `originium_efficiency`: Originium Materials productivity modifier
- `capacity`: capacity limit modifier
- `self_morale`: morale consumed per hour modifier, for Operator
- `notes`: special conditions

`'trade'` attributes:
- `efficiency`: order acquisition efficiency modifier
- `capacity`: order limit modifier
- `self_morale`: morale consumed per hour modifier, for Operator
- `notes`: special conditions

`'dorm'` attributes:
- `self_morale`: self morale recovered per hour modifier
- `random_morale`: randomly pick one Operator in Dormitory to gain an additional &lt;value&gt; morale, once per hour
- `all_morale`: morale recovered per hour modifier for all Operators in that Dormitory

`'reception'` attributes:
- `efficiency`: Clue search speed modifier
- `clue_focus`: increases the chance of finding Clue #&lt;value&gt;

`'workshop'` attributes:
- `building_efficiency`: byproduct chance modifier for Building Material
- `upgrade_efficiency`: byproduct chance modifier for Upgrade Material
- `skill_efficiency`: byproduct chance modifier for Skill Summary
- `chip_efficiency`: byproduct chance modifier for Chip

`'office'` attributes:
- `efficiency`: HR accumulation speed modifier

`'training'` attributes:
- `guard`: Guard Operators' Specialization training speed modifier
- `medic`: Medic Operators' Specialization training speed modifier
- `vanguard`: Vanguard Operators' Specialization training speed modifier
- `caster`: Caster Operators' Specialization training speed modifier
- `sniper`: Sniper Operators' Specialization training speed modifier
- `defender`: Defender Operators' Specialization training speed modifier
- `supporter`: Supporter Operators' Specialization training speed modifier
- `specialist`: Specialist Operators' Specialization training speed modifier
</details>

### Schema

*skill*(**skill_name**, skill_type, all_morale, efficiency, metal_efficiency, record_efficiency, originium_efficiency, capacity, notes, self_morale, random_morale, clue_focus, base_efficiency, elite_efficiency, skill_efficiency, chip_efficiency, specialist, medic, vanguard, caster, sniper, defender, supporter, specialist)

*operator*(**op_name**, **elite**, **skill_name**)

### Examples
<details>
<summary>List E0 Operators by Precious Metal Formula related productivity:</summary>

```
SELECT op_name, skill_name, metal_efficiency
FROM operator NATURAL JOIN skill
WHERE
    skill_type = 'factory'
    AND elite = 0
ORDER BY metal_efficiency DESC;
```
Output:
```
  op_name   |          skill_name          | metal_efficiency
------------+------------------------------+------------------
 Haze       | Metalwork Alpha              |               30
 Jessica    | Standardization Beta         |               25
 Kroos      | Slowcoach                    |               25
 Vanilla    | Standardization Beta         |               25
 Popukar    | Troublemaker                 |               25
 Fang       | Hothead                      |               25
 Silence    | Rhine Tech Alpha             |               15
 Ptilopsis  | Rhine Tech Alpha             |               15
 Meteor     | Standardization Alpha        |               15
 Beagle     | Warehouse Organization Alpha |               10
 Cardigan   | Warehouse Organization Alpha |               10
 Cuora      | Warehouse Organization Beta  |               10
 Noir Corne | Warehouse Organization Beta  |               10
 FEater     | Combat Guidance Video        |                0
 Eyjafjalla | Volcanologist                |                0
 Vermeil    | Junkman                      |                0
 Vigna      | Combat Guidance Video        |                0
 Vulcan     | Craftsmanship Spirit Alpha   |               -5
(18 rows)
```
</details>

---

<details>
<summary>Get the 3 most productive Trading Post E0 Operators (aside from Texas-Lappland-Exusiai):</summary>

```
SELECT op_name, skill_name, efficiency
FROM operator NATURAL JOIN skill
WHERE
    op_name NOT IN ('Texas', 'Lappland', 'Exusiai')
    AND skill_type = 'trade'
    AND elite = 0
ORDER BY efficiency DESC
LIMIT 3;
```
Output:
```
 op_name  |  skill_name   | efficiency
----------+---------------+------------
 Gummy    | Communication |         30
 Midnight | Communication |         30
 Catapult | Communication |         30
(3 rows)
```
Well, I considered Yato's level 30 base skill to be an E1 skill, so it did actually return the optimal 3 E0 Operators for Trading Posts. There are actually 5 E0 Operators with 30% trading post productivity: Catapult, Yato, Gummy, Midnight, and Mousse.
</details>

---

<details>
<summary>Get Operators with dorm-wide morale gain skills:</summary>

```
SELECT op_name, elite, skill_name, all_morale
FROM operator NATURAL JOIN skill
WHERE
    skill_type = 'dorm' AND
    all_morale != 0;
```
Output:
```
   op_name   | elite |    skill_name    | all_morale 
-------------+-------+------------------+------------
 Amiya       |     2 | Violin Solo      |       0.15
 Durin       |     0 | Laziness         |       0.20
 Durin       |     1 | Sleepiness       |       0.25
 Nightingale |     0 | Inspiration      |       0.10
 Nightingale |     2 | Lady of the Lamp |       0.20
 Siege       |     0 | Leader           |       0.15
 Siege       |     2 | Lionheart        |       0.20
 Sora        |     0 | Idol             |       0.15
 Zima        |     0 | Leader           |       0.15
 Zima        |     2 | General Zima     |       0.20
(10 rows)
```
</details>
