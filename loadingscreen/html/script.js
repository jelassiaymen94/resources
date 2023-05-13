var BG = {
	
	lastPage: "home",
	delay: 0,
	
	loadPage: function()
	{
		videoLink.innerHTML = `<iframe id="videoMedia" src="https://www.youtube.com/embed/${CONFIG.videoLink}?autoplay=1&showinfo=0&controls=0&loop=1&playsinline=1&mute=1&rel=0&playlist=${CONFIG.videoLink}" frameborder="0" allow="autoplay" allowfullscreen></iframe>`;
		
		LOAD.onStart();
		BG.setConfig();
		V.onRandomRadio();
		C.loadCursor();
		BG.openingPage("rgba(70, 70, 70, .65)");
		
		setTimeout(function()
		{
			logoImgP.style.opacity = "0";
			logoImgP.style.height = "524px";
			setTimeout(function()
			{
				content.style.opacity = "1";
				logoImgP.style.display = "none";
			}, 1300);
		}, 1800);
	},
	
	clickPage: function(data, page)
	{
		if (page == BG.lastPage) return;
		BG.lastPage = page;
		
		document.querySelectorAll('.item-menu').forEach((el) => { el.dataset.active = '0'; });
        data.dataset.active = '1';
		
		switch (page)
		{
			case "home":
				contentPage.style.right = "-80%";
				videoOverlay.style.background = "rgba(20, 20, 20, 0)";
				BG.delay = 0;
				break;
			case "news":
				BG.openingPage();
				break;
			case "rules":
				BG.openingPage();
				break;
			case "contacts":
				BG.openingPage();
				break;
			case "four":
				BG.openingPage();
				break;
		}
		C.circles.push(new C.cursorBubbles(C.mouse.x, C.mouse.y, 10, 20));
	},
	
	openingPage: function(bgColor)
	{
		contentPage.style.right = "-80%";
		videoOverlay.style.background = "rgba(20, 20, 20, 0)";
		
		setTimeout(function()
		{
			if ("home" == BG.lastPage) return;
			let cntPage = document.getElementById("page"+BG.lastPage);
			document.querySelectorAll('.item-page').forEach((elem) => {elem.style.display = 'none';});
			cntPage.style.display = 'flex';
			headPage.innerText = BG.lastPage;
			
			videoOverlay.style.background = CONFIG.colorMenuBg;
			contentPage.style.right = "0%";
			BG.delay = 1000;
			
		}, BG.delay);
	},
	
	setConfig: function()
	{
		CONFIG.contactsContent.forEach((element) => 
		{
			warpContacts.innerHTML += `<div style='height: 30px;'></div>
										<div class='item-contact'>
											<div style='width: 23px;'></div>
											<img class='contact-avatar' src="${element.avatar}">
											<div class='contact-info'>
												<div class='contact-name'>${element.title}</div>
												<div class='contact-place'>${element.status}</div>
												<div class='contact-description'>${element.desc}</div>
											</div>
										</div>`;
		});
		
		CONFIG.rulesContent.forEach((element) => {warpRules.innerHTML += `<div class="item-rules"><div class="rules-tittle">${element.title}</div>` + BG.resultText(element.text); +`</div>`;});
		CONFIG.newsContent.forEach((element) =>
		{
			warpNews.innerHTML +=  `<div style="height: 20px;"></div>
									<div class="item-news">`+
										(element.img == '' ? '' : `<img id="newsImg" src="${element.img}"/>`)
										+`<div class="news-info">
											<div class="news-head">
												<div class="news-head-title">${element.title}</div>
												<div class="news-head-data">${element.data}</div>
											</div>
											<div class="news-text">${element.text}</div>
										</div>
									</div>`;
		});
	},
	resultText: function(elText)
	{
		let result = '';
        for (let i = 0; i < elText.length; i++) result += `<div class="rules-text">${elText[i].t}</div>`;
		return result;
	}
};

