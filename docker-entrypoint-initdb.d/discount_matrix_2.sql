\connect admin_avito

CREATE TABLE IF NOT EXISTS discount_matrix_2(
    id BIGSERIAL,
    microcategory_id int,
    location_id int,
    price int,
	PRIMARY KEY ("id")
);

insert into discount_matrix_2 (id, microcategory_id, location_id, price)
values  (default, 18, 20, 216);