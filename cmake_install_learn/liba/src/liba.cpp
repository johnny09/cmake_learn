#include "liba.h"

#include <spdlog/spdlog.h>

#include <iostream>
void print() {
  std::cout << "hello world" << std::endl;
  spdlog::info("Welcome to spdlog!");
  spdlog::error("Some error message with arg: {}", 1);
}