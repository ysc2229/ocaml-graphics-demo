(*
Copyright (c) 2019 Ilya Sergey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*)


(* OCaml library *)
open Graphics

(* Local project library *)
open GraphicUtil

(******************************************)
(*                                        
More examples available at:

https://caml.inria.fr/pub/docs/oreilly-book/html/book-ora048.html

*)
(******************************************)

let draw_square _ = 
  draw_rect 20 20 360 360

let draw_cross _ = 
  for i = 20 to 380 do
    plot i i;
    plot i (400 - i);
  done

let draw_text s x y =
  moveto x y;
  draw_string s

let mouth = 
  [(40, 100); (70, 80); (350, 80); (380, 100)] |> Array.of_list

let tongue = 
  [(250, 79); (250, 30); (300, 30); (300, 79)]|> Array.of_list

let left_eye = 
  [(60, 260); (100, 260); (100, 300); (60, 300)] |> Array.of_list
let left_iris = 
  [(70, 260); (90, 260); (90, 280); (70, 280)] |> Array.of_list


let right_eye = 
  [(320, 260); (360, 260); (360, 300); (320, 300)] |> Array.of_list
let right_iris = 
  [(330, 260); (350, 260); (350, 280); (330, 280)] |> Array.of_list


let nose = 
  [(160, 150); (240, 150); (240, 210); (160, 210)] |> Array.of_list

let polys = [mouth; left_eye; right_eye; nose]
            
let draw_face _ = 
  List.iter draw_poly polys;
  (* Colors *)
  set_color Graphics.magenta;
  fill_poly nose;
  set_color Graphics.black;
  fill_poly left_iris;
  fill_poly right_iris

let draw_tongue _ = 
  set_color Graphics.red;
  fill_poly tongue;
  set_color Graphics.white;
  fill_poly right_iris;
  set_color Graphics.black

let remove_tongue _ = 
  set_color Graphics.white;
  fill_poly tongue;
  set_color Graphics.black;
  fill_poly right_iris


let tease_text = "Press t to tease."
let exit_text = "Press q to close this window."

let rec wait_until_q_pressed t =
  let event = wait_next_event [Key_pressed] in
  if event.key == 't' 
  then begin
    if t then draw_tongue () else remove_tongue ();
    wait_until_q_pressed (not t)
  end
  else if event.key == 'q' 
  then exit 0
  else wait_until_q_pressed t

let () =
  open_graph " 400x500";
  draw_face ();
  draw_text tease_text 130 420;
  draw_text exit_text 100 400;
  wait_until_q_pressed true

  
    
