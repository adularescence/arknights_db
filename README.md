## Arknights Base Skills DB
Schema, relation creation, and insertion queries for a bunch of operators' base skills.

#### Schema

*skill*(**skill_name**, skill_type, all_moral, efficiency, metal_efficiency, record_efficiency, originium_efficiency, capacity, notes, self_morale, random_morale, clue_focus, base_efficiency, elite_efficiency, skill_efficiency, chip_efficiency, guard, medic, vanguard, caster, sniper, defender, supporter, specialist)

*operator*(**op_name**, **elite**, skill_name)

### Examples

List non-elite operators by Precious Metal Formula related productivity:
```
SELECT op_name, skill_name, metal_efficiency
FROM operator NATURAL JOIN skill
WHERE skill_type = 'factory'
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
 Vigna      | Combat Guidance Video        |                0
 Vulcan     | Craftsmanship Spirit Alpha   |               -5
(17 rows)
```
---

Get the 3 most productive Trading Post operators (aside from Texas-Lappland-Exusiai):
```
SELECT op_name, skill_name, efficiency
FROM operator NATURAL JOIN skill
WHERE op_name NOT IN ('Texas', 'Lappland', 'Exusiai')
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
Well, I considered Yato's level 30 base skill to be an E1 skill, so it did actually return the optimal 3 E0 operators for Trading Posts. There are actually 5 E0 operators with 30% trading post productivity: Catapult, Yato, Gummy, Midnight, and Mousse.