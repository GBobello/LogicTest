namespace LogicTest.Test
{
    public class Tests
    {
        private Network network;

        [SetUp]
        public void Setup()
        {
            network = new Network(8);
        }

        [Test]
        public void TestDirectlyConnection()
        {
            network.Connect(1, 2);
            Assert.IsTrue(network.Query(1, 2));
        }

        [Test]
        public void TestIndirectlyConnection()
        {
            network.Connect(1, 2);
            network.Connect(2, 3);
            Assert.IsTrue(network.Query(1, 3));
        }

        [Test]
        public void TestInvalidElementThrowsException()
        {
            Assert.Throws<ArgumentException>(() => network.Connect(1, 9));
        }

        [Test]
        public void TestElementsAlreadyConnected()
        {
            network.Connect(1, 2);
            network.Connect(2, 3);
            Assert.Throws<ArgumentException>(() => network.Connect(1, 3));
        }

    }
}