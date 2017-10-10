var url_dictionary = {
        alpha: {
            'customerService': "http://alpha-cloud.toast.com/support/faq/",
            'dephase': 'alpha',
             'terms': 'http://alpha-cloud.toast.com/rules/terms.html',
             'privacy': 'https://alpha-id.payco.com/privacyPolicy.nhn',
            'notice': 'http://alpha-cloud.toast.com/support/notice/',
       },
        beta: {
            'customerService': "http://beta-cloud.toast.com/support/faq/",
            'dephase': 'beta',
             'terms': 'http://beta-cloud.toast.com/rules/terms.html',
             'privacy': 'https://beta-id.payco.com/privacyPolicy.nhn',
            'notice': 'http://beta-cloud.toast.com/support/notice/',
       },
        master: {
            'customerService': "http://cloud.toast.com/support/faq/",
            'dephase': 'service',
             'terms': 'http://cloud.toast.com/rules/terms.html',
             'privacy': 'https://id.payco.com/privacyPolicy.nhn',
            'notice': 'http://cloud.toast.com/support/notice/',
       },
};

var version = (READTHEDOCS_DATA['version'] in url_dictionary)? READTHEDOCS_DATA['version']: 'master';

var gnbParams = {
    parentElement: document.getElementById('header'),
    customerService: url_dictionary[version]['customerService'],
    supportLanguage: {
        languageHandler: 'clickLanguageHandler',
		        support: [{name: '�쒓뎅��', code: 'ko_KR'}, 
		                  {name: 'English', code: 'en_US'},
		                  {name: '�ζ쑍沃�', code: 'ja_JP'},
		                  {name: '訝�뻼', code: 'zh_CN'}]
    },
    locale: getUserLocale(),
    useMain: true,
    dephase: url_dictionary[version]['dephase']
};

//  Toast.com GNB Append
var gnb = new TCC.gnb(gnbParams);
gnb.draw();

var footerParam = {
  parentElement: document.getElementById('footer'),
  terms: url_dictionary[version]['terms'],
  privacy: url_dictionary[version]['privacy'],
  notice: url_dictionary[version]['notice'],
  locale: getUserLocale(),
  mailto: 'support@cloud.toast.com',
  useMain: true,
  dephase: url_dictionary[version]['dephase']
};

//  Toast.com footer Append
var footer = new TCC.footer(footerParam);
footer.draw();


function clickLanguageHandler(event) {
    var currentLocale = getCookie("userLocale");
    if(currentLocale) {
        currentLocale = currentLocale.split("_")[0];
    } else {
        currentLocale = "ko";
    }
    (event.preventDefault) ? event.preventDefault() : event.returnValue = false;
    var selectLocale = event.target.getAttribute('code');
    TCC.utils.cookies.set('userLocale', selectLocale);
    gnb.setLocale(selectLocale);
    footer.setLocale(selectLocale);

    var current_location = decodeURIComponent(window.location.pathname).split("/");
    var selectLocaleCode = selectLocale.substring(0,2);
    if(current_location[1] === currentLocale) {
        current_location[1] = selectLocaleCode;
    }
    if(current_location[current_location.length-3] === currentLocale) {
        current_location[current_location.length-3] = selectLocaleCode;
    }
    window.location.href = current_location.join("/");
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}

function getUserLocale(){
	var userLocale = getCookie("userLocale");
	if(userLocale == "" || userLocale == undefined){
		userLocale = "ko_KR";
	}
	return userLocale;
}