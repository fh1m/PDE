Vim�UnDo� ��Ds�t�Y���i�l��Oj�>����Ww   9                                  bנ    _�                             ����                                                                                                                                                                                                                                                                                                                                                             bנ     �                   �               5��                    8                      }      5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             bנ    �   7   9              return();  �   6   8              }  �   5   7                          .spawn();  �   4   6          %                .arg("PATH-TO-IMG")  �   3   5          )                .arg("--set-zoom-fill")  �   2   4          "                .arg("--head=0")  �   1   3          "        Command::new("nitrogen")  �   0   2              else{  �   /   1              }  �   -   /          -                .arg("PATH-TO-BLURRED-IMG")  �   ,   .          )                .arg("--set-zoom-fill")  �   +   -          "                .arg("--head=0")  �   *   ,          "        Command::new("nitrogen")  �   )   +              if n > 1 {  �   (   *              println!("{}", n);  �   '   )              }  �   &   (                  n += 1;  �   %   '              for _i in process_mem {  �   $   &          0    let process_mem = process_mem.split("\n");  �   #   %          @    let process_mem = String::from_utf8_lossy(&output.stdout);  �   "   $          $                         .output()  �   !   #          *                         .arg(".window")  �       "          %                         .arg("-n")  �      !          %                         .arg("-N")  �                 (                         .arg("query")  �                '    let output = Command::new("bspc")  �                    let mut n: isize = 0;  �                fn blur() {  �                    }  �                        old_n = n;  �                        }  �                            blur();  �                        if n != old_n {  �                        }  �                            n += 1;  �                !        for _i in process_mem {  �                4        let process_mem = process_mem.split("\n");  �                D        let process_mem = String::from_utf8_lossy(&output.stdout);  �                '                             .output() �                .                             .arg(".window")  �                )                             .arg("-n")  �                )                             .arg("-N")  �   
             ,                             .arg("query")  �   	             +        let output = Command::new("bspc")  �      
                  n = 0;  �      	          3        thread::sleep(Duration::from_millis(25));  �                    loop {  �                    let mut old_n: isize = 0;  �                    let mut n: isize = 0;  �                fn main() {  �          9      use std::process::Command;  5��                                                �                         J                      �                         d                      �                         �                      �       
                  �                      �       1                  �                      �                         �                      �    	   )                  �                      �    
   *                  #                     �       '                  K                     �       '                  s                     �       ,                  �                     �       &                  �                     �       B                  
                     �       2                  =                     �                         ]                     �                         q                     �       	                  {                     �                         �                     �                         �                     �       	                  �                     �                         �                     �                         �                     �                         �                     �                         �                     �       %                                       �       &                  @                     �       #                  d                     �        #                  �                     �    !   (                  �                     �    "   "                  �                     �    #   >                                       �    $   .                  B                     �    %                     ^                     �    &                     n                     �    '                     t                     �    (                     �                     �    )                     �                     �    *                      �                     �    +                      �                     �    ,   '                                       �    -   +                  0                     �    /                     P                     �    0   	                  Z                     �    1                      {                     �    2                      �                     �    3   '                  �                     �    4   #                  �                     �    5                                          �    6                                          �    7                                          5��