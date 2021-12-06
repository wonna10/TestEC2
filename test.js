var testJSON = {
    descriptionA: "Hello",
    descriptionB: "Hi",
    descriptionC: "How are you?"
}

var array = {
    data: [
        {
            section: "Section A", task: [
                {
                    taskName: "Introduction", description: [
                        "Introduction to colleagues and tour of workplace",
                        "Dress code & Staff Identification",
                        "Working hours, breaks",
                        "Absence Reporting/Daily Attendance",
                        "Staff Benefits / In-house Rules and Regulations",
                    ]
                },
                {
                    taskName: "New Task", description: [
                        "New Description 1",
                        "New Description 2",
                        "New Description 3",
                        "New Description 4"
                    ]

                }
            ]
        },
        {
            section: "Section B", task: [{ taskName: "Introudction", description: ["Access and permissions for company's cloud-base storage", "Folder structure"] }]
        }, { section: "Section C", task: [{ taskName: "QMS Awareness", description: ["Policy and Obejectives", "Relevant ISO procedures/ forms", "eISO familarisation", "Safetly Induction & Emergency Procedures"] }] }]
}

var testJSONObject = { "data": [{ "section": "Section A", "task": [{ "taskName": "Introduction", "description": [{ "dId": "1", "description": "Introduction to colleagues and tour of workplace", "employee_sign": "0", "employee_sign_date": "", "supervisor_sign": "0", "supervisor_sign_date": "" }, { "dId": "2", "description": "Dress code & Staff Identification", "employee_sign": "0", "employee_sign_date": "", "supervisor_sign": "0", "supervisor_sign_date": "" }] }] }] }
for (i = 0; i < array.length; i++) {
    console.log(array[i].section);
    for (j = 0; j < array[i].task.length; j++) {
        console.log("\t" + array[i].task[j].taskName);
        for (k = 0; k < array[i].task[j].description.length; k++) {
            console.log("\t\t" + array[i].task[j].description[k]);
        }
    }
    console.log("\n-----");

}

var clause7 = {
    userID: 3,
    employeeNRIC: "G3948300L",
    employeeNo: "A329"
}
