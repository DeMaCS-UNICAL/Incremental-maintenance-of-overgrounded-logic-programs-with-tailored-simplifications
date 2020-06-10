alpha(V) :- now(NN), alpha_at(V,NN).
alpha_at(V,NN) :- now(NN), alpha(V).
done :- fifo.
done :- lfu.
done :- lru.
fifo :- w_te_1000_b_low, w_te_1000_d_rtm50.
finish :- w_te_2_d_off, done.
finish :- w_te_2_d_off, random.
high :- now(NN), high_at(NN).
high_at(NN) :- now(NN), high.
high_at(T) :- value(V), w_te_1000_at_T_alpha_at(V,T), 18 <= V.
lfu :- w_te_1000_b_high.
low :- now(NN), low_at(NN).
low_at(NN) :- now(NN), low.
low_at(T) :- value(V), w_te_1000_at_T_alpha_at(V,T), V <= 12.
lru :- w_te_1000_b_mid.
mid :- now(NN), mid_at(NN).
mid_at(NN) :- now(NN), mid.
mid_at(T) :- value(V), w_te_1000_at_T_alpha_at(V,T), 12 <= V, V < 18.
off :- now(NN), off_at(NN).
off_at(NN) :- now(NN), off.
random :- not done.
rtm50 :- now(NN), rtm50_at(NN).
rtm50_at(NN) :- now(NN), rtm50.
spoil_te_1000_high :- high, now(NN), NN - X >= 0, not high_at(NN - X),number(X).
spoil_te_1000_low :- low, now(NN), NN - X >= 0, not low_at(NN - X),number(X).
spoil_te_1000_mid :- mid, now(NN), NN - X >= 0, not mid_at(NN - X),number(X).
w_te_1000_at_T_alpha_at(V,NN - X) :- now(NN), alpha_at(V,NN - X), number(X).
w_te_1000_at_T_alpha_at(V,NN) :- now(NN), alpha_at(V,NN).
w_te_1000_b_high :- high, not spoil_te_1000_high.
w_te_1000_b_low :- low, not spoil_te_1000_low.
w_te_1000_b_mid :- mid, not spoil_te_1000_mid.
w_te_1000_d_rtm50 :- now(NN), rtm50_at(NN - X), number(X).
w_te_1000_d_rtm50 :- now(NN), rtm50_at(NN).w_te_2_d_off :- now(NN), off_at(NN - X),number_off_at(X).

#show done/0.
#show fifo/0.
#show finish/0.
#show lfu/0.
#show lru/0.
#show random/0.
#show off/0.
#show low/0.
#show mid/0.
#show high/0.
