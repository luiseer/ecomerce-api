/*
  Warnings:

  - You are about to drop the column `quantoty` on the `Products` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Products` table. All the data in the column will be lost.
  - Added the required column `UserId` to the `Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `quantity` to the `Products` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Products" DROP CONSTRAINT "Products_userId_fkey";

-- AlterTable
ALTER TABLE "Products" DROP COLUMN "quantoty",
DROP COLUMN "userId",
ADD COLUMN     "UserId" INTEGER NOT NULL,
ADD COLUMN     "quantity" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "ProductsInCart" (
    "CartId" INTEGER NOT NULL,
    "PorductId" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "status" TEXT NOT NULL DEFAULT E'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProductsInCart_pkey" PRIMARY KEY ("PorductId","CartId")
);

-- CreateTable
CREATE TABLE "Carts" (
    "id" SERIAL NOT NULL,
    "UserId" INTEGER NOT NULL,
    "status" TEXT NOT NULL DEFAULT E'active',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Carts_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Products" ADD CONSTRAINT "Products_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductsInCart" ADD CONSTRAINT "ProductsInCart_PorductId_fkey" FOREIGN KEY ("PorductId") REFERENCES "Products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductsInCart" ADD CONSTRAINT "ProductsInCart_CartId_fkey" FOREIGN KEY ("CartId") REFERENCES "Carts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Carts" ADD CONSTRAINT "Carts_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_cartid_fkey" FOREIGN KEY ("cartid") REFERENCES "Carts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
