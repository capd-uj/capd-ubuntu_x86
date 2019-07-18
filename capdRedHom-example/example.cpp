#include <capd/apiRedHom/c_interface.h>
#include <exception>
#include <iostream>

void KleinBetti();
void KleinBettiZp();
void KleinBettiZp();
void BuildComplexBetti();
void BuildComplexBettiZ2();
void BuildComplexBettiZp();

int main()
{
   RedHom_Init();

   try {
      KleinBetti();
      KleinBettiZp();
      KleinBettiZp();
      BuildComplexBetti();
      BuildComplexBettiZ2();
      BuildComplexBettiZp();

      return 0;
   }
   catch (std::exception& ex) {
      std::cerr << "Error: " << ex.what() << std::endl;
      return 1;
   }
   catch (const char* ex) {
      std::cerr << "Error: " << ex << std::endl;
      return 1;
   }
   catch (const std::string& ex) {
      std::cerr << "Error: " << ex << std::endl;
      return 1;
   }
   catch (...) {
      std::cerr << "Unknown exception" << std::endl;
      return 1;
   }

   return 1;
}
