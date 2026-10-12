// js/main.js

document.addEventListener('DOMContentLoaded', () => {

/* =======================================================
     1. MOBILE NAVIGATION (HAMBURGER MENU)
     ======================================================= */
  const hamburger = document.getElementById('hamburger');
  const navLinks = document.getElementById('navLinks');
  const allNavItems = navLinks.querySelectorAll('a');

  // Open/Close the menu when the hamburger is clicked
  if (hamburger && navLinks) {
    hamburger.addEventListener('click', () => {
      navLinks.classList.toggle('open');
      hamburger.classList.toggle('is-active'); 
      
      // NEW: Lock background scrolling when menu is open
      if (navLinks.classList.contains('open')) {
        document.body.style.overflow = 'hidden';
      } else {
        document.body.style.overflow = '';
      }
    });
  }

  // Close the menu automatically when a link is clicked
  if (allNavItems.length > 0) {
    allNavItems.forEach(item => {
      item.addEventListener('click', () => {
        navLinks.classList.remove('open');
        if (hamburger) hamburger.classList.remove('is-active');
        
        // NEW: Unlock background scrolling so you can see the new section
        document.body.style.overflow = '';
      });
    });
  }

  /* =======================================================
     2. STICKY NAVBAR SCROLL EFFECT
     ======================================================= */
  const navbar = document.getElementById('navbar');
  
  // Adds a background color and blur to the navbar when you scroll down
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
      } else {
        navbar.classList.remove('scrolled');
      }
    });
  }

  /* =======================================================
     3. TERMINAL TYPING EFFECT (HERO SECTION)
     ======================================================= */
  const typedGreeting = document.getElementById('typedGreeting');
  
  if (typedGreeting) {
    // Phrases that will type out on the screen
    const phrases = [
      "Hello, World!", 
      "System.out.println(\"Hi!\");", 
      "console.log(\"Welcome\");"
    ];
    
    let currentIndex = 0;
    let charIndex = 0;
    let isDeleting = false;
    
    function typeEffect() {
      const currentPhrase = phrases[currentIndex];
      
      if (isDeleting) {
        // Remove a character
        typedGreeting.textContent = currentPhrase.substring(0, charIndex - 1);
        charIndex--;
      } else {
        // Add a character
        typedGreeting.textContent = currentPhrase.substring(0, charIndex + 1);
        charIndex++;
      }
      
      // Control typing speed
      let typeSpeed = isDeleting ? 50 : 100;
      
      // Pause at the end of a phrase before deleting
      if (!isDeleting && charIndex === currentPhrase.length) {
        typeSpeed = 2000; 
        isDeleting = true;
      } 
      // Move to the next phrase when finished deleting
      else if (isDeleting && charIndex === 0) {
        isDeleting = false;
        currentIndex = (currentIndex + 1) % phrases.length;
        typeSpeed = 500;
      }
      
      setTimeout(typeEffect, typeSpeed);
    }
    
    // Start the animation after a short delay
    setTimeout(typeEffect, 1000);
  }
});