#external random(N): number(N).

number(1..100).

strategy(rock).
strategy(paper).
strategy(scissors).

chanceFor(rock, 0, 20).
chanceFor(paper, 60, 100).
chanceFor(scissors, 20, 40).

payoff(rock, rock, 0, 0).
payoff(rock, paper, -1, 1).
payoff(rock, scissors, 1, -1).
payoff(paper, rock, 1, -1).
payoff(paper, paper, 0, 0).
payoff(paper, scissors, -1, 1).
payoff(scissors, rock, -1, 1).
payoff(scissors, paper, 1, -1).
payoff(scissors, scissors, 0, 0).

player(1, S) :- strategy(S), random(N), chanceFor(S, Min, Max), Min < N, N < Max.
player(2, S) :- strategy(S), strategy(T), player(1, T), payoff(T, S, -1, 1).

