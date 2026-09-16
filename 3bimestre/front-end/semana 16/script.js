document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("#login-form");
  const button = document.querySelector("#entrar");

  if (typeof gsap !== "undefined") {
    gsap.from("form input, #entrar", {
      opacity: 0,
      y: 30,
      duration: 0.6,
      stagger: 0.15,
      ease: "power2.out",
    });

    button.addEventListener("mouseenter", () => {
      gsap.to(button, {
        scale: 1.05,
        duration: 0.4,
        repeat: -1,
        yoyo: true,
        ease: "power1.inOut",
      });
    });

    button.addEventListener("mouseleave", () => {
      gsap.killTweensOf(button);
      gsap.to(button, { scale: 1, duration: 0.2 });
    });
  }

  form.addEventListener("submit", (event) => {
    event.preventDefault();

    button.disabled = true;
    button.textContent = "Carregando...";
    button.classList.add("loading");
    button.setAttribute("aria-busy", "true");

    setTimeout(() => {
      button.disabled = false;
      button.textContent = "Entrar";
      button.classList.remove("loading");
      button.removeAttribute("aria-busy");
    }, 3000);
  });
});