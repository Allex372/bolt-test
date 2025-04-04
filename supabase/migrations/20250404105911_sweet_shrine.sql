create table if not exists "public"."client" (
  "id" uuid primary key default gen_random_uuid(),
  "name" text not null,
  "age" integer not null,
  "created_at" timestamptz default now() not null
);
