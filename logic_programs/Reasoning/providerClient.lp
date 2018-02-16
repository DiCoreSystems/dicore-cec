#external price(N) :- number(N).
#external diffValueJ(N) :- number(N).
#external adaptionCostJ(N) :- number(N).
#external adaptionCostI(N) :- number(N).
#external diffValueI(N) :- number(N).
#external priceDiffCompetitor(N) :- number(N).
#external evolutionCost(N) :- number(N).
#external evolvePrice(N) :- number(N).

strategy(provider, statusQuo).
strategy(provider, evolve).
strategy(provider, support).

strategy(client, adapt).
strategy(client, leave).

player(provider).
player(client).

number(1..100).

payoff(statusQuo, adapt, 0, 0).
payoff(statusQuo, leave, 0 - Poi, Vej - Pej - Caj)
            :- price(Poi), diffValueJ(Vej), priceDiffCompetitor(Pej), adaptionCostJ(Caj).
payoff(evolve, adapt, Pei - Ce, Vei - Pei - Cai)
            :- evolvePrice(Pei), evolutionCost(Ce), diffValueI(Vei), adaptionCostI(Cai).
payoff(evolve, leave, 0 - Poi - Ce, Vej - Pej - Caj)
            :- price(Poi), evolutionCost(Ce), diffValueJ(Vej), priceDiffCompetitor(Pej), adaptionCostJ(Caj).
payoff(support, adapt, PeiS - Ce - A * Cai, Vei - Pei - B * Cai)
            :- supportPrice(PeiS), evolutionCost(Ce), a(A), b(B), adaptionCostI(Cai), diffValueI(Vei), evolvePrice(Pei).
payoff(support, evolve, 0 - Poi - Ce - A * Cai, 0 - Caj - Pej - Caj)
            :- price(Poi), evolutionCost(Ce), a(A), adaptionCostI(Cai), adaptionCostJ(Caj) priceDiffCompetitor(Pej).

chosenStrategy(provider, S) :- strategy(provider, S), strategy(client, T), payoff(S, T, X, Y), max(provider, X).

chosenStrategy(client, T) :- strategy(provider, S), strategy(client, T), payoff(S, T, X, Y), max(client, Y).

max(provider, C) :- C = #max { X : payoff(S, T, X, Y) }, strategy(provider, S), strategy(client, T).
max(client, C) :- C = #max { Y : payoff(S, T, X, Y) }, strategy(provider, S), strategy(client, T).