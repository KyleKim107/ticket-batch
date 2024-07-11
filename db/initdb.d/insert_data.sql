USE pass_local;

INSERT INTO package (package_name, count, period, created_at) VALUES
('Starter PT 10 Sessions', 10, 60, '2022-08-01 00:00:00'),
('Starter PT 20 Sessions', 20, 120, '2022-08-01 00:00:00'),
('Starter PT 30 Sessions', 30, 180, '2022-08-01 00:00:00'),
('Free Event Pilates 1 Session', 1, NULL, '2022-08-01 00:00:00'),
('Body Challenge PT 4 Weeks', 8, 32, '2022-08-01 00:00:00'),
('Body Challenge PT 8 Weeks', 16, 64, '2022-08-01 00:00:00'),
('InBody Consultation', 10, NULL, '2022-08-01 00:00:00');


INSERT INTO user (user_id, user_name, status, phone, meta, created_at) VALUES
('A1870662', 'MATTHEW', 'INACTIVE', '001-753-805-0946x6218', NULL, '2022-12-12 01:32:49'),
('A7455577', 'LESLIE', 'INACTIVE', '001-678-739-2513x6758', NULL, '2023-11-09 02:11:47'),
('A1101864', 'DANIEL', 'INACTIVE', '420-261-8766', NULL, '2023-01-23 12:11:10'),
('A9402330', 'MARISA', 'INACTIVE', '801.412.1105x95276', NULL, '2023-10-31 05:23:11'),
('A7036196', 'DEVIN', 'ACTIVE', '+1-526-883-7423x543', NULL, '2023-06-01 13:17:47'),
('A8271349', 'JENNIFER', 'ACTIVE', '07415876656', NULL, '2024-03-14 08:32:17'),
('A4682934', 'DAVID', 'INACTIVE', '001-246-941-0610x665', NULL, '2022-10-19 15:19:22'),
('A1930275', 'AMANDA', 'ACTIVE', '507.526.3702', NULL, '2023-04-17 21:03:55');



INSERT INTO user_group_mapping (user_group_id, user_id, user_group_name, description, created_at) VALUES
('PT_GROUP_1', 'A1870662', 'Alphabet', 'Alphabet EMPLOYEES', '2024-02-28 20:15:37'),
('PT_GROUP_2', 'A7455577', 'PayPal', 'PayPal EMPLOYEES', '2024-04-03 05:57:53'),
('PT_GROUP_3', 'A1101864', 'Disney', 'Disney EMPLOYEES', '2023-05-06 20:52:57'),
('PT_GROUP_4', 'A7036196', 'Cisco Systems', 'Cisco Systems EMPLOYEES', '2023-10-25 01:23:53'),
('PT_GROUP_5', 'A1930275', 'American Express', 'American Express EMPLOYEES', '2023-02-01 09:53:44');


INSERT INTO booking (pass_seq, user_id, status, used_pass, attended, started_at, ended_at, cancelled_at, created_at, modified_at) VALUES
(1, 'user01', 'READY', 1, 1, NOW(), NOW() + INTERVAL 1 HOUR, NULL, NOW(), NULL),
(2, 'user02', 'CANCELLED', 0, 0, NOW(), NOW() + INTERVAL 1 HOUR, NOW() - INTERVAL 30 MINUTE, NOW(), NOW() - INTERVAL 30 MINUTE),
(3, 'user03', 'COMPLETED', 1, 1, NOW(), NOW() + INTERVAL 1 HOUR, NULL, NOW(), NOW() + INTERVAL 1 HOUR),
(4, 'user04', 'READY', 1, 0, NOW() + INTERVAL 1 DAY, NOW() + INTERVAL 1 DAY + INTERVAL 1 HOUR, NULL, NOW(), NULL),
(5, 'user05', 'CANCELLED', 0, 0, NOW() + INTERVAL 1 DAY, NOW() + INTERVAL 1 DAY + INTERVAL 1 HOUR, NOW() + INTERVAL 1 DAY - INTERVAL 30 MINUTE, NOW(), NOW() + INTERVAL 1 DAY - INTERVAL 30 MINUTE),
(6, 'user06', 'COMPLETED', 1, 1, NOW() + INTERVAL 2 DAY, NOW() + INTERVAL 2 DAY + INTERVAL 1 HOUR, NULL, NOW(), NOW() + INTERVAL 2 DAY + INTERVAL 1 HOUR),
(7, 'user07', 'READY', 1, 1, NOW() + INTERVAL 3 DAY, NOW() + INTERVAL 3 DAY + INTERVAL 1 HOUR, NULL, NOW(), NULL);

INSERT INTO booking (pass_seq, user_id, status, used_pass, attended, started_at, ended_at, cancelled_at, created_at, modified_at) VALUES
(8, 'user08', 'CANCELLED', 0, 0, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY, NOW(), NULL),
(9, 'user03', 'CANCELLED', 0, 0, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY, NOW(), NULL),
(10, 'user01', 'CANCELLED', 0, 0, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY, NOW(), NULL),
(11, 'user01', 'COMPLETED', 0, 1, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY, NOW(), NULL),
(12, 'user01', 'COMPLETED', 0, 1, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY, NOW(), NULL),
(13, 'user01', 'COMPLETED', 0, 1, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY, NOW(), NULL),
(14, 'user01', 'COMPLETED', 0, 1, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY, NOW(), NULL);

INSERT INTO statistics (statistics_at, all_count, attended_count, cancelled_count) VALUES
(DATE_SUB(NOW(), INTERVAL 2 DAY), 5, 3, 2),
(DATE_SUB(NOW(), INTERVAL 3 DAY), 5, 3, 2),
(DATE_SUB(NOW(), INTERVAL 4 DAY), 5, 3, 2),
(DATE_SUB(NOW(), INTERVAL 5 DAY), 5, 3, 2),
(DATE_SUB(NOW(), INTERVAL 6 DAY), 5, 3, 2),
(DATE_SUB(NOW(), INTERVAL 7 DAY), 5, 3, 2),
(DATE_SUB(NOW(), INTERVAL 8 DAY), 5, 3, 2),
(DATE_SUB(NOW(), INTERVAL 9 DAY), 5, 3, 2),
(DATE_SUB(NOW(), INTERVAL 10 DAY), 5, 3, 2);




INSERT INTO bulk_pass (package_seq, user_group_id, status, count, started_at, ended_at, created_at, modified_at) VALUES
(1, 'PT_GROUP_1', 'COMPLETED', 20, '2024-04-01 00:00:00', '2024-06-30 23:59:59', CURRENT_TIMESTAMP, NULL),
(2, 'PT_GROUP_2', 'COMPLETED', 10, '2024-03-01 00:00:00', '2024-06-30 23:59:59', CURRENT_TIMESTAMP, NULL),
(3, 'PT_GROUP_3', 'COMPLETED', 50, '2024-02-01 00:00:00', '2024-06-11 23:59:59', CURRENT_TIMESTAMP, NULL),
(4, 'PT_GROUP_4', 'COMPLETED', 20, '2024-01-01 00:00:00', '2024-05-31 23:59:59', CURRENT_TIMESTAMP, NULL),
(5, 'PT_GROUP_5', 'COMPLETED', 3, '2024-01-01 00:00:00', '2024-03-31 23:59:59', CURRENT_TIMESTAMP, NULL);

