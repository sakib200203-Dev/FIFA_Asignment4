/*Query1*/
select match_id,fixture,base_ticket_price from matches where tournament_category='Champions League' and match_status='Available';
/*Query2*/
select user_id,full_name,email from users where full_name ilike '%Tanvir%'or full_name ilike '%Haque%';
/*Query3*/
select
  booking_id,
  user_id,
  match_id,
 
  coalesce(payment_status, 'Action Required') as systematic_status
from
  bookings
where
  payment_status is null;
/*query4*/
select
  booking_id,
  full_name,
  fixture,
  total_cost
from
  bookings as b
  inner join users as u on b.user_id = u.user_id
  inner join matches as m on b.match_id = m.match_id;
/*Query5*/
select
  u.user_id,
  u.full_name,
  b.booking_id
from
  users as u
  left join bookings as b on u.user_id = b.user_id;
/*Query6*/
select
  booking_id,
  match_id,
  total_cost
from
  bookings
where
  total_cost > (
    select
      avg(total_cost)
    from
      bookings
  ); 
  /*Query7*/
  select
  match_id,
  fixture,
  base_ticket_price
from
  matches
order by
  base_ticket_price desc
limit
  2
offset 1;
  