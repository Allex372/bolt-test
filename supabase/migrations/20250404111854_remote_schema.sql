alter table "public"."client" enable row level security;

create policy "Users can insert their own clients"
on "public"."client"
as permissive
for insert
to authenticated
with check (true);


create policy "Users can read all clients"
on "public"."client"
as permissive
for select
to authenticated
using (true);


create policy "Users can update their own clients"
on "public"."client"
as permissive
for update
to authenticated
using (true)
with check (true);



