// import * as data from './list-content.js';

const strCompare = (s1, s2) => (s1 < s2)?-1:((s1==s2)?0:1);

class List {
    constructor() {
        this.lists = [
            {
                "responsable": "Airi Satou",
                "montant": 350000,
                "datePret": "28-11-2021",
                "dateFinRemboursement": "01-02-2022"
            }, {
                "responsable": "Angelica Ramos",
                "montant": 1200000,
                "datePret": "09-10-2009",
                "dateFinRemboursement": "01-10-2010"
            }, {
                "responsable": "Ashton Cox",
                "montant": 86000,
                "datePret": "12-01-2009",
                "dateFinRemboursement": "01-02-2009"
            }, {
                "responsable": "Bradley Greer",
                "montant": 132000,
                "datePret": "13-10-2012",
                "dateFinRemboursement": "01-11-2012"
            }, {
                "responsable": "Brenden Wagner",
                "montant": 206850,
                "datePret": "07-06-2011",
                "dateFinRemboursement": "01-08-2011"
            }, {
                "responsable": "Brielle Williamson",
                "montant": 372000,
                "datePret": "02-12-2012",
                "dateFinRemboursement": "01-04-2013"
            }, {
                "responsable": "Bruno Nash",
                "montant": 163500,
                "datePret": "03-05-2011",
                "dateFinRemboursement": "01-07-2011"
            }, {
                "responsable": "Caesar Vance",
                "montant": 106450,
                "datePret": "12-12-2011",
                "dateFinRemboursement": "01-01-2012"
            }, {
                "responsable": "Cara Stevens",
                "montant": 145600,
                "datePret": "06-12-2011",
                "dateFinRemboursement": "02-01-2012"
            }, {
                "responsable": "Cedric Kelly",
                "montant": 433060,
                "datePret": "29-03-2012",
                "dateFinRemboursement": "01-07-2012"
            }, {
                "responsable": "Colleen Hurst",
                "montant": 205500,
                "datePret": "15-09-2009",
                "dateFinRemboursement": "01-11-2009"
            }, {
                "responsable": "Charde Marshall",
                "montant": 470600,
                "datePret": "16-10-2008",
                "dateFinRemboursement": "01-03-2009"
            }, {
                "responsable": "James Yates",
                "datePret": "02-07-2010",
                "dateFinRemboursement": "01-09-2010",
                "montant": 200500
            }
        ];

        this.sortFuncs = {
            "responsable": (a, b) => strCompare(a.responsable, b.responsable),
            "montant": (a, b) => a.montant - b.montant,
            "datePret": (a, b) => strCompare(a.datePret, b.datePret),
            "dateFinRemboursement": (a, b) => strCompare(a.dateFinRemboursement, b.dateFinRemboursement)
        };
    }

    load() {
        this.lists.forEach((obj) => {
            let row = document.createElement("tr");
            [ "responsable", "montant", "datePret", "dateFinRemboursement" ].forEach((key) => {
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
        });
    }

    sort(type, reverse) {
        this.lists.sort(reverse ? ((a, b)  => -this.sortFuncs[type](a, b)) : this.sortFuncs[type]);
    }

    render() {
        document.querySelector("tbody").remove();
        document.querySelector("table").appendChild(document.createElement("tbody"));
        this.load();
    }
};

let lists = new List();
lists.load();

let last;
let reverse = false;
[ "responsable", "montant", "datePret", "dateFinRemboursement" ].forEach((key) => {
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
            if (last === elt) {
                reverse = !reverse;
                // rotate arrow
                arr.classList.toggle("rotate", reverse);
            }
            else {
                reverse = false;
                lastArr.classList.add("hide");
            }
        }

    // update last
        last = elt;
        arr.classList.remove("hide");

    // sort the list
        lists.sort(key, reverse);
        lists.render();
    });
});

export default { lists };