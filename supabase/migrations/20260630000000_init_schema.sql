-- UmaCards: Initial Schema Migration
-- Run this in Supabase SQL Editor after creating your project.
-- Creates: cards (public catalog), decks (user-owned, RLS), profiles (auto-created on signup)

-- ============================================================================
-- TABLE: cards
-- Public read access (catalog does not require login)
-- ============================================================================

CREATE TABLE IF NOT EXISTS cards (
  id              TEXT PRIMARY KEY,
  name            TEXT NOT NULL,
  title           TEXT NOT NULL,
  image           TEXT NOT NULL,
  type            TEXT NOT NULL CHECK (type IN ('speed','stamina','power','guts','wit','friend')),
  rarity          TEXT NOT NULL CHECK (rarity IN ('ssr','sr','r')),
  effects         JSONB NOT NULL DEFAULT '{}',
  skills          JSONB NOT NULL DEFAULT '[]',
  unique_effect   TEXT,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE cards ENABLE ROW LEVEL SECURITY;
CREATE POLICY "cards_public_read" ON cards FOR SELECT USING (true);
CREATE INDEX IF NOT EXISTS idx_cards_type   ON cards(type);
CREATE INDEX IF NOT EXISTS idx_cards_rarity ON cards(rarity);
CREATE INDEX IF NOT EXISTS idx_cards_name   ON cards(name);

-- ============================================================================
-- TABLE: decks
-- ============================================================================

CREATE TABLE IF NOT EXISTS decks (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id     UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  name        TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  card_ids    JSONB NOT NULL DEFAULT '[]',
  is_public   BOOLEAN NOT NULL DEFAULT false,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ
);

ALTER TABLE decks ENABLE ROW LEVEL SECURITY;

-- Owners can do everything with their own decks
DROP POLICY IF EXISTS "decks_owner_all" ON decks;
CREATE POLICY "decks_owner_all" ON decks
  FOR ALL
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

-- Anyone can read public decks
DROP POLICY IF EXISTS "decks_public_read" ON decks;
CREATE POLICY "decks_public_read" ON decks
  FOR SELECT
  USING (is_public = true);

CREATE INDEX IF NOT EXISTS idx_decks_user_id ON decks(user_id);

-- ============================================================================
-- TABLE: profiles
-- Auto-created when a user signs up (via trigger below)
-- ============================================================================

CREATE TABLE IF NOT EXISTS profiles (
  id         UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username   TEXT UNIQUE NOT NULL,
  avatar_url TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Anyone can read profiles (username display)
DROP POLICY IF EXISTS "profiles_public_read" ON profiles;
CREATE POLICY "profiles_public_read" ON profiles FOR SELECT USING (true);

-- Owners can update their own profile
DROP POLICY IF EXISTS "profiles_owner_update" ON profiles;
CREATE POLICY "profiles_owner_update" ON profiles FOR UPDATE USING (id = auth.uid());

-- ============================================================================
-- TRIGGER: Auto-create profile on signup
-- When a user registers, a profiles row is created using their username
-- from the signUp() metadata (data: {'username': ...})
-- ============================================================================

CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, username)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'username', 'trainer_' || NEW.id::text)
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- ============================================================================
-- STORAGE: cards bucket (public)
-- Run this OR create the bucket via the Storage dashboard manually
-- ============================================================================

INSERT INTO storage.buckets (id, name, public)
VALUES ('cards', 'cards', true)
ON CONFLICT (id) DO NOTHING;

-- Public read access to card images
DROP POLICY IF EXISTS "cards_bucket_public_read" ON storage.objects;
CREATE POLICY "cards_bucket_public_read" ON storage.objects
  FOR SELECT
  USING (bucket_id = 'cards');

-- Authenticated users can upload (for admin card management later)
DROP POLICY IF EXISTS "cards_bucket_auth_upload" ON storage.objects;
CREATE POLICY "cards_bucket_auth_upload" ON storage.objects
  FOR INSERT
  WITH CHECK (bucket_id = 'cards' AND auth.role() = 'authenticated');
