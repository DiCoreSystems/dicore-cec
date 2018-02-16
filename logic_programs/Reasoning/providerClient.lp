strategy(provider, statusQuo).
strategy(provider, evolve).
strategy(provider, support).

strategy(client, adapt).
strategy(client, leave).

player(provider).
player(client).

payoff(statusQuo, adapt, 0, 0).
payoff(statusQuo, leave, 0 - price, diffValueJ - priceDiffCompetitor - adaptionCostJ).
payoff(evolve, adapt, evolvePrice - evolutionCost, diffValueI - evolvePrice - adaptionCostI).
payoff(evolve, leave, 0 - price - evolutionCost, diffValueJ - priceDiffCompetitor - adaptionCostJ).
payoff(support, adapt, supportPrice - evolutionCost - a * adaptionCostI, diffValueI - evolvePrice - b * adaptionCostI).
payoff(support, evolve, 0 - price - evolutionCost - a * adaptionCostI - diffValueJ - priceDiffCompetitor - adaptionCostJ).