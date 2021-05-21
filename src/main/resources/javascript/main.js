const jtrialCopyMe = (targetId) => {
    if (!navigator.clipboard) {
        alert("copy to clipboard not supported");
    }else{
        /* Get the text field */
        const copyText = document.getElementById(targetId);
        const text = copyText.textContent;

        // navigator.permissions.query({name: "clipboard-write"}).then(result => {
        //     if (result.state == "granted" || result.state == "prompt") {
                navigator.clipboard.writeText(text)
                    .then( () => {
                        console.log(`content : ${text}; is copied successfully`);
                    }).catch(err => {
                    console.log(err);
                });
            // }
        // });
    }
}