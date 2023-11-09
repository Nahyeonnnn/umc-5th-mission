CREATE TABLE `member` (
	`id`	bigint	NOT NULL,
	`name`	varchar(15)	NULL,
	`nickname`	varchar(15)	NULL,
	`gender`	varchar(10)	NULL,
	`email`	varchar(30)	NULL,
	`birth`	date	NULL,
	`status`	varchar(15)	NULL,
	`address`	varchar(30)	NULL,
	`created_at`	datetime(6)	NULL,
	`updated_at`	datetime(6)	NULL,
	`inactive_date`	datetime	NULL,
	`phone_num`	varchar(15)	NULL,
	`clear_mission_num`	bigint	NULL
);

CREATE TABLE `mission` (
	`id`	bigint	NOT NULL,
	`name`	varchar(15)	NULL,
	`created_at`	datetime(6)	NULL,
	`updated_at`	datetime(6)	NULL
);

CREATE TABLE `member_mission` (
	`id`	bigint	NOT NULL,
	`member_id`	bigint	NOT NULL,
	`mission_id`	bigint	NOT NULL,
	`mission_clear`	boolean	NULL,
	`mission_join`	boolean	NULL
);

CREATE TABLE `alarm` (
	`id`	bigint	NOT NULL,
	`created_at`	datetime(6)	NULL,
	`updated_at`	datetime(6)	NULL,
	`alarm_type`	varchar(20)	NULL,
	`title`	varchar(30)	NULL,
	`body`	text	NULL,
	`is_confirmed`	boolean	NULL
);

CREATE TABLE `member_accept_alarm` (
	`id`	bigint	NOT NULL,
	`member_id`	bigint	NOT NULL,
	`alarm_id`	bigint	NOT NULL,
	`created_at`	datetime(6)	NULL,
	`updated_at`	datetime(6)	NULL,
	`accept`	boolean	NULL
);

CREATE TABLE `restaurant` (
	`id`	bigint	NOT NULL,
	`reigion_id`	bigint	NOT NULL,
	`name`	varchar(30)	NULL,
	`phone_number`	varchar(15)	NULL,
	`address`	varchar(40)	NULL,
	`closed_day`	varchar(15)	NULL
);

CREATE TABLE `region` (
	`id`	bigint	NOT NULL,
	`name`	varchar(40)	NULL
);

CREATE TABLE `review` (
	`id`	bigint	NOT NULL,
	`restaurant_id`	bigint	NOT NULL,
	`reigion_id`	bigint	NOT NULL,
	`member_id`	bigint	NOT NULL,
	`body`	text	NULL,
	`title`	varchar(50)	NULL,
	`created_at`	datetime(6)	NULL
);

CREATE TABLE `food_category` (
	`id`	bigint	NOT NULL,
	`name`	varchar(15)	NULL,
	`member_id`	bigint	NOT NULL
);

CREATE TABLE `review_img` (
	`id`	bigint	NOT NULL,
	`review_id`	bigint	NOT NULL,
	`restaurant_id`	bigint	NOT NULL,
	`reigion_id`	bigint	NOT NULL,
	`member_id`	bigint	NOT NULL,
	`created_at`	datetime(6)	NULL,
	`img_url`	varchar(15)	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`id`
);

ALTER TABLE `mission` ADD CONSTRAINT `PK_MISSION` PRIMARY KEY (
	`id`
);

ALTER TABLE `member_mission` ADD CONSTRAINT `PK_MEMBER_MISSION` PRIMARY KEY (
	`id`,
	`member_id`,
	`mission_id`
);

ALTER TABLE `alarm` ADD CONSTRAINT `PK_ALARM` PRIMARY KEY (
	`id`
);

ALTER TABLE `member_accept_alarm` ADD CONSTRAINT `PK_MEMBER_ACCEPT_ALARM` PRIMARY KEY (
	`id`,
	`member_id`,
	`alarm_id`
);

ALTER TABLE `restaurant` ADD CONSTRAINT `PK_RESTAURANT` PRIMARY KEY (
	`id`,
	`reigion_id`
);

ALTER TABLE `region` ADD CONSTRAINT `PK_REGION` PRIMARY KEY (
	`id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`id`,
	`restaurant_id`,
	`reigion_id`,
	`member_id`
);

ALTER TABLE `food_category` ADD CONSTRAINT `PK_FOOD_CATEGORY` PRIMARY KEY (
	`id`
);

ALTER TABLE `review_img` ADD CONSTRAINT `PK_REVIEW_IMG` PRIMARY KEY (
	`id`,
	`review_id`,
	`restaurant_id`,
	`reigion_id`,
	`member_id`
);

ALTER TABLE `member_mission` ADD CONSTRAINT `FK_member_TO_member_mission_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `member_mission` ADD CONSTRAINT `FK_mission_TO_member_mission_1` FOREIGN KEY (
	`mission_id`
)
REFERENCES `mission` (
	`id`
);

ALTER TABLE `member_accept_alarm` ADD CONSTRAINT `FK_member_TO_member_accept_alarm_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `member_accept_alarm` ADD CONSTRAINT `FK_alarm_TO_member_accept_alarm_1` FOREIGN KEY (
	`alarm_id`
)
REFERENCES `alarm` (
	`id`
);

ALTER TABLE `restaurant` ADD CONSTRAINT `FK_region_TO_restaurant_1` FOREIGN KEY (
	`reigion_id`
)
REFERENCES `region` (
	`id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_restaurant_TO_review_1` FOREIGN KEY (
	`restaurant_id`
)
REFERENCES `restaurant` (
	`id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_restaurant_TO_review_2` FOREIGN KEY (
	`reigion_id`
)
REFERENCES `restaurant` (
	`reigion_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_member_TO_review_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `review_img` ADD CONSTRAINT `FK_review_TO_review_img_1` FOREIGN KEY (
	`review_id`
)
REFERENCES `review` (
	`id`
);

ALTER TABLE `review_img` ADD CONSTRAINT `FK_review_TO_review_img_2` FOREIGN KEY (
	`restaurant_id`
)
REFERENCES `review` (
	`restaurant_id`
);

ALTER TABLE `review_img` ADD CONSTRAINT `FK_review_TO_review_img_3` FOREIGN KEY (
	`reigion_id`
)
REFERENCES `review` (
	`reigion_id`
);

ALTER TABLE `review_img` ADD CONSTRAINT `FK_review_TO_review_img_4` FOREIGN KEY (
	`member_id`
)
REFERENCES `review` (
	`member_id`
);

