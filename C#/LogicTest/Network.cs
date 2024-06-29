using System;

namespace LogicTest
{
    public class Network
    {
        private int[] parent;

        public Network(int numElements)
        {
            if (numElements <= 0)
                throw new ArgumentException("O tamanho do conjunto de dados deve ser um número e maior do que zero!");

            parent = new int[numElements + 1]; //Criando com mais um para que quando for fazer a ligação não precise ficar decrementando
            
            for (int i = 0; i < numElements + 1; i++)
            {
                parent[i] = i;
            }
        }

        private int Find(int element)
        {
            if (element < 0 || element >= parent.Length)
                throw new ArgumentException("O elemento deve ser um número maior do que zero e estar dentro do conjunto de dados!");

            if (parent[element] != element)
            {
                parent[element] = Find(parent[element]);
            }

            return parent[element];
        }

        public void Connect(int element1, int element2)
        {
            int root1 = Find(element1);
            int root2 = Find(element2);


            if (root1 != root2) //Caso forem iguais já estão conectados
            {
                if (root1 > root2)
                {
                    parent[root1] = root2;
                }
                else if (root1 < root2)
                {
                    parent[root2] = root1;
                }
            }
            else { 
                throw new ArgumentException("Esses elementos já estão conectados!");
            }
        }

        public bool Query(int element1, int element2)
        {
            return Find(element1) == Find(element2);
        }

        static void Main()
        {
            try
            {
                Network network = new Network(8);

                network.Connect(1, 2);
                network.Connect(6, 2);
                //network.Connect(1, 6); //Causa erro por conta de já estarem conectados
                network.Connect(2, 4);
                network.Connect(5, 8);
                //network.Connect(1, 9); //Causa erro por conta de não existir o elemento!

                Console.WriteLine(network.Query(1, 6));
                //Console.WriteLine(network.Query(1, 9)); //Causa erro por conta de não existir o elemento!
                Console.WriteLine(network.Query(6, 4));
                Console.WriteLine(network.Query(7, 4));
                Console.WriteLine(network.Query(5, 6));
            }
            catch (Exception e) {
                Console.WriteLine($"Erro: {e.Message}");
            }
        }
    }
}