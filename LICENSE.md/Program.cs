using System;

namespace console_test
{
    class Pipets
    {
        private delegate void func(int[] values, int M);

        private static int result = 1;
        private static int searchIndex = 0;

        private static string[] output = new string[] { "Yes", "No" };

        private static func[] functions = new func[]
        {
            (values, m) =>
            {
                result = result * values[searchIndex++];
                functions[searchIndex / m](values, m);
            },

            (values, m) =>
            {
                var mask = (result >> 31);
                result = (mask ^ result) - mask;

                Print(result);
            }
        };

        private static void Print(int result)
        {
            Console.WriteLine(output[(uint)(result / (result - 0.1))]);
            Console.ReadLine();
        }

        private static void Main(string[] args)
        {
            int[] testValues = new int[6] { 228, -1, 1488, 0, 42, 123 };

            int M = 4;

            functions[0](testValues, M);
        }
    }
}
