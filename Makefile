CC = clang++ -O3 -DNDEBUG -std=c++11

bin/idock: obj/utility.o obj/thread_pool.o obj/scoring_function.o obj/atom.o obj/receptor.o obj/ligand.o obj/main.o
	$(CC) -o $@ $^ -pthread -lboost_system -lboost_program_options -lboost_filesystem -lboost_timer

obj/%.o: src/%.cpp 
	$(CC) -o $@ $< -c

clean:
	rm -f bin/idock obj/*.o
