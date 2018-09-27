#include <iostream>
#include <string>

struct Student {
  int age;
  std::string name;

public:
  Student() {
    age = 0;
    name = "";
  }
};

int main(int argc, char *argv[]) {
  std::cout << std::endl;
  for (int i = 0; i < 100; i++) {
    std::cerr << std::endl;
  }
  return 0;
}

