# Dotnet-Core Kata skeleton to practice TDD
I'm writing this repo to learn how to use dotnet core to practice TDD.

I will try to setup the walking skeleton to run the StringCalculator Kata.

Ref [Roy Osherove's String Calculator Kata](http://osherove.com/tdd-kata-1/)
## Setup The Environment
### Installing .NET Core
Install .NET Core following the instructions from https://www.microsoft.com/net/core

#### (Optional) Install the Visual Studio Core extension for C# in Visual Studio Code:
```sh
Command+p > ext install csharp
```
## The walking skeleton
You can use the ready-to-go project structure (if so, skip to "Build solution and run tests") or create the following folders structure:

```sh
/dotnet-core-kata-skeleton
|__/src
|  |__/DotNetKata
|__/test
   |__/DotNetKata.Tests
```
### Prepare the contents
Inside the root folder `dotnet-core-kata-skeleton` create the file `global.json` with the following content:
```json
{
    "projects": [
        "src",
        "test"
    ]
}
```
#### DotNetKata project
```sh
cd /dotnet-core-kata-skeleton/src/DotNetKata/
dotnet new -t lib
```
Rename `Library.cs` as `Application.cs`.

To use Test-driven Development (TDD), you'll create a failing implementation of the `Application` class:
```csharp
using System;

namespace DotNetKata
{
    public class Application
    {
        public int DoSomething()
        {
            throw new NotImplementedException();
        }
    }
}
```

#### DotNetKata.Tests project
```sh
cd ../../test/DotNetKata.Tests/
dotnet -new -t xunittest
```
Rename `Tests.cs` as `ApplicationTests.cs`.

To use test-driven development (TDD), you'll create a failing implementation of the `ApplicationTests` class:
```csharp
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
```

Inside `project.json` add the reference to the `DotNetKata` project:

```json
  "dependencies": {
    "System.Runtime.Serialization.Primitives": "4.1.1",
    "xunit": "2.1.0",
    "dotnet-test-xunit": "1.0.0-rc2-192208-24",
    "DotNetKata": {
      "target": "project"
    }
  }
```

**The walking skeleton is ready!**

```sh
/dotnet-core-kata-skeleton
|__global.json
|__/src
|  |__/DotNetKata
|     |__Application.cs
|     |__project.json
|__/test
   |__/DotNetKata.Tests
      |__ApplicationTests.cs
      |__project.json
```

## Build solution and run tests
Build and run the tests
```sh
cd test/DotNetKata.Tests
dotnet restore
dotnet test
```

You should get a red bar
```sh
  ...
  Discovering: DotNetKata.Tests
  Discovered:  DotNetKata.Tests
  Starting:    DotNetKata.Tests
    DotNetKata.Tests.ApplicationTests.DoesSomethingCorrectly [FAIL]
      System.NotImplementedException : The method or operation is not implemented.
      Stack Trace:
        ...
        ...
  Finished:    DotNetKata.Tests
=== TEST EXECUTION SUMMARY ===
   DotNetKata.Tests  Total: 1, Errors: 0, Failed: 1, Skipped: 0, Time: 0.173s
SUMMARY: Total: 1 targets, Passed: 0, Failed: 1.
```

**FINISH!**
Well done! You are ready to start practicing you kata!
