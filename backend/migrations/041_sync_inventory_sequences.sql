SELECT setval(
  pg_get_serial_sequence('inventory_items', 'id'),
  COALESCE((SELECT MAX(id) FROM inventory_items), 0) + 1,
  false
);

SELECT setval(
  pg_get_serial_sequence('inventory_transactions', 'id'),
  COALESCE((SELECT MAX(id) FROM inventory_transactions), 0) + 1,
  false
);