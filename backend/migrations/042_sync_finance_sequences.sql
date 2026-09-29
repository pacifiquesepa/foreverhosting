SELECT setval(
  pg_get_serial_sequence('expenses', 'id'),
  COALESCE((SELECT MAX(id) FROM expenses), 0) + 1,
  false
);

SELECT setval(
  pg_get_serial_sequence('budgets', 'id'),
  COALESCE((SELECT MAX(id) FROM budgets), 0) + 1,
  false
);