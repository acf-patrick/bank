// import * as data from './list-content.js';

const strCompare = (s1, s2) => (s1 < s2)?-1:((s1==s2)?0:1);

class List {
    constructor(lists) {
        this.lists = lists;

        this.sortFuncs = {
            "responsable": (a, b) => strCompare(a.responsable, b.responsable),
            "montant": (a, b) => a.montant - b.montant,
            "datePret": (a, b) => strCompare(a.datePret, b.datePret),
            "dateFinRemboursement": (a, b) => strCompare(a.dateFinRemboursement, b.dateFinRemboursement)
        };

        this.count = 5;
    }

    load() {
        for (let i=0; i<this.count; ++i) {
            let obj = this.lists[i];

            let row = document.createElement("tr");
            [ "responsable", "montant", "datePret", "dateFinRemboursement" ].forEach(key => {
                let elt = document.createElement("td");
                elt.classList.add('vertical-align-middle');
                elt.innerHTML = obj[key] + (key == "montant"?" Ar":'');
                row.appendChild(elt);
            });

        // create view/edit buttons
            let td = document.createElement("td");
            td.classList.add("d-flex", "justify-content-evenly");
            td.innerHTML = `
                <div class="btn btn-primary" title="view"><img class="resize-image" src="../images/view.png" alt="view"></div>
                <div class="btn btn-danger" title="edit"><img class="resize-image" src="../images/editer.png" alt="edit"></div>
            `;
            row.appendChild(td);

            document.querySelector("tbody").appendChild(row);
        }
    }

    sort(type, reverse) {
        this.lists.sort(reverse ? ((a, b)  => -this.sortFuncs[type](a, b)) : this.sortFuncs[type]);
    }

    render() {
        document.querySelector("tbody").remove();
        document.querySelector("table").appendChild(document.createElement("tbody"));
        this.load(this.count);
    }
};

fetch("../php/register.php")
 .then( response => response.json() )
 .then( data => { 
    let lists = new List(data.map(obj => {
        let ret = {};

        ret.responsable = obj.responsible;
        ret.montant = obj.amount;
        ret.datePret = obj.created_at;
        ret.dateFinRemboursement = obj.repayment_end_date;

        return ret;
    }));

    // define entry max value
    let entry = document.querySelector(".entry");
    entry.max = lists.lists.length;
    entry.value = lists.count;
    entry.addEventListener("change", e => {
        lists.count = entry.value;
        lists.render();
    });

    lists.render();

    let last;
    let reverse = false;
    [ "responsable", "montant", "datePret", "dateFinRemboursement" ].forEach( key => {
        let elt = document.querySelector('.'+key);

    // add arrow to table header
        let img = document.createElement("img");
        img.src = "../images/arrow.png";
        img.alt = "arrow";
        img.classList.add("position-image", "resize-image", "hide", "arrow");
        elt.appendChild(img);

        elt.addEventListener("click", (e) => {
            let arr = elt.querySelector(".arrow");

            if (last) {
                let lastArr = last.querySelector(".arrow");
                if (last === elt)
                    reverse = !reverse;
                else {
                    reverse = false;
                    lastArr.classList.add("hide");
                }
            // rotate arrow
                arr.classList.toggle("rotate", reverse);
            }

        // update last
            last = elt;
            arr.classList.remove("hide");

        // sort the list
            lists.sort(key, reverse);
            lists.render();
        });
    });
});

