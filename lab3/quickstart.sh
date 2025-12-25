#!/bin/bash
# Quick start script for Code Generator Lab

set -e

echo "╔════════════════════════════════════════════════════════════╗"
echo "║   CODE GENERATOR LAB - QUICK START SCRIPT                 ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Create required directories
mkdir -p bin output test

echo "► Building project..."
make clean
make
echo "✓ Build successful!"
echo ""

echo "► Running Example 1: Simple Arithmetic"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
./bin/compiler test/example1.txt -o output/example1.tac
echo ""

echo "► Running Example 2: Loops and Conditionals"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
./bin/compiler test/example2.txt -o output/example2.tac
echo ""

echo "► Running Example 3: Optimization Demo"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
./bin/compiler test/example3.txt -o output/example3.tac
echo ""

echo "► Running Example 4: Factorial (Complex)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
./bin/compiler test/example4.txt -o output/example4.tac
echo ""

echo "► Running Negative Tests (Error Handling)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Test 1: Type Mismatch"
./bin/compiler test/error1.txt 2>&1 | head -20
echo ""
echo "Test 2: Undefined Variable"
./bin/compiler test/error2.txt 2>&1 | head -20
echo ""

echo "✓ All tests completed!"
echo ""
echo "Generated TAC files:"
ls -1 output/*.tac 2>/dev/null || echo "  (no files generated)"
echo ""
