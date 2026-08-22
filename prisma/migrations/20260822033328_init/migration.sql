-- CreateEnum
CREATE TYPE "WarFrequency" AS ENUM ('UNKNOWN', 'ALWAYS', 'MORE_THAN_ONCE_PER_WEEK', 'ONCE_PER_WEEK', 'LESS_THAN_ONCE_PER_WEEK', 'NEVER', 'ANY');

-- CreateEnum
CREATE TYPE "ClanType" AS ENUM ('OPEN', 'INVITE_ONLY', 'CLOSED');

-- CreateEnum
CREATE TYPE "PlayerRole" AS ENUM ('NOT_MEMBER', 'MEMBER', 'LEADER', 'ADMIN', 'COLEADER');

-- CreateEnum
CREATE TYPE "WarPreference" AS ENUM ('OUT', 'IN');

-- CreateTable
CREATE TABLE "Clan" (
    "id" SERIAL NOT NULL,
    "tag" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "requiredTownhallLevel" INTEGER NOT NULL,
    "warFrequency" "WarFrequency" NOT NULL,
    "clanLevel" INTEGER NOT NULL,
    "warWinStreak" INTEGER NOT NULL,
    "warWins" INTEGER NOT NULL,
    "warTies" INTEGER NOT NULL,
    "warLosses" INTEGER NOT NULL,
    "clanPoints" INTEGER NOT NULL,
    "clanBuilderBasePoints" INTEGER NOT NULL,
    "clanCapitalPoints" INTEGER NOT NULL,
    "isFamilyFriendly" BOOLEAN NOT NULL,
    "requiredTrophies" INTEGER NOT NULL,
    "requiredBuilderBaseTrophies" INTEGER NOT NULL,
    "isWarLogPublic" BOOLEAN NOT NULL,
    "type" "ClanType" NOT NULL,
    "members" INTEGER NOT NULL,
    "warLeagueId" INTEGER,
    "warLeagueName" TEXT,
    "capitalLeagueId" INTEGER,
    "capitalLeagueName" TEXT,
    "chatLanguageId" INTEGER,
    "chatLanguageName" TEXT,
    "requiredLeagueTierId" INTEGER,
    "requiredLeagueTierName" TEXT,
    "locationId" INTEGER,
    "locationName" TEXT,
    "locationIsCountry" BOOLEAN,
    "locationCountryCode" TEXT,
    "badgeSmallUrl" TEXT,
    "badgeMediumUrl" TEXT,
    "badgeLargeUrl" TEXT,

    CONSTRAINT "Clan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Player" (
    "id" SERIAL NOT NULL,
    "tag" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "clanId" INTEGER,
    "expLevel" INTEGER NOT NULL,
    "trophies" INTEGER NOT NULL,
    "bestTrophies" INTEGER NOT NULL,
    "attackWins" INTEGER NOT NULL,
    "defenseWins" INTEGER NOT NULL,
    "townHallLevel" INTEGER NOT NULL,
    "townHallWeaponLevel" INTEGER NOT NULL,
    "donations" INTEGER NOT NULL,
    "donationsReceived" INTEGER NOT NULL,
    "builderHallLevel" INTEGER NOT NULL,
    "builderBaseTrophies" INTEGER NOT NULL,
    "bestBuilderBaseTrophies" INTEGER NOT NULL,
    "warStars" INTEGER NOT NULL,
    "clanCapitalContributions" INTEGER NOT NULL,
    "role" "PlayerRole" NOT NULL,
    "warPreference" "WarPreference" NOT NULL,
    "leagueId" INTEGER,
    "leagueName" TEXT,
    "leagueIconSmall" TEXT,
    "leagueIconMedium" TEXT,
    "leagueIconTiny" TEXT,
    "leagueTierId" INTEGER,
    "leagueTierName" TEXT,
    "builderBaseLeagueId" INTEGER,
    "builderBaseLeagueName" TEXT,
    "currentLeagueGroupTag" TEXT,
    "currentLeagueSeasonId" BIGINT,
    "previousLeagueGroupTag" TEXT,
    "previousLeagueSeasonId" BIGINT,

    CONSTRAINT "Player_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Clan_tag_key" ON "Clan"("tag");

-- CreateIndex
CREATE UNIQUE INDEX "Player_tag_key" ON "Player"("tag");

-- CreateIndex
CREATE INDEX "Player_clanId_idx" ON "Player"("clanId");

-- AddForeignKey
ALTER TABLE "Player" ADD CONSTRAINT "Player_clanId_fkey" FOREIGN KEY ("clanId") REFERENCES "Clan"("id") ON DELETE SET NULL ON UPDATE CASCADE;
