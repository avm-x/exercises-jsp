/**
 * 
 */
let timeJson = {
	hh: initialTimeStr.split(":")[0],
	mm: initialTimeStr.split(":")[1],
	ss: initialTimeStr.split(":")[2],
}

const timeNodes = [document.getElementById("hh"), document.getElementById("mm"), document.getElementById("ss")];


function updateDomTime(domArr, timeObj){
	domArr[0].textContent = timeObj.hh;
	domArr[1].textContent = timeObj.mm;
	domArr[2].textContent = timeObj.ss;
}

function incrementTimeBySeconds(timeObj, seconds){
	let hh = parseInt(timeObj.hh);
	let mm = parseInt(timeObj.mm);
	let ss = parseInt(timeObj.ss);
	
	ss += seconds;
	
	if(ss >= 60){
		mm++;
		ss = ss - 60;
	}
	
	if(mm == 60){
		hh++;
		mm = 0;
	}
	
	if(hh == 24){
		hh = 0;
	}
	
	const newTimeObj = {
		hh: hh,
		mm: mm,
		ss: ss,
	}
	
	return newTimeObj;
}

setInterval(()=> {
	updateDomTime(timeNodes, timeJson);
	timeJson = incrementTimeBySeconds(timeJson, 1);
}, 1000)


