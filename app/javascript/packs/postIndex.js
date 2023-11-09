const newBtn = document.getElementById('new-post');
newBtn.addEventListener('click', () => {
    const div = document.getElementById('form')
    div.style.display = 'block'
})

document.addEventListener('change', () => {
    console.log("Change")

    const createBtn = document.getElementById('create-post-button')
    const ind = document.getElementById('indicator')
    createBtn.addEventListener('click', () => {
        ind.showModal()
    })
})


