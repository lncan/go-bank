CREATE TABLE "accounts" (
  "id" varchar PRIMARY KEY DEFAULT (uuid_generate_v1()),
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "entries" (
  "id" varchar PRIMARY KEY DEFAULT (uuid_generate_v1()),
  "account_id" varchar NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "transfer" (
  "id" varchar PRIMARY KEY DEFAULT (uuid_generate_v1()),
  "from_account_id" varchar NOT NULL,
  "to_account_id" varchar NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfer" ("from_account_id");

CREATE INDEX ON "transfer" ("to_account_id");

CREATE INDEX ON "transfer" ("from_account_id", "to_account_id");

COMMENT ON COLUMN "entries"."amount" IS 'positive or negative';

COMMENT ON COLUMN "transfer"."amount" IS 'must be positive';

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfer" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfer" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");
