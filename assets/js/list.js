import * as data from './list-content.js';

const strCompare = (s1, s2) => (s1 < s2)?-1:((s1==s2)?0:1);

class List {
    constructor() {
        this.lists = [
            {
                "name": "Airi Satou",
                "position": "Comptable",
                "office": "Tokyo",
                "age": 33,
                "startDate": "28-11-2008",
                "salary": 162700
            }, {
                "name": "Angelica Ramos",
                "position": "CEO",
                "office": "Londre",
                "age": 47,
                "startDate": "09-10-2009",
                "salary": 1200000
            }, {
                "name": "Ashton Cox",
                "position": "Rédacteur téchnique",
                "office": "San Fransisco",
                "age": 66,
                "startDate": "12-01-2009",
                "salary": 86000
            }, {
                "name": "Bradley Greer",
                "position": "Software Engineer",
                "office": "Londre",
                "age":41 ,
                "startDate": "13-10-2012",
                "salary": 132000
            }, {
                "name": "Brenden Wagner",
                "position": "Software Engineer",
                "office": "San Fransisco",
                "age": 28,
                "startDate": "07-06-2011",
                "salary": 206850
            }, {
                "name": "Brielle Williamson",
                "position": "Spécialiste en Intégration",
                "office": "New York",
                "age": 61,
                "startDate": "02-12-2012",
                "salary": 372000
            }, {
                "name": "Bruno Nash",
                "position": "Software Engineer",
                "office": "Londre",
                "age": 38,
                "startDate": "03-05-2011",
                "salary": 163500
            }, {
                "name": "Caesar Vance",
                "position": "Assistant avant vente",
                "office": "New York",
                "age": 21,
                "startDate": "12-12-2011",
                "salary": 106450
            }, {
                "name": "Cara Stevens",
                "position": "Assistant commérical",
                "office": "New York",
                "age": 46,
                "startDate": "06-12-2011",
                "salary": 145600
            }, {
                "name": "Cedric Kelly",
                "position": "Développeur JavaScript senior",
                "office": "Edinburgh",
                "age": 22,
                "startDate": "29-03-2012",
                "salary": 433060
            }, {
                "name": "Colleen Hurst",
                "position": "Développeur JavaScript",
                "office": "San Fransisco",
                "age": 39,
                "startDate": "15-09-2009",
                "salary": 205500
            }, {
                "name": "Charde Marshall",
                "position": "Dirécteur Régional",
                "office": "San Fransisco",
                "age": 36,
                "startDate": "16-10-2008",
                "salary": 470600
            }, {
                "name": "James Yates",
                "position": "Web Designer",
                "office": "New York",
                "age": 31,
                "startDate": "02-07-2010",
                "salary": 200500
            }
        ];
        this.sortFuncs = {
            "name": (a, b) => strCompare(a.name, b.name),
            "position": (a, b) => strCompare(a.position, b.position),
            "office": (a, b) => strCompare(a.office, b.office),
            "age": (a, b) => a.age - b.age,
            "startDate": (a, b) => strCompare(a.startDate, b.startDate),
            "salary": (a, b) => a.salary - b.salary
        };
    }

    load() {
        this.lists.forEach((obj) => {
            let row = document.createElement("tr");
            [ "name", "position", "office", "age", "startDate", "salary" ].forEach((key) => {
                let elt = document.createElement("td");
                elt.innerHTML = (key == "salary"?"$ ":'') + obj[key];
                row.appendChild(elt);
            });
            document.querySelector("tbody").appendChild(row);
        });
    }

    sort(type) {
        this.lists.sort(this.sortFuncs[type]);
    }

    render() {
        document.querySelector("tbody").remove();
        document.querySelector("table").appendChild(document.createElement("tbody"));
        this.load();
    }
};

let lists = new List();
lists.load();

window.addEventListener("click", (e) => {
    lists.sort('salary');
    lists.render();
});

export default {lists};