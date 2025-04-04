/*
  # Create Subscription Table

  1. New Table
    - `subscription`
      - `id` (uuid, primary key)
      - `price` (numeric, not null)
      - `plan` (text, not null)
      - `created_at` (timestamp with time zone)

  2. Security
    - Enable RLS on `subscription` table
    - Add policies for authenticated users to:
      - Read all subscriptions
      - Insert their own subscriptions
      - Update their own subscriptions
*/

CREATE TABLE IF NOT EXISTS "public"."subscription" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "price" numeric NOT NULL,
    "plan" text NOT NULL,
    "created_at" timestamptz DEFAULT now() NOT NULL
);

-- Enable Row Level Security
ALTER TABLE "public"."subscription" ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Users can read all subscriptions"
ON "public"."subscription"
AS PERMISSIVE
FOR SELECT
TO authenticated
USING (true);

CREATE POLICY "Users can insert their own subscriptions"
ON "public"."subscription"
AS PERMISSIVE
FOR INSERT
TO authenticated
WITH CHECK (true);

CREATE POLICY "Users can update their own subscriptions"
ON "public"."subscription"
AS PERMISSIVE
FOR UPDATE
TO authenticated
USING (true)
WITH CHECK (true);