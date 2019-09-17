import UIKit

/*1. Write a Swift function, call it quadTable, that has one argument, an integer, call it N. The
function prints out on the console the values k and k2 + 3*k - 1 for the values k = 1, 2, ..., N.
Print each value of k on a separate line. So the output of quadTable(3) is given below.
(Where does your the output go?)
k=1 k*k + 3k - 1 = 3
k=2 k*k + 3k - 1 = 9
k=3 k*k + 3k - 1 = 17
*/
func quadTable( _ N:Int){
   var i: Double=1
    for _ in 1...N
    {
        print("k=",i," k*k + 3k - 1 = ", pow(i,2.0) + (3 * i) - 1)
        i=i+1
    }
}
//print(quadTable(2))


/*2. Write a Swift function, call it polyTable, that has one argument, an Int (N) and returns an
array. The function returns an array of size N. The k’th element of the array contains the
value k3 + 2*k + 4 for k = 0, 1, ..., N. So polyTable(3) would return [7, 16, 37].
 */
func polyTable( _ N:Int)-> [Int]{
    var answer: [Int]=[]
    //    var i: Double=1
    if N == 0
    {
        return answer
    }
    
        for i in 1...N{
            answer.append(Int(pow(Double(i),3.0) + Double(2 * i) + 4.0))
            //        i=i+1
        }
        return answer
    
}

print(polyTable(4))


/*3. Write a Swift function, call it busyStudents, that has one argument an array of sets of
 names and returns the intersection of all the sets in the array. In the code below busyStudents would return {“Peter”}.
 let courseA: Set = ["Peter", "Paul", "Mary"]
 let courseB: Set = ["Peter", "Paul", "Dylan"]
 let courseC: Set = ["Tom", "Peter"]
 busyStudents([courseA, courseB, courseC])
 */
func busyStudents( _ aset : [Set<String>]) -> Set<String>{
    var mset: Set<String> = aset[0]
    let size=aset.count-1
    for i in 1...size{
        mset = mset.intersection(aset[i])
    }
    return mset
}
let courseA: Set = ["Peter", "Paul", "Mary"]
let courseB: Set = ["Peter", "Paul", "Dylan"]
let courseC: Set = ["Tom", "Peter"]
print(busyStudents([courseA, courseB, courseC]))


/*4. Write a Swift function, call it average, that has one argument an array of Ints and returns
 an optional double, which is the average of the inputs ints. If the input array is empty return
 the optional value nil.
 */
func average( _ myArray: [Int]) -> Double? {
    var sum: Double = 0.0
    if myArray.isEmpty{
        return nil
    }
    else{
        for num in myArray
        {
            sum += Double(num)
        }
    }
    return sum / Double(myArray.count)
}
print(average([2,2,2]))


/*5. Write a Swift function average2 which is the same as average in #4 except that the input is
 an array of optional ints.
 */
func average2( _ nums: [Int?]) -> Double? {
    var sum: Double = 0.0
    let array: [Int?] = nums
    let filtered = array.compactMap { $0 }
    if filtered.isEmpty{
        return nil
    }
    else
    {
        for num in filtered {
            sum += Double(num)
            
        }
        return sum / Double(filtered.count)
    }
}
print(average2( [2,nil,2]))

/*
 6. Write a Swift function cost that has one argument a dictionary. The dictionary has three
 keys: “name”, “price”, and “quantity”. The function cost returns the cost of the item, that is
 the price * quantity. The keys and values in the dictionary are all strings. The value at
 “price” is the string of a double like “3.45”. The string at “quantity” is the string of an integer.
 Note that if either the key “price” or “quantity” is not in the map the function “cost” returns 0
 (zero). Examples given below.
 let iceCreamA = ["name":"Mochie Green Tea", "quantity": "2", "price": "2.3"]
 let iceCreamB = ["name":"Mochie Green Tea", "price": "2.3"]
 cost(iceCreamA) // returns 4.6
 cost(iceCreamB) // returns 0
 */

func cost(dict: Dictionary<String,String>) -> Double{
    let dict1 :Dictionary<String,String> = dict
    let priceExists = dict1["price"] != nil
    let quantExists = dict1["quantity"] != nil
    let price: String? = dict1["price"]
    let quantity: String? = dict1["quantity"]
    var amount:Double = 0.0
    
    if(priceExists && quantExists)
    {
        if let newprice = Double(price!)
        {
            if let newquant = Int(quantity!)
            {
                amount = newprice * Double(newquant)
                return amount
            }
        }
        return amount
    }
    else
    {
        
        return 0
    }
}

