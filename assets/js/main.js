import { lists, sort } from './list';

// last table header element that has been selected 
let last = ""; 
[ "name", "position", "office", "age", "startDate", "salary" ].forEach((cls) => {
    let clsElt = document.querySelector('.' + cls);
    clsElt.addEventListener("click", (e) => {
// manage arrow icon
        let lastElt = document.querySelector('.'+last+"ArrowIcon");
    // false only if last variable is an empty string
        if (lastElt)
            lastElt.src = "";

        let arr = document.querySelector('.'+cls+"ArrowIcon");
        arr.src = (arr.src == "up.png")?"down.png":(arr.src)?"up.png":"";
        // update last
        last = cls;

// sort main list
        lists.sort(sort[cls]);
    });
});