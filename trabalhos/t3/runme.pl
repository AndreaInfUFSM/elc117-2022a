main :-
  Names = [alfredo, alice, eduardoF, eduardoM, 
           flavio, gilson, gregori, jhuan, joaocarlos, 
           joaodavi, luana, luishenrique, matheus, 
           mauro, pedrohenrique, ramon, raul, roberto, 
           andre, henrique, ivan, lucas, miguel, yuri],
           
  random_permutation(Names, Perm),
  length(Perm,Len),
  findall(X, between(1, Len, X), Xs),
  write_msg(Perm, Xs).

write_msg([H|T], [X|Xs]) :-
  atomic_list_concat(['#', X, ' para ', H], Msg),
  writeln(Msg),
  read_line_to_string(user_input, _),
  write_msg(T, Xs).
