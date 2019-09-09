/* 
  readme.md
  Register

  Created by Manh Quan Do on 9/5/19.
  Copyright © 2019 Manh Quan Do. All rights reserved.
*/


## How to test with TestFlight

* `https://www.raywenderlich.com/5352-testflight-tutorial-ios-beta-testing`
*  UI Design for Android Studio App `https://www.youtube.com/watch?v=E6c3DGnvefY`
https://viblo.asia/p/tung-buoc-de-day-apps-len-testflight-yMnKMg0zl7P


Alamofire Request Swift 5

https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md

### Working with Swift

* Explain in vietnamese about keyword in Swift

`https://medium.com/fantageek/t%E1%BA%A5t-c%E1%BA%A3-keywords-trong-swift-159b92806cfe`

Best about keyword

`https://viblo.asia/p/tim-hieu-ve-closures-trong-swift-naQZRXDv5vx`

Best about author



defer : sử dụng khi muốn đảm bảo thực thi 1 đoạn code nào đó ngay khi hàm kết thúc.

```
func test()
{
defer
{
print("2") // thằng này print sau
}
print("1") // thằng này print trước
}
```

Any : để hiện diện cho bất kỳ loại thuộc tính nào của đối tượng, bao gồm cả hàm.
`var anything = [Any]()`

```
let aResult = try dangerousFunction() //có lỗi là phải catch lại 
let aResult = try! dangerousFunction() //có lỗi là crash luôn 
if let aResult = try? dangerousFunction() //Unwrap 1 giá trị optional từ hàm này trả về
```

`let _ = Singleton() //Ignore value or unused variable`

Phương thức trên có param là một string và một closure, trong function, closure được gọi đến như một function thông thường, nên nó còn được gọi là function không tên. Việc sử dụng cũng vô cùng đơn giản:

```
sampleFunction("Windy day", closureParameter: {(string) in
print(string)
})
```
Ngoài ra, ta còn có thể rút gọn cách sử dụng nếu closure là param cuối cùng của function như sau:
```
sampleFunction("Windy day") {(string) in
print(string)
}
```
Theo sau closures là một loạt các function được gọi là higher order functions (HOFs). HOFs là function sử dụng function khác như một parameter, khái niệm này thường xuất hiện trong kiểu collection trong Swift: map, filter, forEach, reduce và flatMap.

* `Enum`  limit number array can get and using in accossiate values

3. ForEach
forEach duyệt qua lần lượt từng phần tử và thực hiện câu lệnh tương ứng:
```
let forEachNumbers = [1, 2, 3, 4, 5]
forEachNumbers.forEach { print($0) } //In ra từng phần tử trên từng dòng riêng biệt

```
4. Reduce
```
let reduceNumbers = [1, 2, 3, 4 ,5]
let reducedNumber = reduceNumbers.reduce(0) { $0 + $1 }
print(reducedNumber) //prints 15
```
Sử dụng reduce để kết hợp tất cả các items trong một collection lại và tạo ra một giá trị mới. Trong ví dụ trên, ta cộng tất cả các số trong mảng reduceNumbers thành một. Param (0) được cung cấp trong reduce function là giá trị khởi tạo, reduce bắt đầu với giá trị khởi tạo và cộng tiếp các giá trị tiếp theo trong collection. Nếu ta truyền giá trị khởi tạo là 10, thì kết quả trong ví dụ trên là 25.

5. FlatMap
Cách dùng đơn giản nhất của flatMap chính là làm "phẳng" một collection của các collection:
```
let collections = [[5, 2, 7], [4, 8], [9, 1, 3]]
let flat = collections.flatMap { $0 }
// [5, 2, 7, 4, 8, 9, 1, 3]

```
Nó còn nhận biết được các giá trị nil và loại bỏ khỏi collection:
```
let flatMapNumbers = [1, nil, 2, nil, 3, nil, 4, nil, 5]
let flatMappedNumbers = flatMapNumbers.flatMap { $0 }
print(flatMappedNumbers) //prints [1, 2, 3, 4, 5]
```
flatMap duyệt qua từng phần tử trong collection và chỉ chọn những giá trị khác nil. Ngoài ra, nó còn có thể kết hợp với các functions khác một cách hiệu quả:
```
let collections1 = [[5, 2, 7], [4, 8], [9, 1, 3]]
let onlyEven1 = collections1.flatMap { $0.filter { $0 % 2 == 0 }}
// print [2, 4, 8]
```

Value vs Reference Types
Khi tạo mới object2 và gán giá trị của object1 cho nó, reference types sẽ refer object2 tới object1, nghĩa là nếu giá trị của object1 thay đổi thì object2 cũng thay đổi theo, vì chúng cùng chia sẻ chung một giá trị. Trong khi đối với value type, object2 sẽ được copy ra một giá trị riêng độc lập với object1. Hãy cùng xem ví dụ sau:
```
// Reference type
NSString *myString = @"Day";
NSString *myOtherString = myString;
myString = @"Night";
NSLog(myOtherString); //prints "Night"
// Value type
var myString = "Don't change me"
let myOtherString = myString
myString = "Dun care, I changed"
print(myOtherString) //prints "Don't change me"
```
Trong Swift, struct là value type và class là reference type.


Generic Function

`func exampleFunction<T>(var1 : T, var2 : T) { }`

None escaping va escaping closure

Closure param mặc định là non-escaping, sử dụng từ khoá `@escaping` với closure param để thoát khỏi thực thi của closure.

Non-escaping closure có vòng đời như sau:
```
Truyền closure vào làm tham số của function
Thực thi function và closure
Function return
```

Escaping closure 

```

```
