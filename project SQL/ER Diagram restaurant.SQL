// create our first table
Table fac.order {
  order_id int [PK]
  staff_id varchar [not null]
  date_time datetime
  menu_id int
  price float
  unit int
  member_id int
}

// create a staff table
Table dim.staff {
  staff_id int [PK]
  staff_name varchar [unique, not null]
}

// create a menu table
Table dim.menu {
  menu_id int [PK]
  menu_name varchar [unique, not null]
  menu_type int
  price float
}

// create a member table
Table dim.member {
  member_id int [PK]
  member_type varchar 
  member_regis datetime
}

// create a menu_type table
Table dim.menu_type {
  menu_type int [PK]
  type_name varchar 
}

// create a member_type table
Table dim.member_type {
  member_type varchar [PK]
  discount float
}

// one-to-many relationship
Ref a_relationship {
  dim.staff.staff_id < fac.order.staff_id
}

Ref a_relationship {
  dim.menu.menu_id < fac.order.menu_id
}

Ref a_relationship {
  dim.member.member_id < fac.order.member_id
}

Ref a_relationship {
  dim.menu_type.menu_type < dim.menu.menu_type
}

Ref a_relationship {
  dim.member_type.member_type < dim.member.member_type
}
