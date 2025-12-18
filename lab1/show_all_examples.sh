#!/bin/bash

echo "ДЕМОНСТРАЦИЯ ВСЕХ ПРИМЕРОВ"
echo ""

echo "1 Простой код (test.cpp):"
echo "--------------------------------------"
cat test.cpp
echo ""
echo "результат:"
./lexer test.cpp output1.md
head -20 output1.md
echo ""
echo ""

echo "test_hello.cpp"
cat test_hello.cpp
echo ""
echo "результа:"
./lexer test_hello.cpp output2.md
head -25 output2.md
echo ""
echo ""

echo "полноценный кодt test_input.cpp"
head -15 test_input.cpp
echo "... (остальное)"
echo ""
echo "резалт:"
./lexer test_input.cpp output3.txt
head -35 output3.txt
echo ""

echo "все гуд"

