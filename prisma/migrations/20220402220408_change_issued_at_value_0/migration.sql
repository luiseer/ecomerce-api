/*
  Warnings:

  - You are about to drop the column `updateAt` on the `Orders` table. All the data in the column will be lost.
  - You are about to drop the column `updateAdt` on the `Products` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `ProductsInCart` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `Orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `ProductsInCart` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Orders" DROP COLUMN "updateAt",
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Products" DROP COLUMN "updateAdt",
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "ProductsInCart" DROP COLUMN "updateAt",
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;
