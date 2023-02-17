# Empty ..
Empty is an esoteric language designed to convert a sequence of keywords into a pure alphabetic sentence. It provides a set of keywords to the user to create a sequence to produce an alphabetic sentence. But the most unique feature of this particular esolang is that every keyword sounds like 'Empty' when they are pronounced.

## How Does It Work?
Empty uses only 26 alphabetic characters to produce a sentence. It does not deal with symbols, number or any other character. The alphabets are arranged in a natural order which is a-z. A specific position has been assigned to every alphabet. For instance, a - 1, b - 2, c - 3 ... z - 26. 

In order to display a character, user must pick a keyword and the keyword's length must match the desired characters position.
### Keywords
```python
'empty' 'empt' 'mpty' 'emt' 'mpt' 'mty' 'mt'  // Lowercase Keywords
'^empty' '^empt' '^mpty' '^emt' '^mpt' '^mty' '^mt' // Uppercase Keywords
```

### Examples
Let's imagine we want to display 'Cab'. The sequence will be -
```python
^emt. .mt
```
Woah that looks weird. Lets break it down...<br>
1. Notice that the sequence is using ```.``` to seperate the keywords.
2. The first keyword is ```^emt```. The keyword 'emt' has a length of 3, which referes to the alphabetic position 3 (c). And the ```^``` symbol is used to 'Capitalize' the alphabet.
3. The second keyword is just a single empty space. Whitespace is technically 'empty'. Single whitespace referes to the alphabetic position 1 (a).
4. Finally, the third keyword is `mt` with a length of 2, refering to position 2 (b).

Let's spice things up! We will display 'Hi'. The sequence will be -
```python
^empty mpt.empty empt
```
1. Notice that there are more than 1 keyword. Length of 'empty' = 5 and 'mpt' = 3. So 5 + 3 = 8 (h). And the ^ at the beginning to Uppercase the 'h'.
2. In the second part, length of 'empty' = 5 and 'empt' = 4. So 5 + 3 = 9 (i).


### Whitespace
We use whitespace seperater words in a sentence right? Well, how can we represent a whitespace in 'Empty'? It's simple. In order too display a whitespace, there must absolutly nothing within 2 sperators. Look at the example below -

We want to display 'A bee'. The sequence will be -
```python
^ ..mt.empty.empty
```
1. In the first part, there is ```^``` and a single whitespace. Single whitespace refers to 1 (a) and ^ for Capitalization (A).
2. Here comes the interesting part. Notice that there is nothing between two '.' in the second part. That's how we can display a whitespace.
3. The keyword 'empty' is used in the 3rd and 4th part as length of 'empty' = 5 (e) 

## Hello World
At last, here is the classic 'Hello World' using 'Empty' - 
  



