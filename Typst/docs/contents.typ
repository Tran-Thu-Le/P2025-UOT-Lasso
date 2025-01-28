#import "../tools/macros.typ": eqref, eqnum, myref, figref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example
#import "@preview/ctheorems:1.1.3": thmrules
#show: thmrules.with(qed-symbol: $square$)
// #set math.equation(numbering: "(1.1)", supplement: "Eq.")



= Định dạng văn bản 


== Định dạng chữ

- *In đậm*
- _In đậm_
- #highlight[Tô vàng]
- #highlight(fill: blue)[Tô xanh]
- #underline[Gạch dưới]
- #overline[Gạch trên]
- #strike[Gạch bỏ]
- #box(stroke: red)[Đóng khung]
- #box(stroke: red, inset: 0.2em)[Đóng khung rộng]
- #text(font: "PT Sans")[Đổi font chữ]
- #text(size: 1.5em)[Đổi size chữ] 

== Định dạng list 
- Để tạo list không thứ tự, dùng dấu trừ `-`
    - mục a
    - mục b
    - mục c
- Để tạo list có thứ tự, dùng `+`
    + mục 1
    + mục 2
    + mục 3 

== Căn giữa

Dùng hàm `#align(center)`. Ví dụ:
  
#align(left)[Nội dung căn trái]
#align(center)[Nội dung căn giữa]
#align(right)[Nội dung căn phải]

== Cách ẩn một đoạn không dùng nữa 

Ví dụ câu sau sẽ không hiện trên pdf 

// Câu này k xuất hiện 


== Đề mục 

Ta tạo đề mục bằng dấu `=`

Số lượng dấu `=` sẽ là cấp của đề mục đó. Ví dụ 
  - Cấp 1 `=`
  - Cấp 2 `=`
  - Cấp 3 `===`

Chú ý, hạn chế các đề mục từ cấp 4 trở lên.


= Lập trình Typst 

== Biến

Typst là một ngôn ngữ lập trình để soạn thảo văn bản. Như vậy Typst cũng là một ngôn ngữ lập trình. 

Ví dụ sau tính tổng của hai số a và b và in nó ra file pdf.

```typst
#let a  = 5
#let b  = 7
#let c  = a + b
Ta có $a + b = #c$
```

Nhập đoạn code trên vào ta có kết quả

#let a  = 5
#let b  = 7
#let c  = a + b
Ta có $a + b = #c$ 

- Chế độ bình thường của Typst là văn bản 
- #highlight[Chế độ code được bật lên bằng dấu `#`]

== Hàm 

Ta định nghĩa hàm trong typst như sau 

#let sum(a, b) = a + b 

Khi đó $3 + 4 = #sum(3, 4)$

Khi hàm số được tính toán phức tạp ta đặt đoạn code trong dấu `{}`

#let factorial(a) = {
  let result  = 1
  for i in range(1, a+1) {
    result = result * i
  }
  return result
}

Khi đó $4! = #factorial(4)$

== Data

Data trong Typst có các dạng chính
- Số 
- Chữ 
- Boolean `true, false`


Data tổng hợp trong Typst có hai dạng chính

- List  `#let a = (1,2,3,4,5)`
- Dictionary  `#let john = (age: 18, name: "john", sex: "men")`
#let john = (age: 18, name: "john", sex: "men")

#let a = (1,2,3,4,5) 

- Cách truy cập phần tử của list: Phần tử thứ hai của list a có giá trị bằng #a.at(1) (do đếm từ 0, 1, 2,....)
- Cách truy cập phần tử của dictionary: Tuổi của John là  #john.age



= Bảng và hình ảnh

== Bảng

#table(
  columns: 3,
  [*Cột 1*],
  [*Cột 2*],
  [*Cột 3*],

  [Dòng 1], [Dòng 1], [Dòng 1],
  [Dòng 2], [Dòng 2], [Dòng 2],
)

Muốn cho bảng vào giữa, ta đặt bảng trong hàm `#align(center)`

#align(center)[
  #table(
    columns: 3,
    [*Cột 1*],
    [*Cột 2*],
    [*Cột 3*],

    [Dòng 1], [Dòng 1], [Dòng 1],
    [Dòng 2], [Dòng 2], [Dòng 2],
  )
]

Muốn cho bảng dãn rộng bằng văn bản, ta đổi biến cột thành `(1 fr, 1 fr, 1 fr)`
#table(
    columns: (1fr, 1fr, 1fr),
    [*Cột 1*],
    [*Cột 2*],
    [*Cột 3*],

    [Dòng 1], [Dòng 1], [Dòng 1],
    [Dòng 2], [Dòng 2], [Dòng 2],
)

Muốn căn giữa nội dung, thêm biến `align` trọng hàm `#table`
#table(
    columns: (1fr, 1fr, 1fr),
    align: center,
    [*Cột 1*],
    [*Cột 2*],
    [*Cột 3*],

    [Dòng 1], [Dòng 1], [Dòng 1],
    [Dòng 2], [Dòng 2], [Dòng 2],
)

== Hình ảnh 

Chèn hình bằng hàm `#image()`
#image("snake.jpg", width: 30%)

Thêm tiêu đề hình bằng hàm `#figure()`

#figure(
  image("snake.jpg", width: 30%),
  caption: [Tiêu đề của hình],
) <hinh-logo-DHCT>

Cách trích dẫn hình: Ta thấy trong hình @hinh-logo-DHCT, ....


= Định dạng Toán

== Công thức toán 

- Viết công thức trên 1 dòng cùng với text, $a^2 + b^2 = c^2$

