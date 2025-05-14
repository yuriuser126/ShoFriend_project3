package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreDTO {
		private int id;
		private int seller_id;
		private String name;
		private String description;
		private int zipcode;
		private String address;
		private String address1;
		private Timestamp created_at;
}