var V = {
	
	isMuted: false,
	
	onClickMute: function(data)
	{
		if (V.isMuted)
		{
			sliderVolume.value = CONFIG.volume;
			audioblock.volume = CONFIG.volume;
			V.isMuted = false;
			V.updateIcon();
		}
		else
		{
			CONFIG.volume = sliderVolume.value;
			sliderVolume.value = 0;
			audioblock.volume = 0;
			V.isMuted = true;
			data.src = "img/volume-mute.png";
		}
	},
	
	updateIcon: function()
	{
		if (CONFIG.volume <= 0) iconVolume.src = "./img/volume-mute.png";
		else if(CONFIG.volume < 0.5) iconVolume.src = "./img/volume-low.png";
		else iconVolume.src = "./img/volume-loud.png";
	},
	
	onChangeVolume: function(data)
	{
        let vol = data.value;
        CONFIG.volume = vol;
        audioblock.volume = vol;
		
		if(V.isMuted == true && vol > 0) V.isMuted = false;
		V.updateIcon();
	},
	
	onChangeVolumeMouseSlider: function(data)
    {
		if(event.buttons == 1) V.onChangeVolume(data);
    },
	
	onRandomRadio: function()
    {
		let idx = V.getRandomInRange(0, CONFIG.musicList.length - 1);
		
        sliderVolume.value = CONFIG.startVolume;		
		
        let audio = document.querySelector('audio');
        audioblock.src = CONFIG.musicList[idx].link;
		
		audio.play();
        audio.volume = CONFIG.startVolume;
		
		V.updateIcon();
		audioName.innerText = CONFIG.musicList[idx].name;
    },
	
	getRandomInRange: function(min,max)
    {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }
};

var LOAD = {
	
	count: 0,
	thisCount: 0,
	
	handlers: {
		
		startInitFunctionOrder(data) 
		{
			LOAD.count = data.count;
		},
		
		initFunctionInvoking(data) 
		{
			let localdata = ((data.idx / LOAD.count) * 100);
			LOAD.updateProgress(localdata);
		},
		
		startDataFileEntries(data) 
		{
			LOAD.count = data.count;
		},
		
		performMapLoadFunction(data) 
		{
			++LOAD.thisCount;
			let localdata = ((LOAD.thisCount / LOAD.count) * 100);
			LOAD.updateProgress(localdata);
		}
	},
	
	updateProgress: function(data)
	{
        progressBar.style.left = '0%';
        progressBar.style.width = data + '%';
		//console.log(data+"%");
	},
	
	onStart: function()
    {
		window.addEventListener('message', (e) => 
		{
			(LOAD.handlers[e.data.eventName] || function() { })(e.data);
		});
    }
};

var C = {
	
	canvas: null,
	ct: null,
	circles: [],
	mouse: { x: 1000, y: 1000 },
	
	colorsMouse: [
		"rgba(0,255,255, x)",
		"rgba(127,255,212, x)",
		"rgba(0,206,209, x)"
	],
	
	loadCursor: function()
	{
		C.canvas = document.querySelector("canvas");
		C.canvas.width = innerWidth;
		C.canvas.height = innerHeight;
		C.ct = C.canvas.getContext("2d");
		C.mouse = { x: innerWidth / 2, y: innerHeight / 2 };		

		window.addEventListener("mousemove", function (e) 
		{
			C.mouse.x = e.x;
			C.mouse.y = e.y;
		});
		
		window.addEventListener("resize", function () 
		{
			C.canvas.width = innerWidth;
			C.canvas.height = innerHeight;
		});		
		
		C.animation(C.mouse.x, C.mouse.y);
	},
	
	cursorBubbles: function(x, y, r, growth, rand)
	{
		this.x = x;
		this.y = y;
		this.r = r;
		this.color = C.colorsMouse[Math.floor(Math.random() * C.colorsMouse.length)];
		this.alpha = 1;
		
		this.draw = function () 
		{
			C.ct.beginPath();
			C.ct.strokeStyle = this.color.replace("x", +this.alpha);
			C.ct.arc(this.x, this.y, this.r, Math.PI * 2, false);
			C.ct.lineWidth = 3;
			C.ct.stroke();
			C.ct.fillStyle = "transparent";
			C.ct.fill();
		};

		this.update = function () 
		{
			this.alpha -= 0.020;
			this.r += growth;
			this.draw();
		};
	},
	
	animation: function()
	{
		requestAnimationFrame(C.animation);
		C.ct.clearRect(0, 0, innerWidth, innerHeight);
		
		var r = Math.random() * 3 + 4;
		C.circles.push(new C.cursorBubbles(C.mouse.x, C.mouse.y, r, -0.5));

		for (let i = 0; i < C.circles.length; ++i)
		{
			C.circles[i].update();
			if (C.circles[i].alpha < 0 || C.circles[i].r < 2) C.circles.splice(i, 1);		
			
		}
	}	
};