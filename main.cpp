#include <iostream>
#include <string>

struct People {
  int age;
  std::string name;
};

struct Student : public People {
  int score;
};

int main(void)
{
  Student s;
  return 0;
}
