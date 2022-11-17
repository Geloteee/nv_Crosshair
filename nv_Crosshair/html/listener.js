$(function () {
    
    function display(bool, color) {
        if (bool) {
            $("body").fadeIn(100);
            document.getElementById('mira').src = 'img/mira-'+color+'.png';
        } else {
            $("body").fadeOut(100);
            document.getElementById('mira').src = 'img/mira-'+color+'.png';
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type == 'ui') {
            if (item.status == true) {
                display(item.status, item.color)
            } else if (item.status == false) {
                display(item.status, item.color)
            }
        }
    })
})

/* Made by Geloteee#2901 */