//print(cost(dict: ["name": "yesha","price": "4.0", "quantity": "3"]))

/*7. Write a Swift function wordCount that has two arguments, a string and an Int. The string
contains words separated by a space. For example “cat bat cat rat mouse bat”. wordCount
returns a dictionary where the keys are the words in the string and the values are the number of times the word appears in the list. Only the words that occur at least as many times
as the second argument are in the dictionary.
wordCount(words: “cat bat cat rat mouse bat”, count: 1) returns [“cat”: 2, “bat”: 2 “rat”: 1,
“mouse”: 1]
wordCount(words: “cat bat cat rat mouse bat”, count: 2) returns [“cat”: 2, “bat”: 2 ]
wordCount(words: “cat bat cat rat mouse bat”, count: 3) returns [:]
 */
func wordCount(words : String, count : Int) -> Dictionary<String,Int>
{
    let tempwords : String = words
    let arrwords = tempwords.components(separatedBy: " ")
    var counts: [String: Int] = [:]
    for item in arrwords {
        counts[item] = (counts[item] ?? 0) + 1
    }
    let filtered = counts.filter { $0.value >= count }
    return filtered

}
print(wordCount(words : "cat bat cat rat mouse bat",count : 2))

/*8. Write a Swift function wordCount2 that has the same arguments as wordCount in problem
 7 and returns the same result. However give the second argument a default value of 2 so
 we can call the function with one or two arguments as shown below.
 wordCount2(words: “cat bat cat rat mouse bat”) returns [“cat”: 2, “bat”: 2 ]
 wordCount2(words: “cat bat cat rat mouse bat”, count: 3) returns [:]
 */
func wordCount2(words : String, wordcount : Int = 2) -> Dictionary<String,Int>
{
    let tempwords : String = words
    let arrwords = tempwords.components(separatedBy: " ")
    var counts: [String: Int] = [:]
    for item in arrwords {
        counts[item] = (counts[item] ?? 0) + 1
    }
    let filtered = counts.filter { $0.value >= wordcount }
    return filtered
    
}
print(wordCount2(words : "cat bat cat rat mouse bat cat",wordcount: 3))

/*9. Write a Swift function wordCount3 that has one argument an Int, which has the same role
 as the second argument of wordCount. wordCount3 returns a function. The return function
 has one argument a String that contains words. When evaluated the returned function returns the dictionary of words in the string with the number of times the word appears in the
 list. But as in problem 7 it only contains the words that occur as many times as the argument to wordCount3. See examples below.
 let testA = wordCount3(2)
 testA(words: “cat bat cat rat mouse bat”) returns [“cat”: 2, “bat”: 2 ]
 testA(words: “a a a b c c”) returns [“a”: 3, “c”: 2]
 let testB = wordCount3(3)
 testB(words: “a a a b c c”) returns [“a”: 3]
 */

func wordCount3(wordcount: Int) -> ((String) -> Dictionary<String,Int>)
{
    func internalwordcount(words:  String) -> Dictionary<String,Int>
    {
        let tempwords : String = words
        let arrwords = tempwords.components(separatedBy: " ")
        var counts: [String: Int] = [:]
        for item in arrwords {
            counts[item] = (counts[item] ?? 0) + 1
        }
        let filtered = counts.filter { $0.value >= wordcount }
        return filtered
    }
    
    return internalwordcount
}
let testA = wordCount3(wordcount : 3)
print(testA("cat bat cat rat cat mouse bat"))
//print(wordCount3(words : "cat bat cat rat mouse bat", count : 3))



/*10.The problem with polyTable in problem two is that if we what to change the equation (k3 +
 2*k + 4) we need to edit and recompile polyTable. Write a Swift function evaluate that has
 two arguments. The first argument is an Int as in problem two. The second argument of
 evaluate is itself a function that has an Int as an argument and returns a double. Your function evaluate then returns an array of doubles. The k’th element of the returned array is the
 result of evaluating the second argument with the value k for k = 0, 1, ..., N.
 */
func evaluate(N:Int, poly1: (Int) -> Double ) -> [Double]
{
    var answer: [Double]=[]
    if N == 0
    {
        return answer
    }
    for i in 0...N{
        answer.append(poly1(i))
        
    }
    return answer
}

func poly(N:Int) -> Double
{
    return (pow(Double(N),3.0) + (2 * Double(N)) + 4)
}

//print(poly(N:0))
//print(evaluate(N:0,poly1: poly))

