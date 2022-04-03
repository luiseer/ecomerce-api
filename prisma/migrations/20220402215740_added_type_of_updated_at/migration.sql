/*
  Warnings:

  - You are about to drop the column `updateAt` on the `Products` table. All the data in the column will be lost.
  - Added the required column `updateAdt` to the `Products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Products" DROP COLUMN "updateAt",
ADD COLUMN     "updateAdt" TIMESTAMP(3) NOT NULL;
