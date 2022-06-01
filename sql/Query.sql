select * from Account as a where a.id = 1 

select * from Permission order by per_name asc

select * from [Action]

Select top 8 * from Post

select * from Account as a
join User_Permission as up on a.id = up.account_id
join Permission as p on up.permission_id = p.id
join Permission_Action as pa on p.id = pa.permission_id
join [Action] as ac on pa.action_id = ac.id
where a.id = 1 and up.licensed = 1 and pa.licensed = 1

select p.id,p.per_name,act.id,act.action_name,action_code from Permission as p
join Permission_Action as pa on p.id = pa.permission_id
join [Action] as act on pa.action_id = act.id

alter table Permission_Acction
add licensed bit 