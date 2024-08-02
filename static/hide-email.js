var link = document.getElementById("contact-point");
link.href = "mailto:" + atob(link.dataset.contact);
link.innerText = atob(link.dataset.contact);
