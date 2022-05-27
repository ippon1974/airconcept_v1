// создаем объект, передавая ему селектор класса .btn
var clip = new ClipboardJS('.btn');

// при успешном копировании, выводим в консоль скопированный текст
clip.on("success", function(e) {
    console.log(e.text);
});