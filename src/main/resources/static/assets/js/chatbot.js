var clientStomp = null;
var daKetNoi = false;

function batTatChat() {
    var chatBox = document.getElementById('chat-box');
    if (chatBox.style.display === 'none' || chatBox.style.display === '') {
        chatBox.style.display = 'flex';
        ketNoiWebSocket();
    } else {
        chatBox.style.display = 'none';
    }
}

function ketNoiWebSocket() {
    if (daKetNoi) return;

    var socket = new SockJS('/ws');
    clientStomp = Stomp.over(socket);

    clientStomp.debug = null;

    clientStomp.connect({}, function (frame) {
        daKetNoi = true;

        clientStomp.subscribe('/topic/guicautraloi', function (messageOutput) {
            hienThiTinNhan(messageOutput.body, 'bot');
        });
    }, function (error) {
        console.error('Error: ', error);
    });
}

function guiTinNhan() {
    var input = document.getElementById('msg-input');
    var message = input.value.trim();

    if (message && clientStomp) {
        hienThiTinNhan(message, 'user');

        clientStomp.send("/app/guicauhoi", {}, message);

        input.value = '';
    }
}

function hienThiTinNhan(text, sender) {
    var area = document.getElementById('messages-area');
    var msgDiv = document.createElement('div');
    msgDiv.className = 'message ' + sender;
    msgDiv.innerHTML = text;

    var clearDiv = document.createElement('div');
    clearDiv.style.clear = 'both';

    area.appendChild(msgDiv);
    area.appendChild(clearDiv);

    area.scrollTop = area.scrollHeight;
}

function xuLyEnter(e) {
    if (e.key === 'Enter') guiTinNhan();
}
