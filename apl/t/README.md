# APLTEST

A simple test reporting tool with examples. For complete example usage see `./meta_test.aplf` as it runs every possible combination of the test function. 



## Additional Resources:
The comments in the source files are to be considered additional documentation, and kept up to date before any push. To learn more about the implementation, please read the comments as a stand alone documentation source. 

## Usage

To use this project:

```APL
    ]link.create # 'path/to/apltest' 
Linked: # ←→ path/to/apltest
```

The entry point to this test reporting tool is `./test.aplf` 

To execute all test cases in this project:
```APL
  #.examples test ⍬

┌──────────┬───┬──────┬──────┬─────┬───────────────────────────────────────────────────────────────────┐
│AOC2015   │RAN│PASSED│FAILED│ERROR│REPORT                                                             │
├──────────┼───┼──────┼──────┼─────┼───────────────────────────────────────────────────────────────────┤
│s03       │5  │1     │4     │0    │┌───────────┬───────────┬───────────┬───────────┐                  │
│          │   │      │      │     ││   Input: 1│   Input: 1│   Input: 1│   Input: 1│                  │
│          │   │      │      │     │├───────────┼───────────┼───────────┼───────────┤                  │
│          │   │      │      │     ││Expected: 5│Expected: 6│Expected: 7│Expected: 8│                  │
│          │   │      │      │     │├───────────┼───────────┼───────────┼───────────┤                  │
│          │   │      │      │     ││     Got: 2│     Got: 2│     Got: 2│     Got: 2│                  │
│          │   │      │      │     │└───────────┴───────────┴───────────┴───────────┘                  │
├──────────┼───┼──────┼──────┼─────┼───────────────────────────────────────────────────────────────────┤
│TOTALS    │17 │13    │4     │0    │FAILED: s03                                                        │
├──────────┼───┼──────┼──────┼─────┼───────────────────────────────────────────────────────────────────┤
│AOC2016   │RAN│PASSED│FAILED│ERROR│REPORT                                                             │
├──────────┼───┼──────┼──────┼─────┼───────────────────────────────────────────────────────────────────┤
│TOTALS    │1  │1     │0     │0    │PASS                                                               │
├──────────┼───┼──────┼──────┼─────┼───────────────────────────────────────────────────────────────────┤
│FAIL_DEMO │RAN│PASSED│FAILED│ERROR│REPORT                                                             │
├──────────┼───┼──────┼──────┼─────┼───────────────────────────────────────────────────────────────────┤
│will_error│2  │0     │2     │2    │┌────────────────────┬────────────────────┐                        │
│          │   │      │      │     ││   Input: 1         │   Input: 3         │                        │
│          │   │      │      │     │├────────────────────┼────────────────────┤                        │
········································································································
├──────────┼───┼──────┼──────┼─────┼───────────────────────────────────────────────────────────────────┤
│TOTALS    │7  │0     │7     │2    │FAILED: will_error,will_fail                                       │
└──────────┴───┴──────┴──────┴─────┴───────────────────────────────────────────────────────────────────┘      
```


## Legal arguments to test

|RESULT|⍺|⍵|Example|
|---|---|---|---|
|Perform `test ⍬` inside namespace ⍺. For each namespace in ⍺, run every dfn with their corresponding test cases.|namespace|⍬|`#.examples test ⍬`|
|Run every dfn defined in each namespace in `#` with their corresponding test cases||⍬|`test ⍬`|
|Run every defn defined in ⍵ with their corresponding test cases||namespace|`test #.aoc2015`|
|Run the dfns ⍵ defined in ⍺|namespace|nested charvec|`#.aoc2015 test 's01' 's02`|
|Run dfn ⍵ in ⍺|namespace|charvec|`#.aoc2015 test 's01'`|

## Defining tests and test cases

Create a new file named `./examples/my_namespace.apln` containing:
```APL
:Namespace my_namespace
    
:EndNamespace
```

