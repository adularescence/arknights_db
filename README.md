## Arknights Base Skills DB
Schema, relation creation, and insertion queries for a bunch of operators' base skills.

#### Schema

*hq*(**hq_skill**, morale, trade, notes)

*plant*(**plant_skill**, efficiency)

*factory*(**factory_skill**, metal, record, originium, capacity, morale, notes)

*trade*(**trade_skill**, efficiency, capacity, morale, notes)

*dorm*(**dorm_skill**, self_morale, random_morale, all_morale)

*reception*(**reception_skill**, efficiency, focus)

*workshop*(**workshop_skill**, base, elite, skill, chip)

*office*(**office_skill**, efficiency)

*training*(**training_skill**, guard, medic, vanguard, caster, sniper, defender, supporter, specialist)

*operator*(**name**, **elite**, hq, plant, factory, trade, dorm, reception, workshop, office, training)