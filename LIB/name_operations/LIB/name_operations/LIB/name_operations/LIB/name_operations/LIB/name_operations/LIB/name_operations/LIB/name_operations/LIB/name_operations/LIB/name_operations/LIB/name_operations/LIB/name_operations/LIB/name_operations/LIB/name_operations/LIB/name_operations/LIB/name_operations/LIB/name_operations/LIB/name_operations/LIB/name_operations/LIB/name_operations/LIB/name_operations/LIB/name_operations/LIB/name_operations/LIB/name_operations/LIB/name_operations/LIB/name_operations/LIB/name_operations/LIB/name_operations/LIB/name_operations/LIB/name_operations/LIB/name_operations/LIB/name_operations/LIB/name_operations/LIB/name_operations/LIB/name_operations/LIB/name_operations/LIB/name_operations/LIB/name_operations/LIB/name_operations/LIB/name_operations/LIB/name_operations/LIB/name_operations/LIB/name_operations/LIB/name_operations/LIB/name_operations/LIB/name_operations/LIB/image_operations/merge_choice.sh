
function merge_choice
{
      echo -e "merge two pictures veridically or horizontally? (name them 1.ext and 2.ext)\n[0] |||  - vertical\n[9] ---  - horizontal"
        read merge_choice
        echo "insert an extension"
        read ext
        echo "how to name the result?"
        read result_name
}