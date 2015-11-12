using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AssemblyPrimes
{
    class Program
    {
        private static void Main(string[] args)
        {
            var input = Convert.ToInt32(Console.ReadLine());

            for (var i = 2; i < input; i++)
            {
                var isPrime = true;

                for (var j = 2; j < i; j++)
                {
                    if ((i % j) == 0)
                    {
                        isPrime = false;
                        break;
                    }
                }

                if (isPrime)
                    Console.WriteLine(i);
            }

            Console.ReadKey();
        }
    }
}
