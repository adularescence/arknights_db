## Arknights Base Skills DB
Schema, relation creation, and insertion queries for a bunch of operators' base skills.

#### Schema
*operator*(**name**, **elite**, control, power, factory, trade, dorm, reception, workshop, office, training)

*control*(**name**, morale, trade, notes)

*power*(**name**, efficiency)

*factory*(**name**, metal, record, originium, capacity, morale, notes)

*trade*(**name**, efficiency, capacity, morale, notes)

*dorm*(**name**, self, random_st, all)

*reception*(**name**, efficiency, focus)

*workshop*(**name**, base, elite, skill, chip)

*office*(**name**, efficiency)

*training*(**name**, guard, medic, vanguard, caster, sniper, defender, supporter, specialist)