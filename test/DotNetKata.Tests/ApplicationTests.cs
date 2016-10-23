using Xunit;

namespace DotNetKata.Tests
{
    public class ApplicationTests
    {
        [Fact]
        public void DoesSomethingCorrectly() 
        {
            int expectedResult = 1;
            var app = new Application();

            int actualResult = app.DoSomething();

            Assert.Equal(expectedResult, actualResult);
        }
    }
}