#include<iostream>
using namespace std;

//base class
class Animal{
	public:
		virtual void eat(){
			cout << "I'm eating generic food\n";
		}
		void cartoon(){
			cout << "mickey mouse, donal duck\n";
		}
};

class cat : public Animal{
        public:
                void eat(){
                        cout << "I'm eating cat food\n";
                }
		void cartoon(){
                        cout << "scooby-doo\n";
                }
};

class dog : public Animal{
        public:
                void eat(){
                        cout << "I'm eating dog food\n";
                }
		void cartoon(){
                        cout << "tom\n";
                }
};

void function1(Animal *xyz)
{
	xyz->eat();
	xyz->cartoon();
}

int main()
{
	Animal *ptr;
	cat catobj;
	dog dogobj;
	ptr = &catobj;
	function1(ptr);
	ptr = &dogobj;
	function1(ptr);
}
