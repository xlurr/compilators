#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "=== Тест синтаксического анализатора (ЛР2) ==="

# Проверяем, что есть Makefile
if [ ! -f Makefile ]; then
  echo -e "${RED}Makefile не найден. Запусти скрипт из директории проекта.${NC}"
  exit 1
fi

# Проверяем папку с тестами
if [ ! -d tests ]; then
  echo -e "${RED}Папка tests/ не найдена.${NC}"
  exit 1
fi

echo -e "${YELLOW}[*] Сборка проекта...${NC}"
make clean >/dev/null 2>&1
if ! make >/dev/null 2>&1; then
  echo -e "${RED}[!] Ошибка компиляции${NC}"
  exit 1
fi
echo -e "${GREEN}[+] Сборка успешна${NC}"
echo

POS_OK=0
POS_FAIL=0
NEG_OK=0
NEG_FAIL=0

echo -e "${YELLOW}[*] Позитивные тесты${NC}"
for f in tests/positive1.cpp tests/positive2.cpp tests/positive3.cpp; do
  if [ ! -f "$f" ]; then
    echo -e "${RED}  - Файл $f не найден, пропускаю${NC}"
    continue
  fi
  basename=$(basename "$f")
  echo "  - $basename"
  if ./syntax_analyzer "$f" --log "tests/$basename.log" --no-output >/dev/null 2>&1; then
    echo -e "    ${GREEN}OK${NC}"
    POS_OK=$((POS_OK+1))
  else
    echo -e "    ${RED}FAIL (должен был пройти)${NC}"
    POS_FAIL=$((POS_FAIL+1))
    ./syntax_analyzer "$f" 2>&1 | tail -5
  fi
done
echo

echo -e "${YELLOW}[*] Негативные тесты${NC}"
for f in tests/negative1.cpp tests/negative2.cpp tests/negative3.cpp; do
  if [ ! -f "$f" ]; then
    echo -e "${RED}  - Файл $f не найден, пропускаю${NC}"
    continue
  fi
  basename=$(basename "$f")
  echo "  - $basename"
  if ./syntax_analyzer "$f" --log "tests/$basename.log" --no-output >/dev/null 2>&1; then
    echo -e "    ${RED}FAIL (должен был упасть)${NC}"
    NEG_FAIL=$((NEG_FAIL+1))
  else
    echo -e "    ${GREEN}OK (ошибка поймана)${NC}"
    ./syntax_analyzer "$f" 2>&1 | grep -A3 "PARSING FAILED" || true
    NEG_OK=$((NEG_OK+1))
  fi
done
echo

echo "=== Итоги ==="
echo -e "Позитивные: ${GREEN}${POS_OK} OK${NC}, ${RED}${POS_FAIL} FAIL${NC}"
echo -e "Негативные: ${GREEN}${NEG_OK} OK${NC}, ${RED}${NEG_FAIL} FAIL${NC}"

TOTAL_OK=$((POS_OK+NEG_OK))
TOTAL=$((POS_OK+POS_FAIL+NEG_OK+NEG_FAIL))

if [ "$TOTAL" -gt 0 ] && [ "$TOTAL_OK" -eq "$TOTAL" ]; then
  echo -e "${GREEN}Все тесты прошли успешно.${NC}"
  exit 0
else
  echo -e "${YELLOW}Часть тестов не прошла, смотри вывод выше.${NC}"
  exit 1
fi
