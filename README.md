# dotnet core tdd using xunit
I'm writing this repo to learn how to use dotnet core to practice TDD.

I will try to setup the walinkg skeleton to run the StringCalculator Kata.

Ref [Roy Osherove's String Calculator Kata](http://osherove.com/tdd-kata-1/)
## PART 0 Setup The Environment
#### 0.1 Installing dnvm :  Dot.Net Version Manager
```sh
curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh
```
### 0.2 Install the .NET Execution Environment (DNX)
Set/?install DNX for Mono:
```sh
dnvm upgrade -r mono
```
Set/?install DNX for .NET Core:
```sh
dnvm upgrade -r coreclr
```
### 0.3 (Optional) Install the Visual Studio Core extension for c#:
```sh
Command+p > ext install csharp
```
## PART 1 The walking skeleton
### Step 1.1 Crete the following folders structure:
```sh
/dotnet-core-tdd-xunit
|__/src
|  |__/DotNetKata
|__/test
   |__/DotNetKata.Tests
```
### Step 1.2 Prepare the contents
#### 1.2.1 global.json
Inside the root folder `dotnet-core-tdd-xunit` crete the file `global.json` with the following content:
```json
{
    "projects": [
        "src",
        "test"
    ]
}
```
#### 1.2.2 DotNetKata project
```sh
cd /dotnet-core-tdd-xunit/src/DotNetKata/
dotnet new -t lib
```
Rename `Library.cs` as `Application.cs`.

To use test-driven development (TDD), you'll create a failing implementation of the `Application` class:
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

#### 1.2.3 DoeNetKata.Tests project
```sh
cd ../../test/DoeNetKata.Tests/
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

**PART 1 Finished: Walking scheleton is ready!** 

```sh
/dotnet-core-tdd-xunit
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

## PART 2 Build solution and run tests
## 2.1 Build solution
```sh
cd dotnet-core-tdd-xunit/test/DotNetKata
dotnet restore
dotnet build 
```

## 2.2 Run Tests
```sh
cd dotnet-core-tdd-xunit/test/DotNetKata.Tests
dotnet restore
dotnet build 
dotnet test
```

```sh
➜  DotNetKata.Tests git:(master) ✗ dotnet test
Project DotNetKata (.NETStandard,Version=v1.6) was previously compiled. Skipping compilation.
Project DotNetKata.Tests (.NETCoreApp,Version=v1.0) will be compiled because inputs were modified
Compiling DotNetKata.Tests for .NETCoreApp,Version=v1.0
/Users/boris/projects/dotnet/dotnet-core-tdd-xunit/test/DotNetKata.Tests/project.json(9,46): warning NU1007: Dependency specified was dotnet-test-xunit >= 1.0.0-rc2-192208-24 but ended up with dotnet-test-xunit 1.0.0-rc2-build10015.

Compilation succeeded.
    1 Warning(s)
    0 Error(s)

Time elapsed 00:00:01.0497609


xUnit.net .NET CLI test runner (64-bit osx.10.11-x64)
  Discovering: DotNetKata.Tests
  Discovered:  DotNetKata.Tests
  Starting:    DotNetKata.Tests
    DotNetKata.Tests.ApplicationTests.DoesSomethingCorrectly [FAIL]
      System.NotImplementedException : The method or operation is not implemented.
      Stack Trace:
        /Users/boris/projects/dotnet/dotnet-core-tdd-xunit/src/DotNetKata/Application.cs(9,0): at DotNetKata.Application.DoSomething()
        /Users/boris/projects/dotnet/dotnet-core-tdd-xunit/test/DotNetKata.Tests/ApplicationTests.cs(13,0): at DotNetKata.Tests.ApplicationTests.DoesSomethingCorrectly()
  Finished:    DotNetKata.Tests
=== TEST EXECUTION SUMMARY ===
   DotNetKata.Tests  Total: 1, Errors: 0, Failed: 1, Skipped: 0, Time: 0.189s
SUMMARY: Total: 1 targets, Passed: 0, Failed: 1.
```

**FINISH!**
Well done! You are ready to start practicing you kata!

### Credits to:
Steve Smith
[Unit Testing in .NET Core using dotnet test](https://docs.microsoft.com/en-us/dotnet/articles/core/testing/unit-testing-with-dotnet-test)