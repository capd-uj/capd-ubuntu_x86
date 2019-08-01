#include <capd/apiRedHom/CrHom.h>
#include <capd/apiRedHom/c_interface.h>
#include <boost/assert.hpp>
#include <exception>
#include <iostream>

int main()
{
   using namespace capd::apiRedHom;

   RedHom_Init();

   std::string line;
   std::vector<int> cubeTmp(3);
   CrHom crHom;

   while (std::getline(std::cin, line)) {
      if (3 != std::sscanf(line.c_str(), "(%d,%d,%d)", &cubeTmp[0], &cubeTmp[1], &cubeTmp[2])) {
         BOOST_ASSERT(false);
      }
      crHom.insert(cubeTmp);
   }

   std::cout << "Reading done" << std::endl;
   auto betti = crHom.betti(1);
   for (auto b : betti) {
      std::cout << b << " ";
   }

   std::cout << std::endl;
   return 0;
}
