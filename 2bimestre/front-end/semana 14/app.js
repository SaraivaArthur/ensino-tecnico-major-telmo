if ('serviceWorker' in navigator) {

  navigator.serviceWorker
    .register('./service-worker.js')

    .then(() => {
      console.log('Service Worker registrado.');
    })

    .catch(error => {
      console.log('Erro:', error);
    });

}

const botao = document.getElementById('btnNotificar');

botao.addEventListener('click', async () => {

  if (!('Notification' in window)) {

    alert('Navegador não suporta notificações.');

    return;
  }

  const permissao = await Notification.requestPermission();

  if (permissao === 'granted') {

    new Notification('PWA funcionando!', {
      body: 'Esta é uma notificação local de teste.'
    });

  } else {

    alert('Permissão negada.');

  }

});