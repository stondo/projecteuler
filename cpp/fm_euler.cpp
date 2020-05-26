
#include <iostream>
#include <vector>
#include <chrono>

int main(int argc, char* argv[]) {

    int N{};
    std::cout << " introduce grid side length (N): ";
    std::cin >> N;

    // actually you only need two arrays but i'll be lazy...
    std::vector<std::vector<int>> m(N,std::vector<int>(N+1));

    // time...
    const auto t_i=std::chrono::high_resolution_clock::now();

    // fill first row
    for (auto j{0}; j<=N; ++j) m[0][j]=j+1;

    for (auto i{1}; i<N; ++i) {

        m[i][0] = m[i-1][0];
        for (auto j{1}; j<=N; ++j) {

            m[i][j] = m[i][j-1] + m[i-1][j];
        }
    }
    // time's up
    const auto t_e=std::chrono::high_resolution_clock::now();

    std::cout << " num paths = " << m[N-1][N] <<"\n";
    std::cout << " execution time = " << std::chrono::duration<double,std::micro>(t_e-t_i).count() <<"us \n\n";
}
