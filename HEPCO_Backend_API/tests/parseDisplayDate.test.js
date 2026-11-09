const test = require('node:test');
const assert = require('node:assert/strict');
const { parseDisplayDate } = require('../src/utils/parseDisplayDate');

test('parses dd/mm/yyyy with unpadded hours as Vietnam time', () => {
  assert.equal(parseDisplayDate('30/03/2026 9:27').toISOString(), '2026-03-30T02:27:00.000Z');
  assert.equal(parseDisplayDate('09/01/2022 8:51').toISOString(), '2022-01-09T01:51:00.000Z');
});

test('parses date-only, ISO and year-only values', () => {
  assert.equal(parseDisplayDate('14/06/2026').toISOString(), '2026-06-13T17:00:00.000Z');
  assert.equal(parseDisplayDate('2026-03-30 09:27').toISOString(), '2026-03-30T02:27:00.000Z');
  assert.equal(parseDisplayDate('2025').toISOString(), '2025-12-31T00:00:00.000Z');
});

test('recovers month/day/year strings and rejects garbage', () => {
  assert.equal(parseDisplayDate('11/22/2021 7:55').toISOString(), '2021-11-22T00:55:00.000Z');
  assert.equal(parseDisplayDate('not a date'), null);
  assert.equal(parseDisplayDate(''), null);
  assert.equal(parseDisplayDate(undefined), null);
});

test('newer dates always sort after older ones', () => {
  const dates = ['25/11/2021 8:00', '30/03/2026 9:27', '09/01/2022 8:51', '2025'].map((d) => parseDisplayDate(d).getTime());
  const sorted = [...dates].sort((a, b) => b - a);
  assert.deepEqual(sorted.map((t) => new Date(t).getUTCFullYear()), [2026, 2025, 2022, 2021]);
});