Inside that namespace, define a function, and a corresponding test case. Test cases are identified by appending `_tests` to the name of a given function.

```APL
my_fn←{}

my_fn_tests←⍬
```

This test will not execute because there are no test cases, and my_fn returns no results so calling it will probably result in an error. 

To defined the first case, change the values to the following:
```APL
my_fn←{+/⍵}

my_fn_tests←(1 1)
```
But this will not work correctly, returning that 2 tests passed. Test cases must be defined as a nested vector, so if there is a single test case define it as follows:
```APL
my_fn←{+/⍵}

my_fn_tests←,⊂(1 1)
```

Usually more than 1 test case per dfn will be defined, so to add a few more:
```APL
my_fn←{+/⍵}

my_fn_tests←(1 1) ((1 2) 3) ((2 4) 8) ((2 8 20) 30)
```
Notice that the new test cases contain a tuple of arguments. Each cell is a tuple containing strictly 2 values. First is the input, second is the expected result. In the first test case, our input is `1`, and our expected result is `1`. In the last case, our input is `2 8 20` and our expected result is `30`

Now call `test` to run all tests in our new namespace:

```APL
      test #.examples.my_namespace
┌───────────────────────┬───┬──────┬──────┬─────┬───────────────┐
│#.EXAMPLES.MY_NAMESPACE│RAN│PASSED│FAILED│ERROR│REPORT         │
├───────────────────────┼───┼──────┼──────┼─────┼───────────────┤
│my_fn                  │4  │3     │1     │0    │┌─────────────┐│
│                       │   │      │      │     ││   Input: 2 4││
│                       │   │      │      │     │├─────────────┤│
│                       │   │      │      │     ││Expected: 8  ││
│                       │   │      │      │     │├─────────────┤│
│                       │   │      │      │     ││     Got: 6  ││
│                       │   │      │      │     │└─────────────┘│
├───────────────────────┼───┼──────┼──────┼─────┼───────────────┤
│TOTALS                 │4  │3     │1     │0    │FAILED: my_fn  │
└───────────────────────┴───┴──────┴──────┴─────┴───────────────┘
```

OOPS! Looks like one of the test cases failed. The function didn't fail however, the test case is poorly defined because `8 ≠ +/ 2 4`. In this case rather than modifying `my_fn`, ensure the test cases are correct by either changing the expected result or the arguments.


```APL
my_fn←{+/⍵}

my_fn_tests←(1 1) ((1 2) 3) ((2 4) 6) ((2 8 20) 30)
```


Now if the test is run, the same results are produced. To run test cases for a single dfn, the following argument form for `test` is valid:

```APL
      #.examples.my_namespace test 'my_fn'
┌───────────────────────┬───┬──────┬──────┬─────┬──────┐
│#.EXAMPLES.MY_NAMESPACE│RAN│PASSED│FAILED│ERROR│REPORT│
├───────────────────────┼───┼──────┼──────┼─────┼──────┤
│TOTALS                 │4  │4     │0     │0    │PASS  │
└───────────────────────┴───┴──────┴──────┴─────┴──────┘
```

In this specific instance, the results of `ns test 'fn'` and `test ns` are the same because there is only 1 dfn in `#examples.my_namespace`. But as more test cases and dfns are added, use `test ns` to run all of them, or `ns test 'fn'` to run a select test.
```
      {(test ⍵)≡⍵ test'my_fn'}#.examples.my_namespace
1
```


## Precautions 
- At present, this framework only allows for dfns accepting a right argument. The framework also presently only tests dfns defined in the provided namespace, and does not recursively check for more nested namespaces to test. 

- Errors caused by function execution are trapped, so any embedded error handling won't be handled or tested. 

- No mocking is provided. Any dfn that requires user interaction, or anything depending on outside data isn't guaranteed. 

## TODO:
- `config.apln` should be used to house user configuration of the test suite. Config.apl should be its own source of documenation, containing options and potential configuration of results. 