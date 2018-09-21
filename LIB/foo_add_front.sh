#!/bin/bash
function foo_add_front
{
for f in *;do
    safety_function
    mv "$f" "$what${f}"
done
}
 
            