- Viết công thức trên 1 dòng riêng

#eqnum[$ integral_a^b f(x) d x = F(b)- F(a) $ <eq-newton>]



- Cách trích dẫn phương trình
  - Cách mặc định dùng `@`, ví dụ: Xét phương trình @eq-newton và @eq-newton-2
  - Cách mặc định dùng `#eqref()`, ví dụ: Xét phương trình #eqref(<eq-newton>) (equation reference) và #eqref(<eq-newton-2>)

// #set math.equation(numbering: none)
Ta có thể viết tiếp một phương trình không đánh số thứ tự 
$ integral_a^b f'(x) d x = f(b)- f(a) $


Ta có thể tiếp tục một phương trình có đánh số thứ tự bằng hàm `#eqnum()` (equation numbering)

#eqnum[$ integral_a^b f''(x) d x = f'(b)- f'(a) $ <eq-newton-2>]



== Định lý

#proposition[Trong một tam giác vuông ta có $a^2 + b^2 = c^2$.]

#theorem[(Định lý Pytago) Trong một tam giác vuông ta có $ a^2 + b^2 = c^2. $]

#proof[Ta cần chứng minh ....]

#example[Xét ví dụ sau ....] 

== Vẽ đồ thị

Để vẽ đồ thị ta sử dụng Cetz - một thư viện của Typst: 
#link("https://typst.app/universe/package/cetz/")[Link Cetz package]. 


Chú ý rằng để sử dụng thư viện Cetz (hay bất kỳ thư viện nào khác), ta cần thêm đoạn code sau vào đầu trang:

```typst
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
```

Ví dụ ta thực hiện vẽ một đồ thị. Chú ý lúc này dùng Cetz phiên ban `0.1.2`
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#let do-thi-vo-huong = canvas(length: 10%, {
  import cetz.draw: *

  let y = 2 
  let x = 4
  let y-space = 1
  let h=1.4

  circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
  content("v1", $v_1$, anchor: "left", padding: 0.2)

  circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
  content("v2", $v_2$, anchor: "right", padding: 0.2)

  circle((2, 1), radius: 0.05,fill:black, name: "v3") 
  content("v3", $v_3$, anchor: "bottom", padding: 0.2)

  circle((-1, 0), radius: 0.05,fill:black, name: "v4") 
  content("v4", $v_4$, anchor: "left", padding: 0.2)

  circle((-3, 1), radius: 0.05, fill: black, name: "v5") 
  content("v5", $v_5$, anchor: "right", padding: 0.2)
  
  line("v1", "v2", name: "v1v2")
  line("v2", "v3", name: "v2v3")
  line("v2", "v4", name: "v2v4")
  line("v5", "v1", name: "v5v1")
  line("v3", "v5", name: "v3v5")
  line("v4", "v1", name: "v4v1")
  content("v1v2", $e_1$, anchor: "bottom", padding: 0.2)
  content("v2v3", $e_2$, anchor: "bottom", padding: 0.2)
  content("v2v4", $e_3$, anchor: "top", padding: 0.2)
  content("v5v1", $e_4$, anchor: "bottom", padding: 0.2)
  content("v3v5", $e_5$, anchor: "top", padding: 0.2)
  content("v4v1", $e_6$, anchor: "left", padding: 0.2) 
})
#figure(
  do-thi-vo-huong,
  caption: [Hình biểu diễn của đồ thị],
) <fig-do-thi-vo-huong>

Giờ ta thực hiện vẽ một đồ thị hàm số, chú ý lúc này dùng Cetz phiên ban `0.2.2`
#import "@preview/cetz:0.2.2": canvas, plot
#import "@preview/cetz:0.2.2"
#let do-thi-ham-so = canvas(length: 1cm, {
  import cetz.draw: *
  // content((2, 2), [Here], padding: .1)
  plot.plot(
    size: (7, 7),
    axis-style: "school-book",
    plot-style: (stroke: black),
    x-tick-step: 2, y-tick-step: 2,
    x-min: 1-5, x-max: 1+5,
    y-min: 1-5, y-max: 1+5,    
    x-grid: true, y-grid: true,
    {
      plot.add(
        style: (stroke: (paint: blue, thickness: 2pt)),
        label: $f(x) = (x-3)/(x-1)$,
        domain: (-10,0.9),
        samples: 100,        
        x => (x, (x -3)/(x - 1)),
        )
      plot.add(
        style: (stroke: (paint: blue, thickness: 2pt)),
        domain: (1.1, 10),
        samples: 100,        
        x => (x, (x -3)/(x - 1)),
        )
      plot.add(
        style: (stroke: (paint: red, dash: "dashed")),
        domain: (-10, 10),
        samples: 100,        
        x => (x, 1),
        )        
      plot.add(
        style: (stroke: (paint: red, dash: "dashed")),
        domain: (-10, 10),
        samples: 100,        
        x => (1, x),
        )
      plot.annotate({
        content((-2, 2), $f(x)$, padding: 0.5em)
      })
    })
})
#figure(
  do-thi-ham-so,
  caption: [Hình biểu diễn của đồ thị hàm số],
) <fig-do-thi-ham-so>

== Trích dẫn bài báo 

Lưu các bài báo cần trích dẫn vào file `ref.bib`. Sau đó là có thể trích dẫn bằng lệnh `@label`. Ví dụ 

- Trong bài báo @alizadehBudgetconstrainedInverseMedian2020a, các tác giả đã ....
- Trong bài báo @espejo2023p, các tác giả đã ....

Các bài báo trích dẫn sẽ tự động xuất hiện trong tài liệu tham khảo.



